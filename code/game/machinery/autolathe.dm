#define AUTOLATHE_MAIN_MENU       1
#define AUTOLATHE_CATEGORY_MENU   2
#define AUTOLATHE_SEARCH_MENU     3

/obj/machinery/autolathe
	name = "forge"
	desc = "A blacksmith's forge capable of creating items out of metal. There's a container for storing ingots."
	icon_state = "forge"
	density = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = 10
	active_power_usage = 100
	circuit = /obj/item/circuitboard/machine/autolathe
	layer = BELOW_OBJ_LAYER
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF

	var/operating = FALSE
	var/list/L = list()
	var/list/LL = list()
	var/hacked = FALSE
	var/disabled = 0
	var/shocked = FALSE
	var/hack_wire
	var/disable_wire
	var/shock_wire

	var/busy = FALSE
	var/prod_coeff = 1

	var/datum/design/being_built
	var/datum/techweb/stored_research
	var/list/datum/design/matching_designs
	var/selected_category
	var/screen = 1
	var/base_price = 25
	var/hacked_price = 50

	var/list/categories = list(
							"Iron",
							"Steel",
							"Elven",
							"Orcish",
							"Dwarven",
							"Malachite",
							"Ebony",
							"Dragon",
							"Misc",
							"Materials"
							)

/obj/machinery/autolathe/Initialize()
	AddComponent(/datum/component/material_container, list(MAT_METAL, MAT_GLASS, MAT_LEATHER, MAT_CORUNDUM, MAT_ELVEN, MAT_ORCISH, MAT_DWARVEN, MAT_MALACHITE, MAT_EBONY, MAT_DRAGON), 0, TRUE, null, null, CALLBACK(src, .proc/AfterMaterialInsert))
	. = ..()

	wires = new /datum/wires/autolathe(src)
	stored_research = new /datum/techweb/specialized/autounlocking/autolathe
	matching_designs = list()

/obj/machinery/autolathe/Destroy()
	QDEL_NULL(wires)
	return ..()

/obj/machinery/autolathe/ui_interact(mob/user)
	. = ..()
	if(isliving(user))
		var/mob/living/L = user
		if(!L.has_trait(TRAIT_BLACKSMITH))
			to_chat(user, "<span class='warning'>You're not really sure how you'd go about using this. Blacksmithing is harder than it looks.</span>")
			return
	if(!is_operational())
		return

	if(shocked && !(stat & NOPOWER))
		shock(user,50)

	var/dat

	switch(screen)
		if(AUTOLATHE_MAIN_MENU)
			dat = main_win(user)
		if(AUTOLATHE_CATEGORY_MENU)
			dat = category_win(user,selected_category)
		if(AUTOLATHE_SEARCH_MENU)
			dat = search_win(user)

	var/datum/browser/popup = new(user, "autolathe", name, 400, 500)
	popup.set_content(dat)
	popup.open()

/obj/machinery/autolathe/on_deconstruction()
	GET_COMPONENT(materials, /datum/component/material_container)
	materials.retrieve_all()

/obj/machinery/autolathe/attackby(obj/item/O, mob/user, params)
	if (busy)
		to_chat(user, "<span class=\"alert\">The forge is busy. Please wait for completion of previous operation.</span>")
		return TRUE

	if(default_deconstruction_crowbar(O))
		return TRUE

	if(panel_open && is_wire_tool(O))
		wires.interact(user)
		return TRUE

	if(user.a_intent == INTENT_HARM) //so we can hit the machine
		return ..()

	if(stat)
		return TRUE

	if(istype(O, /obj/item/disk/design_disk))
		user.visible_message("[user] begins to load \the [O] in \the [src]...",
			"You begin to load a design from \the [O]...",
			"You hear the chatter of a floppy drive.")
		busy = TRUE
		var/obj/item/disk/design_disk/D = O
		if(do_after(user, 14.4, target = src))
			for(var/B in D.blueprints)
				if(B)
					stored_research.add_design(B)
		busy = FALSE
		return TRUE

	return ..()

/obj/machinery/autolathe/proc/AfterMaterialInsert(type_inserted, id_inserted, amount_inserted)
	if(ispath(type_inserted, /obj/item/stack/ore/bluespace_crystal))
		use_power(MINERAL_MATERIAL_AMOUNT / 10)
	else
		use_power(min(1000, amount_inserted / 100))
	updateUsrDialog()

