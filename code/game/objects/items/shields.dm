/obj/item/shield
	name = "shield"
	icon = 'icons/obj/shields.dmi'
	lefthand_file = 'icons/mob/inhands/equipment/shields_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/shields_righthand.dmi'
	block_chance = 50
	slowdown = 0
	armor = list("melee" = 50, "bullet" = 50, "laser" = 50, "energy" = 0, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 80, "acid" = 70)
	attack_verb = list("shoved", "bashed")
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	max_integrity = 200
	var/cooldown = 0
	var/shield_type = "kite"
	var/main_material = "iron"
	var/materials_deconstruct = list(MAT_IRON=4, MAT_LEATHER=2)
	var/transparent = FALSE	// makes beam projectiles pass through the shield
	var/broken_shield = "/obj/item/shield/broken" // the broken version of the shield, to drop upon breaking

/obj/item/shield/proc/on_shield_block(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", damage = 0, attack_type = MELEE_ATTACK)
	return TRUE

/obj/item/shield/on_shield_block(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", damage = 0, attack_type = MELEE_ATTACK)
	if (obj_integrity <= damage)
		var/turf/T = get_turf(owner)
		T.visible_message("<span class='warning'>[hitby] destroys [src]!</span>")
		shield_break(owner)
		qdel(src)
		return FALSE
	take_damage(damage)
	return ..()

/obj/item/shield/broken
	name = "broken shield"
	icon_state = "shield_broken"
	block_chance = 10
	force = 5
	materials_deconstruct = list(MAT_IRON=1, MAT_LEATHER=1)
	main_material = "iron"
	max_integrity = 100

/obj/item/shield/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(transparent && (hitby.pass_flags & PASSGLASS))
		return FALSE
	if(attack_type == THROWN_PROJECTILE_ATTACK)
		final_block_chance += 30
	if(attack_type == LEAP_ATTACK)
		final_block_chance = 100
	return ..()

/obj/item/shield/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/melee/baton))
		if(cooldown < world.time - 25)
			user.visible_message("<span class='warning'>[user] bashes [src] with [W]!</span>")
			playsound(user.loc, 'sound/effects/shieldbash.ogg', 50, 1)
			cooldown = world.time
	/*
	//TODO: In-the-field shield repair?
	else if(istype(W, /obj/item/stack/sheet/mineral/titanium))
		if (obj_integrity >= max_integrity)
			to_chat(user, "<span class='notice'>[src] is already in perfect condition.</span>")
		 else
			var/obj/item/stack/sheet/mineral/titanium/T = W
			T.use(1)
			obj_integrity = max_integrity
			to_chat(user, "<span class='notice'>You repair [src] with [T].</span>")
	*/
	else
		return ..()



/obj/item/shield/proc/shield_break(mob/living/carbon/human/owner)
	//playsound(owner, 'sound/effects/glassbr3.ogg', 100) //TODO: Replace, make it play for everyone
	new broken_shield((get_turf(src)))

/obj/item/shield/examine(mob/user)
	..()
	var/healthpercent = round((obj_integrity/max_integrity) * 100, 1)
	switch(healthpercent)
		if(50 to 99)
			to_chat(user, "<span class='info'>It looks slightly damaged.</span>")
		if(25 to 50)
			to_chat(user, "<span class='info'>It appears heavily damaged.</span>")
		if(0 to 25)
			to_chat(user, "<span class='warning'>It's falling apart!</span>")

								/////	KITESHIELDS	/////
								/////	IRON KITESHIELD	/////
/obj/item/shield/kite/iron
	shield_type = "kite"
	name = "iron kiteshield"
	desc = "A mid-sized shield that balances mobility and protection. This one is made out of iron."
	icon_state = "kiteshield_iron"
	block_chance = 50
	slowdown = 0.5
	force = 25
	throwforce = 10
	throw_speed = 2
	throw_range = 3
	materials_deconstruct = list(MAT_IRON=5, MAT_LEATHER=2)
	main_material = "iron"
	max_integrity = 200
	broken_shield = "/obj/item/shield/kite/iron/broken" // the broken version of the shield, to drop upon breaking

