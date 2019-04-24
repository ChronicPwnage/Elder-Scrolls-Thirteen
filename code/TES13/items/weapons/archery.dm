//archery
//bow and arrow code goes in here
//arrow variations go in arrows.dm

/obj/item/gun/bow
	name = "hunting bow"
	desc = "A simple wooden hunting bow."
	icon = 'icons/obj/guns/projectile.dmi'
	icon_state = "bow"
	item_state = "bow"
	w_class = WEIGHT_CLASS_BULKY
	materials = list(MAT_METAL=2000)
	slot_flags = 0
	throwforce = 5
	throw_speed = 3
	throw_range = 5
	force = 10
	slowdown = 0
	item_flags = NEEDS_PERMIT | SLOWS_WHILE_IN_HAND
	weapon_weight = WEAPON_HEAVY //two-handed
	var/list/arrows = new/list()
	var/max_arrows = 1
	var/drawn = 0
	var/draw_slowdown = 4
	var/slowdown_store = 0 //equal to slowdown
	var/arrowtype = /obj/item/weapon/arrow/bow
	var/arrowname = "arrow"

/obj/item/gun/bow/examine(mob/user)
	..()
	to_chat(user, "<b>Alt + click</b> to remove \an [arrowname].")
	if(max_arrows > 1)
		to_chat(user, "[arrows.len] / [max_arrows] [arrowname]s loaded.")

/obj/item/gun/bow/attackby(obj/item/I, mob/user, params)

	if((istype(I, arrowtype)))
		if(arrows.len < max_arrows)
			if(!user.transferItemToLoc(I, src))
				return
			arrows += I
			to_chat(user, "<span class='notice'>You nock \an [I] to \the [src].</span>")
			if(icon_state == "[initial(icon_state)]")
				icon_state = "[initial(icon_state)]_loaded"
			update_icon()
			recharge_newshot()
			if(max_arrows > 1)
				to_chat(user, "<span class='notice'>[arrows.len] / [max_arrows] [arrowname]s.</span>")
		else
			to_chat(usr, "<span class='danger'>\The [src] already has \an [arrowname] nocked.</span>")

/obj/item/gun/bow/can_shoot()
	if(drawn == 1)
		return arrows.len
	else
		return FALSE

/obj/item/gun/bow/attack_self(mob/user)
	if(drawn == 0 && arrows.len)
		to_chat(user, "<span class='notice'>You draw \the [src].</span>")
		slowdown = draw_slowdown
		icon_state = "[initial(icon_state)]_firing"
		drawn = 1
		update_icon()
	else if(drawn == 1)
		to_chat(user, "<span class='notice'>You release the tension on \the [src].</span>")
		slowdown = slowdown_store
		icon_state = "[initial(icon_state)]_loaded"
		drawn = 0
		update_icon()
	else
		to_chat(user, "<span class='notice'>You probably shouldn't draw the string back without \an [arrowname] ready.</span>")
		return

/obj/item/gun/bow/AltClick(mob/user)
	if(arrows.len)
		var/obj/item/weapon/arrow/F = arrows[1]
		arrows -= F
		to_chat(user, "<span class='notice'>You remove \the [F] from \the [src].</span>")
		user.put_in_hands(F)
		F.add_fingerprint(user)
		F.forceMove(user.loc)
		user.put_in_hands(F)
		if(!arrows.len)
			icon_state = "[initial(icon_state)]"
			drawn = 0
			slowdown = slowdown_store
			update_icon()

/obj/item/gun/bow/Initialize()
	. = ..()
	chambered = new /obj/item/ammo_casing/arrow(src)

/obj/item/gun/bow/handle_atom_del(atom/A)
	. = ..()
	if(A in arrows)
		arrows.Remove(A)

/obj/item/gun/bow/recharge_newshot()
	if(!arrows.len)
		return
	chambered.newshot()

/obj/item/gun/bow/process_chamber()
	if(chambered && !chambered.BB) //we just fired
		recharge_newshot()

/obj/item/gun/bow/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)
	..()
	if(!arrows.len)
		icon_state = "[initial(icon_state)]"
		drawn = 0
		slowdown = slowdown_store
		update_icon()

/obj/item/gun/bow/shoot_with_empty_chamber(mob/living/user as mob|obj)
	if(arrows.len)
		to_chat(user, "<span class='danger'>You need to draw back the string on \the [src]!</span>")
	else
		to_chat(user, "<span class='danger'>There's no [arrowname] in \the [src]!</span>")