/obj/machinery/autolathe/Topic(href, href_list)
	if(..())
		return
	if (!busy)
		if(href_list["menu"])
			screen = text2num(href_list["menu"])
			updateUsrDialog()

		if(href_list["category"])
			selected_category = href_list["category"]
			updateUsrDialog()

		if(href_list["make"])

			/////////////////
			//href protection
			being_built = stored_research.isDesignResearchedID(href_list["make"])
			if(!being_built)
				return

			var/multiplier = text2num(href_list["multiplier"])
			var/is_stack = ispath(being_built.build_path, /obj/item/stack)
			multiplier = CLAMP(multiplier,1,50)

			/////////////////

			var/coeff = (is_stack ? 1 : prod_coeff) //stacks are unaffected by production coefficient
			var/metal_cost = being_built.materials[MAT_METAL]
			var/glass_cost = being_built.materials[MAT_GLASS]
			var/leather_cost = being_built.materials[MAT_LEATHER]
			var/corundum_cost = being_built.materials[MAT_CORUNDUM]
			var/elven_cost = being_built.materials[MAT_ELVEN]
			var/orcish_cost = being_built.materials[MAT_ORCISH]
			var/dwarven_cost = being_built.materials[MAT_DWARVEN]
			var/malachite_cost = being_built.materials[MAT_MALACHITE]
			var/ebony_cost = being_built.materials[MAT_EBONY]
			var/dragon_cost = being_built.materials[MAT_DRAGON]

			var/power = max(2000, (metal_cost+glass_cost)*multiplier/5)

			GET_COMPONENT(materials, /datum/component/material_container)
			if(
				(materials.amount(MAT_METAL) >= metal_cost*multiplier*coeff
				) && (materials.amount(MAT_GLASS) >= glass_cost*multiplier*coeff
				) &&  (materials.amount(MAT_LEATHER) >= leather_cost*multiplier*coeff
				) &&  (materials.amount(MAT_CORUNDUM) >= corundum_cost*multiplier*coeff
				) &&  (materials.amount(MAT_ELVEN) >= elven_cost*multiplier*coeff
				) &&  (materials.amount(MAT_ORCISH) >= orcish_cost*multiplier*coeff
				) &&  (materials.amount(MAT_DWARVEN) >= dwarven_cost*multiplier*coeff
				) &&  (materials.amount(MAT_MALACHITE) >= malachite_cost*multiplier*coeff
				) &&  (materials.amount(MAT_EBONY) >= ebony_cost*multiplier*coeff
				) &&  (materials.amount(MAT_DRAGON) >= dragon_cost*multiplier*coeff
				))
				busy = TRUE
				use_power(power)
				icon_state = "forge_n"
				var/time = is_stack ? 32 : (32 * coeff * multiplier) ** 0.8
				addtimer(CALLBACK(src, .proc/make_item, power, metal_cost, glass_cost, leather_cost, corundum_cost, elven_cost, orcish_cost,
														 dwarven_cost, malachite_cost, ebony_cost, dragon_cost, multiplier, coeff, is_stack), time)

		if(href_list["search"])
			matching_designs.Cut()

			for(var/v in stored_research.researched_designs)
				var/datum/design/D = SSresearch.techweb_design_by_id(v)
				if(findtext(D.name,href_list["to_search"]))
					matching_designs.Add(D)
			updateUsrDialog()
	else
		to_chat(usr, "<span class=\"alert\">The forge is busy. Please wait for completion of previous operation.</span>")

	updateUsrDialog()

	return

/obj/machinery/autolathe/proc/make_item(power, metal_cost, glass_cost, leather_cost, corundum_cost, elven_cost, orcish_cost,
														 dwarven_cost, malachite_cost, ebony_cost, dragon_cost, multiplier, coeff, is_stack)
	GET_COMPONENT(materials, /datum/component/material_container)
	var/atom/A = drop_location()
	use_power(power)
	var/list/materials_used = list(MAT_METAL=metal_cost*coeff*multiplier,
									MAT_GLASS=glass_cost*coeff*multiplier,
									MAT_LEATHER=leather_cost*coeff*multiplier,
									MAT_CORUNDUM=corundum_cost*coeff*multiplier,
									MAT_ELVEN=elven_cost*coeff*multiplier,
									MAT_ORCISH=orcish_cost*coeff*multiplier,
									MAT_DWARVEN=dwarven_cost*coeff*multiplier,
									MAT_MALACHITE=malachite_cost*coeff*multiplier,
									MAT_EBONY=ebony_cost*coeff*multiplier,
									MAT_DRAGON=dragon_cost*coeff*multiplier)
	materials.use_amount(materials_used)

	if(is_stack)
		var/obj/item/stack/N = new being_built.build_path(A, multiplier)
		N.update_icon()
		N.autolathe_crafted(src)
	else
		for(var/i=1, i<=multiplier, i++)
			var/obj/item/new_item = new being_built.build_path(A)
			new_item.materials = new_item.materials.Copy()
			for(var/mat in materials_used)
				new_item.materials[mat] = materials_used[mat] / multiplier
			new_item.autolathe_crafted(src)
	icon_state = "forge"
	busy = FALSE
	updateDialog()

