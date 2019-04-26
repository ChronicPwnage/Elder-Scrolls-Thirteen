/obj/structure/tanningrack
	name = "tanning rack"
	desc = "A wooden tanning rack used for crafting items out of leather."
	icon = 'icons/obj/cult.dmi' //needs sprites
	icon_state = "anvil" //needs sprites
	resistance_flags = INDESTRUCTIBLE
	density = TRUE
	layer = BELOW_OBJ_LAYER
	anchored = TRUE
	machine_tool_behaviour = list(TOOL_TANNINGRACK)

/obj/structure/tanningrack/wrench_act(mob/living/user, obj/item/I)
	to_chat(user, "<span class='notice'>You start taking apart \the [src]...</span>")
	if(do_after(user, 50, target=src))
		new /obj/item/stack/sheet/mineral/wood(loc, 10)
		qdel(src)
		return

/obj/structure/anvil
	name = "metalworking anvil"
	desc = "An anvil used for making low-quality weapons and armor. You can imagine yourself making iron daggers here for a long time."
	icon = 'icons/obj/cult.dmi'
	icon_state = "anvil"
	resistance_flags = INDESTRUCTIBLE
	density = TRUE
	layer = BELOW_OBJ_LAYER
	anchored = TRUE
	machine_tool_behaviour = list(TOOL_ANVIL)

/obj/structure/anvil/wrench_act(mob/living/user, obj/item/I)
	default_unfasten_wrench(user, I, 10)
	return TRUE


//CRAFTLEATHER

/datum/crafting_recipe/leatherstrip
	name = "Leather strip"
	result = /obj/item/stack/sheet/mineral/TES/leather
	time = 10
	reqs = list(/obj/item/stack/sheet/leather = 1)
	category = CAT_SMITH
	subcategory = CAT_LEATHER
	tools = list(TOOL_TANNINGRACK)

/datum/crafting_recipe/tanningrack
	name = "Tanning rack"
	result = /obj/structure/tanningrack
	time = 100
	reqs = list(/obj/item/stack/sheet/mineral/wood = 10)
	category = CAT_SMITH
	subcategory = CAT_LEATHER

//CRAFTIRON

/datum/crafting_recipe/ironingot
	name = "Iron ingot"
	result = /obj/item/stack/sheet/mineral/TES/iron
	time = 10
	reqs = list(/obj/item/stack/ore/iron = 1)
	category = CAT_SMITH
	subcategory = CAT_IRON

/datum/crafting_recipe/anvil
	name = "Anvil"
	result =  /obj/structure/anvil
	time = 100
	reqs = list(/obj/item/stack/sheet/mineral/TES/iron = 10)
	category = CAT_SMITH
	subcategory = CAT_IRON

/datum/crafting_recipe/irondagger
	name = "Iron dagger"
	result = /obj/item/kitchen/knife/dagger
	time = 30
	reqs = list(/obj/item/stack/sheet/mineral/TES/iron = 1,
				/obj/item/stack/sheet/mineral/TES/leather = 1)
	tools = list(TOOL_ANVIL)
	category = CAT_SMITH
	subcategory = CAT_IRON

/datum/crafting_recipe/ironsword
	name = "Iron sword"
	result = /obj/item/claymore/sword
	time = 30
	reqs = list(/obj/item/stack/sheet/mineral/TES/iron = 3,
				/obj/item/stack/sheet/mineral/TES/leather = 2)
	tools = list(TOOL_ANVIL)
	category = CAT_SMITH
	subcategory = CAT_IRON

/datum/crafting_recipe/ironmace
	name = "Iron mace"
	result = /obj/item/claymore/mace
	time = 30
	reqs = list(/obj/item/stack/sheet/mineral/TES/iron = 3,
				/obj/item/stack/sheet/mineral/TES/leather = 2)
	tools = list(TOOL_ANVIL)
	category = CAT_SMITH
	subcategory = CAT_IRON

/datum/crafting_recipe/ironaxe
	name = "Iron waraxe"
	result = /obj/item/hatchet/waraxe
	time = 30
	reqs = list(/obj/item/stack/sheet/mineral/TES/iron = 3,
				/obj/item/stack/sheet/mineral/TES/leather = 2)
	tools = list(TOOL_ANVIL)
	category = CAT_SMITH
	subcategory = CAT_IRON

/datum/crafting_recipe/ironspear
	name = "Iron spear"
	result = /obj/item/twohanded/fireaxe/spear
	time = 30
	reqs = list(/obj/item/stack/sheet/mineral/TES/iron = 5,
				/obj/item/stack/sheet/mineral/TES/leather = 3)
	tools = list(TOOL_ANVIL)
	category = CAT_SMITH
	subcategory = CAT_IRON

/datum/crafting_recipe/ironbaxe
	name = "Iron battleaxe"
	result = /obj/item/twohanded/fireaxe/baxe
	time = 30
	reqs = list(/obj/item/stack/sheet/mineral/TES/iron = 5,
				/obj/item/stack/sheet/mineral/TES/leather = 3)
	tools = list(TOOL_ANVIL)
	category = CAT_SMITH
	subcategory = CAT_IRON

/datum/crafting_recipe/ironwarham
	name = "Iron warhammer"
	result = /obj/item/twohanded/fireaxe/warham
	time = 30
	reqs = list(/obj/item/stack/sheet/mineral/TES/iron = 5,
				/obj/item/stack/sheet/mineral/TES/leather = 3)
	tools = list(TOOL_ANVIL)
	category = CAT_SMITH
	subcategory = CAT_IRON