/obj/item/shield/kite/iron/broken
	name = "broken iron kiteshield"
	desc = "A mid-sized shield that balances mobility and protection. This one is made out of iron, and is broken beyond any use as a shield and must be repaired."
	icon_state = "kiteshield_iron"
	block_chance = 0
	force = 10
	materials_deconstruct = list(MAT_IRON=1, MAT_LEATHER=1)
/*
/obj/item/shield/kite/proc/shield_break(mob/living/carbon/human/owner)
	//playsound(owner, 'sound/effects/glassbr3.ogg', 100) //TODO: Replace, make it play for everyone
	new /obj/item/shield/kite/iron/broken((get_turf(src)))
*/
									/////	STEEL KITESHIELD	/////

									/////	ORCISH KITESHIELD	/////

									/////	DWEMER KITESHIELD	/////

									/////	SQUARE SHIELDS	/////
/obj/item/shield/square/iron
	shield_type = "square"
	name = "iron square shield"
	desc = "A large-sized shield that sacrifices mobility for protection. This one is made out of iron."
	icon_state = "squareshield_iron"
	block_chance = 70
	slowdown = 1
	force = 15
	throwforce = 10
	throw_speed = 2
	throw_range = 1
	materials_deconstruct = list(MAT_IRON=7, MAT_LEATHER=2)
	main_material = "iron"
	max_integrity = 300

/obj/item/shield/kite/iron/broken
	name = "broken iron kiteshield"
	desc = "A mid-sized shield that balances mobility and protection. This one is made out of iron, and is broken beyond any use as a shield and must be repaired."
	icon_state = "kiteshield_iron"
	block_chance = 0
	force = 10
	materials_deconstruct = list(MAT_IRON=1, MAT_LEATHER=1)

/obj/item/shield/riot/roman
	name = "\improper Roman shield"
	desc = "Bears an inscription on the inside: <i>\"Romanes venio domus\"</i>."
	icon_state = "roman_shield"
	item_state = "roman_shield"
	lefthand_file = 'icons/mob/inhands/equipment/shields_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/shields_righthand.dmi'
	transparent = FALSE
	materials_deconstruct = list(MAT_METAL=8500)
	max_integrity = 65

/obj/item/shield/riot/roman/fake
	desc = "Bears an inscription on the inside: <i>\"Romanes venio domus\"</i>. It appears to be a bit flimsy."
	block_chance = 0
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 30

/obj/item/shield/riot/roman/shield_break(mob/living/carbon/human/owner)
	playsound(owner, 'sound/effects/grillehit.ogg', 100)
	new /obj/item/stack/sheet/metal(get_turf(src))

/obj/item/shield/riot/buckler
	name = "wooden buckler"
	desc = "A medieval wooden buckler."
	icon_state = "buckler"
	item_state = "buckler"
	lefthand_file = 'icons/mob/inhands/equipment/shields_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/shields_righthand.dmi'
	materials_deconstruct = list()
	resistance_flags = FLAMMABLE
	block_chance = 30
	transparent = FALSE
	max_integrity = 55
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/shield/riot/buckler/shield_break(mob/living/carbon/human/owner)
	playsound(owner, 'sound/effects/bang.ogg', 50)
	new /obj/item/stack/sheet/mineral/wood(get_turf(src))

/obj/item/shield/riot/flash
	name = "strobe shield"
	desc = "A shield with a built in, high intensity light capable of blinding and disorienting suspects. Takes regular handheld flashes as bulbs."
	icon_state = "flashshield"
	item_state = "flashshield"
	var/obj/item/assembly/flash/handheld/embedded_flash

/obj/item/shield/riot/flash/Initialize()
	. = ..()
	embedded_flash = new(src)

/obj/item/shield/riot/flash/attack(mob/living/M, mob/user)
	. =  embedded_flash.attack(M, user)
	update_icon()

/obj/item/shield/riot/flash/attack_self(mob/living/carbon/user)
	. = embedded_flash.attack_self(user)
	update_icon()

/obj/item/shield/riot/flash/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	. = ..()
	if (. && !embedded_flash.burnt_out)
		embedded_flash.activate()
		update_icon()