/obj/machinery/autolathe/RefreshParts()
	var/T = 0
	for(var/obj/item/stock_parts/matter_bin/MB in component_parts)
		T += MB.rating*750000
	GET_COMPONENT(materials, /datum/component/material_container)
	materials.max_amount = T
	T=1.2
	for(var/obj/item/stock_parts/manipulator/M in component_parts)
		T -= M.rating*0.2
	prod_coeff = min(1,max(0,T)) // Coeff going 1 -> 0,8 -> 0,6 -> 0,4

/obj/machinery/autolathe/proc/main_win(mob/user)
	var/dat = "<div class='statusDisplay'><h3>Forge Recipes:</h3><br>"
	dat += materials_printout()

	dat += "<form name='search' action='?src=[REF(src)]'>\
	<input type='hidden' name='src' value='[REF(src)]'>\
	<input type='hidden' name='search' value='to_search'>\
	<input type='hidden' name='menu' value='[AUTOLATHE_SEARCH_MENU]'>\
	<input type='text' name='to_search'>\
	<input type='submit' value='Search'>\
	</form><hr>"

	var/line_length = 1
	dat += "<table style='width:100%' align='center'><tr>"

	for(var/C in categories)
		if(line_length > 2)
			dat += "</tr><tr>"
			line_length = 1

		dat += "<td><A href='?src=[REF(src)];category=[C];menu=[AUTOLATHE_CATEGORY_MENU]'>[C]</A></td>"
		line_length++

	dat += "</tr></table></div>"
	return dat

/obj/machinery/autolathe/proc/category_win(mob/user,selected_category)
	var/dat = "<A href='?src=[REF(src)];menu=[AUTOLATHE_MAIN_MENU]'>Return to main menu</A>"
	dat += "<div class='statusDisplay'><h3>Browsing [selected_category]:</h3><br>"
	dat += materials_printout()

	for(var/v in stored_research.researched_designs)
		var/datum/design/D = SSresearch.techweb_design_by_id(v)
		if(!(selected_category in D.category))
			continue

		if(disabled || !can_build(D))
			dat += "<span class='linkOff'>[D.name]</span>"
		else
			dat += "<a href='?src=[REF(src)];make=[D.id];multiplier=1'>[D.name]</a>"

		if(ispath(D.build_path, /obj/item/stack))
			GET_COMPONENT(materials, /datum/component/material_container)
			var/max_multiplier = min(D.maxstack, D.materials[MAT_METAL] ?round(materials.amount(MAT_METAL)/D.materials[MAT_METAL]):INFINITY,
			D.materials[MAT_GLASS]?round(materials.amount(MAT_GLASS)/D.materials[MAT_GLASS]):INFINITY,
			D.materials[MAT_LEATHER]?round(materials.amount(MAT_LEATHER)/D.materials[MAT_LEATHER]):INFINITY,
			D.materials[MAT_CORUNDUM]?round(materials.amount(MAT_CORUNDUM)/D.materials[MAT_CORUNDUM]):INFINITY,
			D.materials[MAT_ELVEN]?round(materials.amount(MAT_ELVEN)/D.materials[MAT_ELVEN]):INFINITY,
			D.materials[MAT_ORCISH]?round(materials.amount(MAT_ORCISH)/D.materials[MAT_ORCISH]):INFINITY,
			D.materials[MAT_DWARVEN]?round(materials.amount(MAT_DWARVEN)/D.materials[MAT_DWARVEN]):INFINITY,
			D.materials[MAT_MALACHITE]?round(materials.amount(MAT_MALACHITE)/D.materials[MAT_MALACHITE]):INFINITY,
			D.materials[MAT_EBONY]?round(materials.amount(MAT_EBONY)/D.materials[MAT_EBONY]):INFINITY,
			D.materials[MAT_DRAGON]?round(materials.amount(MAT_DRAGON)/D.materials[MAT_DRAGON]):INFINITY
			)
			if (max_multiplier>10 && !disabled)
				dat += " <a href='?src=[REF(src)];make=[D.id];multiplier=10'>x10</a>"
			if (max_multiplier>25 && !disabled)
				dat += " <a href='?src=[REF(src)];make=[D.id];multiplier=25'>x25</a>"
			if(max_multiplier > 0 && !disabled)
				dat += " <a href='?src=[REF(src)];make=[D.id];multiplier=[max_multiplier]'>x[max_multiplier]</a>"
		else
			if(!disabled && can_build(D, 5))
				dat += " <a href='?src=[REF(src)];make=[D.id];multiplier=5'>x5</a>"
			if(!disabled && can_build(D, 10))
				dat += " <a href='?src=[REF(src)];make=[D.id];multiplier=10'>x10</a>"

		dat += "[get_design_cost(D)]<br>"

	dat += "</div>"
	return dat

