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
	var/broken = FALSE //Is it broken?
	var/cooldown = 0
	var/shield_type = "kite"
	var/main_material = "iron"
	var/materials_deconstruct = list(MAT_IRON=4, MAT_LEATHER=2)
	var/transparent = FALSE	// makes beam projectiles pass through the shield

/obj/item/shield/proc/on_shield_block(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", damage = 0, attack_type = MELEE_ATTACK)
	return TRUE

/obj/item/shield/on_shield_block(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", damage = 0, attack_type = MELEE_ATTACK)
	if (obj_integrity <= damage)
		shield_break(owner, hitby)
		return FALSE
	take_damage(damage)
	return ..()

/obj/item/shield/proc/shield_break(mob/living/carbon/human/owner, atom/movable/hitby)
	//playsound(get_turf(src), 'sound/effects/glassbr3.ogg', 100) //TODO: Replace, make it play for everyone
	broken = TRUE
	var/turf/T = get_turf(owner)
	T.visible_message("<span class='warning'>[hitby] destroys [src]!</span>")
	name = "broken [initial(name)]"
	icon_state = "shield_broken"
	block_chance = 10
	force = 5

/obj/item/shield/proc/shield_fix()

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
/*
/obj/item/shield/kite/proc/shield_break(mob/living/carbon/human/owner)
	//playsound(owner, 'sound/effects/glassbr3.ogg', 100) //TODO: Replace, make it play for everyone
	new /obj/item/shield/kite/iron/broken((get_turf(src)))
*/
									/////	STEEL KITESHIELD	/////

									/////	ORCISH KITESHIELD	/////

									/////	DWEMER KITESHIELD	/////

									/////	SQUARE SHIELDS	/////
/obj/item/shield/twohanded/square/iron
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

/obj/item/shield/buckler
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

/*
 * TWOHANDING SHIELDS
 */
/obj/item/shield/twohanded
	var/wielded = 0
	var/force_unwielded = 0
	var/force_wielded = 0
	var/block_chance_unwielded = 0
	var/block_chance_wielded = 0
	var/slowdown_unwielded = 0
	var/slowdown_wielded = 0
	var/wieldsound = null
	var/unwieldsound = null

/obj/item/shield/twohanded/proc/unwield(mob/living/carbon/user, show_message = TRUE)
	if(!wielded || !user)
		return
	wielded = 0
	if(force_unwielded)
		force = force_unwielded
	if(block_chance_unwielded)
		block_chance = block_chance_unwielded
	var/sf = findtext(name," (Wielded)")
	if(sf)
		name = copytext(name,1,sf)
	else //something wrong
		name = "[initial(name)]"
	update_icon()
	if(user.get_item_by_slot(SLOT_BACK) == src)
		user.update_inv_back()
	else
		user.update_inv_hands()
	if(show_message)
		to_chat(user, "<span class='notice'>You are now carrying [src] with one hand.</span>")
	if(unwieldsound)
		playsound(loc, unwieldsound, 50, 1)
	var/obj/item/shield/twohanded/offhand/O = user.get_inactive_held_item()
	if(O && istype(O))
		O.unwield()
	return

/obj/item/shield/twohanded/proc/wield(mob/living/carbon/user)
	if(wielded)
		return
	if(ismonkey(user))
		to_chat(user, "<span class='warning'>It's too heavy for you to wield fully.</span>")
		return
	if(user.get_inactive_held_item())
		to_chat(user, "<span class='warning'>You need your other hand to be empty!</span>")
		return
	if(user.get_num_arms() < 2)
		to_chat(user, "<span class='warning'>You don't have enough intact hands.</span>")
		return
	wielded = 1
	if(force_wielded)
		force = force_wielded
	if(block_chance_wielded)
		block_chance = block_chance_wielded
	name = "[name] (Wielded)"
	update_icon()
	else
		to_chat(user, "<span class='notice'>You grab [src] with both hands.</span>")
	if (wieldsound)
		playsound(loc, wieldsound, 50, 1)
	var/obj/item/shield/twohanded/offhand/O = new(user) ////Let's reserve his other hand~
	O.name = "[name] - offhand"
	O.desc = "Your second grip on [src]."
	O.wielded = TRUE
	user.put_in_inactive_hand(O)
	return

/obj/item/shield/twohanded/dropped(mob/user)
	. = ..()
	//handles unwielding a shield/twohanded weapon when dropped as well as clearing up the offhand
	if(!wielded)
		return
	unwield(user)

/obj/item/shield/twohanded/update_icon()
	return

/obj/item/shield/twohanded/attack_self(mob/user)
	. = ..()
	if(wielded) //Trying to unwield it
		unwield(user)
	else //Trying to wield it
		wield(user)

/obj/item/shield/twohanded/equip_to_best_slot(mob/M)
	if(..())
		if(istype(src, /obj/item/shield/twohanded/required))
			return // unwield forces shield/twohanded-required items to be dropped.
		unwield(M)
		return

/obj/item/shield/twohanded/equipped(mob/user, slot)
	..()
	if(!user.is_holding(src) && wielded && !istype(src, /obj/item/shield/twohanded/required))
		unwield(user)

///////////OFFHAND///////////////
/obj/item/shield/twohanded/offhand
	name = "offhand"
	icon_state = "offhand"
	w_class = WEIGHT_CLASS_HUGE
	item_flags = ABSTRACT
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/item/shield/twohanded/offhand/Destroy()
	wielded = FALSE
	return ..()

/obj/item/shield/twohanded/offhand/dropped(mob/living/user, show_message = TRUE) //Only utilized by dismemberment since you can't normally switch to the offhand to drop it.
	var/obj/I = user.get_active_held_item()
	if(I && istype(I, /obj/item/shield/twohanded))
		var/obj/item/shield/twohanded/thw = I
		thw.unwield(user, show_message)
		if(istype(thw, /obj/item/shield/twohanded/required))
			user.dropItemToGround(thw)
	if(!QDELETED(src))
		qdel(src)

/obj/item/shield/twohanded/offhand/unwield()
	if(wielded)//Only delete if we're wielded
		wielded = FALSE
		qdel(src)

/obj/item/shield/twohanded/offhand/wield()
	if(wielded)//Only delete if we're wielded
		wielded = FALSE
		qdel(src)

/obj/item/shield/twohanded/offhand/attack_self(mob/living/carbon/user)		//You should never be able to do this in standard use of two handed items. This is a backup for lingering offhands.
	var/obj/item/shield/twohanded/O = user.get_inactive_held_item()
	if (istype(O) && !istype(O, /obj/item/shield/twohanded/offhand/))		//If you have a proper item in your other hand that the offhand is for, do nothing. This should never happen.
		return
	if (QDELETED(src))
		return
	qdel(src)																//If it's another offhand, or literally anything else, qdel. If I knew how to add logging messages I'd put one here.

///////////Two hand required objects///////////////
//This is for objects that require two hands to even pick up
/obj/item/shield/twohanded/required
	w_class = WEIGHT_CLASS_HUGE

/obj/item/shield/twohanded/required/attack_self()
	return

/obj/item/shield/twohanded/required/mob_can_equip(mob/M, mob/equipper, slot, disable_warning = 0)
	if(wielded && !slot_flags)
		if(!disable_warning)
			to_chat(M, "<span class='warning'>[src] is too cumbersome to carry with anything but your hands!</span>")
		return 0
	return ..()

/obj/item/shield/twohanded/required/attack_hand(mob/user)//Can't even pick it up without both hands empty
	var/obj/item/shield/twohanded/required/H = user.get_inactive_held_item()
	if(get_dist(src,user) > 1)
		return
	if(H != null)
		to_chat(user, "<span class='notice'>[src] is too cumbersome to carry in one hand!</span>")
		return
	if(loc != user)
		wield(user)
	. = ..()

/obj/item/shield/twohanded/required/equipped(mob/user, slot)
	..()
	var/slotbit = slotdefine2slotbit(slot)
	if(slot_flags & slotbit)
		var/datum/O = user.is_holding_item_of_type(/obj/item/shield/twohanded/offhand)
		if(!O || QDELETED(O))
			return
		qdel(O)
		return
	if(slot == SLOT_HANDS)
		wield(user)
	else
		unwield(user)

/obj/item/shield/twohanded/required/dropped(mob/living/user, show_message = TRUE)
	unwield(user, show_message)
	..()

/obj/item/shield/twohanded/required/wield(mob/living/carbon/user)
	..()
	if(!wielded)
		user.dropItemToGround(src)

/obj/item/shield/twohanded/required/unwield(mob/living/carbon/user, show_message = TRUE)
	if(!wielded)
		return
	if(show_message)
		to_chat(user, "<span class='notice'>You drop [src].</span>")
	..(user, FALSE)


/*	ENERGY SHIELD (for future coding reference, potential magic shields etc)	*/
/*
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
*/