/obj/item/gun/bow/crossbow
	name = "crossbow"
	desc = "A sturdy wood-and-steel crossbow."
	icon = 'icons/obj/guns/projectile.dmi'
	icon_state = "crossbow"
	item_state = "bow"
	arrowtype = /obj/item/weapon/arrow/crossbow
	arrowname = "bolt"
	draw_slowdown = 2

/obj/item/gun/bow/crossbow/repeater
	name = "repeater crossbow"
	desc = "A sturdy wood-and-steel crossbow. This one is capable of firing multiple bolts."
	icon = 'icons/obj/guns/projectile.dmi'
	icon_state = "crossbow"
	item_state = "bow"
	max_arrows = 5

/obj/item/gun/bow/crossbow/light
	name = "light crossbow"
	desc = "A small crossbow made from light wood and steel. It's designed to be fired one-handed."
	icon = 'icons/obj/guns/projectile.dmi'
	arrowtype = /obj/item/weapon/arrow/lightcrossbow
	icon_state = "crossbow"
	item_state = "bow"
	draw_slowdown = 0
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM // one-handed

/obj/item/weapon/arrow
	name = "placeholder arrow"
	desc = "A sturdy wooden arrow tipped with iron. You shouldn't really be seeing this."
	icon = 'icons/obj/ammo.dmi'
	icon_state = "arrow"
	item_state = "arrow"
	throwforce = 10
	throw_range = 6
	var/recoverchance = 0 //% for arrow to remain after being fired
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/ammo_casing/arrow
	name = "bowstring"
	desc = "A sinew bowstring."
	projectile_type = /obj/item/projectile/bullet/dart/arrow
	firing_effect_type = null

/obj/item/projectile/bullet/dart/arrow
	name = "arrow"
	icon_state = "arrow"
	piercing = TRUE
	damage = 10

/obj/item/ammo_casing/arrow/ready_proj(atom/target, mob/living/user, quiet, zone_override = "")
	if(!BB)
		return
	if(istype(loc, /obj/item/gun/bow))
		var/obj/item/gun/bow/SG = loc
		if(!SG.arrows.len)
			return

		var/obj/item/weapon/arrow/S = SG.arrows[1]

		S.reagents.trans_to(BB, S.reagents.total_volume, 0.5, transfered_by = user)
		BB.name = S.name
		SG.arrows.Remove(S)
		if(!prob(S.recoverchance))
			qdel(S)
		else
			S.forceMove(target.loc)
	..()

/obj/item/weapon/arrow/Initialize()
	. = ..()
	create_reagents(10, OPENCONTAINER)



// quivers and bolt cases



/obj/item/storage/backpack/quiver
	name = "quiver"
	desc = "A quiver for holding arrows."
	icon_state = "quiver"
	item_state = "quiver"
	var/arrowtype = /obj/item/weapon/arrow/bow

/obj/item/storage/backpack/quiver/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.max_items = 24
	STR.max_combined_w_class = 72
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.display_numerical_stacking = TRUE
	STR.can_hold = typecacheof(list(arrowtype))

/obj/item/storage/backpack/quiver/full/PopulateContents()
	for(var/i in 1 to 24)
		new /obj/item/weapon/arrow/bow(src)

/obj/item/storage/backpack/quiver/crossbow
	name = "bolt case"
	desc = "A crossbow quarrel for holding bolts."
	icon = 'icons/obj/clothing/belts.dmi' //placeholder
	icon_state = "bandolier" //placeholder
	item_state = "bandolier" //placeholder
	slot_flags = ITEM_SLOT_BELT
	arrowtype = list(/obj/item/weapon/arrow/crossbow, /obj/item/weapon/arrow/lightcrossbow)

/obj/item/storage/backpack/quiver/crossbow/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.max_items = 24
	STR.max_combined_w_class = 48
	STR.max_w_class = WEIGHT_CLASS_SMALL
	STR.display_numerical_stacking = TRUE
	STR.can_hold = typecacheof(list(arrowtype))

/obj/item/storage/backpack/quiver/crossbow/full/PopulateContents()
	for(var/i in 1 to 24)
		new /obj/item/weapon/arrow/crossbow(src)

/obj/item/storage/backpack/quiver/crossbow/light/full/PopulateContents()
	for(var/i in 1 to 24)
		new /obj/item/weapon/arrow/lightcrossbow(src)