/obj/item/shield/riot/flash/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/assembly/flash/handheld))
		var/obj/item/assembly/flash/handheld/flash = W
		if(flash.burnt_out)
			to_chat(user, "No sense replacing it with a broken bulb.")
			return
		else
			to_chat(user, "You begin to replace the bulb.")
			if(do_after(user, 20, target = user))
				if(flash.burnt_out || !flash || QDELETED(flash))
					return
				playsound(src, 'sound/items/deconstruct.ogg', 50, TRUE)
				qdel(embedded_flash)
				embedded_flash = flash
				flash.forceMove(src)
				update_icon()
				return
	..()

/obj/item/shield/riot/flash/emp_act(severity)
	. = ..()
	embedded_flash.emp_act(severity)
	update_icon()

/obj/item/shield/riot/flash/update_icon()
	if(!embedded_flash || embedded_flash.burnt_out)
		icon_state = "riot"
		item_state = "riot"
	else
		icon_state = "flashshield"
		item_state = "flashshield"

/obj/item/shield/riot/flash/examine(mob/user)
	..()
	to_chat(user, "<span class='info'>The mounted bulb has burnt out. You can try replacing it with a new one.</span>")

/obj/item/shield/energy
	name = "energy combat shield"
	desc = "A shield that reflects almost all energy projectiles, but is useless against physical attacks. It can be retracted, expanded, and stored anywhere."
	icon = 'icons/obj/items_and_weapons.dmi'
	lefthand_file = 'icons/mob/inhands/equipment/shields_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/shields_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	attack_verb = list("shoved", "bashed")
	throw_range = 5
	force = 3
	throwforce = 3
	throw_speed = 3
	var/base_icon_state = "eshield" // [base_icon_state]1 for expanded, [base_icon_state]0 for contracted
	var/on_force = 10
	var/on_throwforce = 8
	var/on_throw_speed = 2
	var/active = 0
	var/clumsy_check = TRUE

/obj/item/shield/energy/Initialize()
	. = ..()
	icon_state = "[base_icon_state]0"

/obj/item/shield/energy/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	return 0

/obj/item/shield/energy/IsReflect()
	return (active)

/obj/item/shield/energy/attack_self(mob/living/carbon/human/user)
	if(clumsy_check && user.has_trait(TRAIT_CLUMSY) && prob(50))
		to_chat(user, "<span class='warning'>You beat yourself in the head with [src].</span>")
		user.take_bodypart_damage(5)
	active = !active
	icon_state = "[base_icon_state][active]"

	if(active)
		force = on_force
		throwforce = on_throwforce
		throw_speed = on_throw_speed
		w_class = WEIGHT_CLASS_BULKY
		playsound(user, 'sound/weapons/saberon.ogg', 35, 1)
		to_chat(user, "<span class='notice'>[src] is now active.</span>")
	else
		force = initial(force)
		throwforce = initial(throwforce)
		throw_speed = initial(throw_speed)
		w_class = WEIGHT_CLASS_TINY
		playsound(user, 'sound/weapons/saberoff.ogg', 35, 1)
		to_chat(user, "<span class='notice'>[src] can now be concealed.</span>")
	add_fingerprint(user)

/obj/item/shield/riot/tele
	name = "telescopic shield"
	desc = "An advanced riot shield made of lightweight materials_deconstruct that collapses for easy storage."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "teleriot0"
	lefthand_file = 'icons/mob/inhands/equipment/shields_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/shields_righthand.dmi'
	slot_flags = null
	force = 3
	throwforce = 3
	throw_speed = 3
	throw_range = 4
	w_class = WEIGHT_CLASS_NORMAL
	var/active = 0

/obj/item/shield/riot/tele/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(active)
		return ..()
	return 0

/obj/item/shield/riot/tele/attack_self(mob/living/user)
	active = !active
	icon_state = "teleriot[active]"
	playsound(src.loc, 'sound/weapons/batonextend.ogg', 50, 1)

	if(active)
		force = 8
		throwforce = 5
		throw_speed = 2
		w_class = WEIGHT_CLASS_BULKY
		slot_flags = ITEM_SLOT_BACK
		to_chat(user, "<span class='notice'>You extend \the [src].</span>")
	else
		force = 3
		throwforce = 3
		throw_speed = 3
		w_class = WEIGHT_CLASS_NORMAL
		slot_flags = null
		to_chat(user, "<span class='notice'>[src] can now be concealed.</span>")
	add_fingerprint(user)
