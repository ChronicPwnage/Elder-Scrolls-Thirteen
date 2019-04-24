//TES13 daggers
//kitchen knife code in kitchen.dm

/obj/item/kitchen/knife/dagger
	name = "iron dagger"
	icon_state = "knife"
	item_state = "knife"
	desc = "A simple iron dagger, likely the work of a smith's apprentice."
	force = 15
	throwforce = 20

/obj/item/kitchen/knife/dagger/attack(mob/living/carbon/M, mob/user, blocked = FALSE) //for poisoning
	..()
	if(!istype(M))
		return
	if(reagents.total_volume)
		if(M.reagents)
			reagents.reaction(M, INJECT, reagents.total_volume)
			reagents.trans_to(M, reagents.total_volume, 0.5, transfered_by = user)


/obj/item/kitchen/knife/dagger/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	..()
	if(istype(hit_atom, /mob/living/carbon))
		if(reagents.total_volume && hit_atom.reagents)
			reagents.reaction(hit_atom, INJECT, reagents.total_volume)
			reagents.trans_to(hit_atom, reagents.total_volume, 0.5) //use up all 10u, but only transfer 5u


/obj/item/kitchen/knife/dagger/Initialize()
	. = ..()
	create_reagents(10, OPENCONTAINER)

/obj/item/kitchen/knife/dagger/steel
	name = "steel dagger"
	icon_state = "knife"
	item_state = "knife"
	desc = "A small, yet potentially deadly steel dagger."
	force = 20
	throwforce = 25

/obj/item/kitchen/knife/dagger/orcish
	name = "orcish dagger"
	icon_state = "knife"
	item_state = "knife"
	desc = "An imposing Orcish dagger. It looks rather intimidating for a small weapon."
	force = 25
	throwforce = 30

/obj/item/kitchen/knife/dagger/dwarven
	name = "dwarven dagger"
	icon_state = "knife"
	item_state = "knife"
	desc = "A dagger forged from Dwarven metal, sturdy and deadly."
	force = 30
	throwforce = 35