/obj/machinery/autolathe/proc/search_win(mob/user)
	var/dat = "<A href='?src=[REF(src)];menu=[AUTOLATHE_MAIN_MENU]'>Return to main menu</A>"
	dat += "<div class='statusDisplay'><h3>Search results:</h3><br>"
	dat += materials_printout()

	for(var/v in matching_designs)
		var/datum/design/D = v
		if(disabled || !can_build(D))
			dat += "<span class='linkOff'>[D.name]</span>"
		else
			dat += "<a href='?src=[REF(src)];make=[D.id];multiplier=1'>[D.name]</a>"

		if(ispath(D.build_path, /obj/item/stack))
			GET_COMPONENT(materials, /datum/component/material_container)
			var/max_multiplier = min(D.maxstack, D.materials[MAT_METAL] ?round(materials.amount(MAT_METAL)/D.materials[MAT_METAL]):INFINITY,
			D.materials[MAT_GLASS]?round(materials.amount(MAT_GLASS)/D.materials[MAT_GLASS]):INFINITY,
			D.materials[MAT_LEATHER]?round(materials.amount(MAT_LEATHER)/D.materials[MAT_LEATHER]):INFINITY,
			D.materials[MAT_CORUNDUM]?round(materials.amount(MAT_CORUNDUM)/D.materials[MAT_CORUNDUM]):INFINITY,
			D.materials[MAT_ELVEN]?round(materials.amount(MAT_ELVEN)/D.materials[MAT_ELVEN]):INFINITY,
			D.materials[MAT_ORCISH]?round(materials.amount(MAT_ORCISH)/D.materials[MAT_ORCISH]):INFINITY,
			D.materials[MAT_DWARVEN]?round(materials.amount(MAT_DWARVEN)/D.materials[MAT_DWARVEN]):INFINITY,
			D.materials[MAT_MALACHITE]?round(materials.amount(MAT_MALACHITE)/D.materials[MAT_MALACHITE]):INFINITY,
			D.materials[MAT_EBONY]?round(materials.amount(MAT_EBONY)/D.materials[MAT_EBONY]):INFINITY,
			D.materials[MAT_DRAGON]?round(materials.amount(MAT_DRAGON)/D.materials[MAT_DRAGON]):INFINITY
			)
			if (max_multiplier>10 && !disabled)
				dat += " <a href='?src=[REF(src)];make=[D.id];multiplier=10'>x10</a>"
			if (max_multiplier>25 && !disabled)
				dat += " <a href='?src=[REF(src)];make=[D.id];multiplier=25'>x25</a>"
			if(max_multiplier > 0 && !disabled)
				dat += " <a href='?src=[REF(src)];make=[D.id];multiplier=[max_multiplier]'>x[max_multiplier]</a>"

		dat += "[get_design_cost(D)]<br>"

	dat += "</div>"
	return dat

/obj/machinery/autolathe/proc/materials_printout()
	GET_COMPONENT(materials, /datum/component/material_container)
	var/dat = "<b>Total amount:</b> [materials.total_amount] cm<sup>3</sup><br>"
	for(var/mat_id in materials.materials)
		var/datum/material/M = materials.materials[mat_id]
		if(M.amount > 0)
			dat += "<b>[M.name] amount:</b> [M.amount] cm<sup>3</sup><br>"
	return dat

/obj/machinery/autolathe/proc/can_build(datum/design/D, amount = 1)
	if(D.make_reagents.len)
		return FALSE

	var/coeff = (ispath(D.build_path, /obj/item/stack) ? 1 : prod_coeff)

	GET_COMPONENT(materials, /datum/component/material_container)
	if(D.materials[MAT_METAL] && (materials.amount(MAT_METAL) < (D.materials[MAT_METAL] * coeff * amount)))
		return FALSE
	if(D.materials[MAT_GLASS] && (materials.amount(MAT_GLASS) < (D.materials[MAT_GLASS] * coeff * amount)))
		return FALSE
	if(D.materials[MAT_LEATHER] && (materials.amount(MAT_LEATHER) < (D.materials[MAT_LEATHER] * coeff * amount)))
		return FALSE
	if(D.materials[MAT_CORUNDUM] && (materials.amount(MAT_CORUNDUM) < (D.materials[MAT_CORUNDUM] * coeff * amount)))
		return FALSE
	if(D.materials[MAT_ELVEN] && (materials.amount(MAT_ELVEN) < (D.materials[MAT_ELVEN] * coeff * amount)))
		return FALSE
	if(D.materials[MAT_ORCISH] && (materials.amount(MAT_ORCISH) < (D.materials[MAT_ORCISH] * coeff * amount)))
		return FALSE
	if(D.materials[MAT_DWARVEN] && (materials.amount(MAT_DWARVEN) < (D.materials[MAT_DWARVEN] * coeff * amount)))
		return FALSE
	if(D.materials[MAT_MALACHITE] && (materials.amount(MAT_MALACHITE) < (D.materials[MAT_MALACHITE] * coeff * amount)))
		return FALSE
	if(D.materials[MAT_EBONY] && (materials.amount(MAT_EBONY) < (D.materials[MAT_EBONY] * coeff * amount)))
		return FALSE
	if(D.materials[MAT_DRAGON] && (materials.amount(MAT_DRAGON) < (D.materials[MAT_DRAGON] * coeff * amount)))
		return FALSE
	return TRUE

/obj/machinery/autolathe/proc/get_design_cost(datum/design/D)
	var/coeff = (ispath(D.build_path, /obj/item/stack) ? 1 : prod_coeff)
	var/dat
	if(D.materials[MAT_METAL])
		dat += "[D.materials[MAT_METAL] * coeff] metal "
	if(D.materials[MAT_GLASS])
		dat += "[D.materials[MAT_GLASS] * coeff] glass "
	if(D.materials[MAT_LEATHER])
		dat += "[D.materials[MAT_LEATHER] * coeff] leather "
	if(D.materials[MAT_CORUNDUM])
		dat += "[D.materials[MAT_CORUNDUM] * coeff] corundum "
	if(D.materials[MAT_ELVEN])
		dat += "[D.materials[MAT_ELVEN] * coeff] moonstone "
	if(D.materials[MAT_ORCISH])
		dat += "[D.materials[MAT_ORCISH] * coeff] orichalcum "
	if(D.materials[MAT_DWARVEN])
		dat += "[D.materials[MAT_DWARVEN] * coeff] dwarven metal "
	if(D.materials[MAT_MALACHITE])
		dat += "[D.materials[MAT_MALACHITE] * coeff] malachite "
	if(D.materials[MAT_EBONY])
		dat += "[D.materials[MAT_EBONY] * coeff] ebony "
	if(D.materials[MAT_DRAGON])
		dat += "[D.materials[MAT_DRAGON] * coeff] dragonscales "
	return dat

/obj/machinery/autolathe/proc/reset(wire)
	switch(wire)
		if(WIRE_HACK)
			if(!wires.is_cut(wire))
				adjust_hacked(FALSE)
		if(WIRE_SHOCK)
			if(!wires.is_cut(wire))
				shocked = FALSE
		if(WIRE_DISABLE)
			if(!wires.is_cut(wire))
				disabled = FALSE

/obj/machinery/autolathe/proc/shock(mob/user, prb)
	if(stat & (BROKEN|NOPOWER))		// unpowered, no shock
		return FALSE
	if(!prob(prb))
		return FALSE
	var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
	s.set_up(5, 1, src)
	s.start()
	if (electrocute_mob(user, get_area(src), src, 0.7, TRUE))
		return TRUE
	else
		return FALSE

/obj/machinery/autolathe/proc/adjust_hacked(state)
	hacked = state
	for(var/id in SSresearch.techweb_designs)
		var/datum/design/D = SSresearch.techweb_design_by_id(id)
		if((D.build_type & AUTOLATHE) && ("hacked" in D.category))
			if(hacked)
				stored_research.add_design(D)
			else
				stored_research.remove_design(D)

/obj/machinery/autolathe/hacked/Initialize()
	. = ..()
	adjust_hacked(TRUE)

//Called when the object is constructed by an autolathe
//Has a reference to the autolathe so you can do !!FUN!! things with hacked lathes
/obj/item/proc/autolathe_crafted(obj/machinery/autolathe/A)
	return
