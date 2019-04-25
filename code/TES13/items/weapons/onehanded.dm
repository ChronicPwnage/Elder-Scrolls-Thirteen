//swords, maces, axes etc
//swords and maces based off claymore in weaponry.dm
//axes based off hatchets in hydroitemdefines.dm (now you see why we're organising these?)

/obj/item/claymore/sword
	name = "iron sword"
	desc = "A simple iron sword."
	icon_state = "claymore"
	item_state = "claymore"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	hitsound = 'sound/weapons/bladeslice.ogg'
	slot_flags = ITEM_SLOT_BELT
	force = 30
	throwforce = 15
	block_chance = 0

/obj/item/claymore/sword/steel
	name = "steel sword"
	desc = "A well forged steel sword."
	icon_state = "claymore"
	item_state = "claymore"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	hitsound = 'sound/weapons/bladeslice.ogg'
	force = 35
	throwforce = 15

/obj/item/claymore/sword/orcish
	name = "orcish sword"
	desc = "A sharp and deadly Orcish sword."
	icon_state = "claymore"
	item_state = "claymore"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	hitsound = 'sound/weapons/bladeslice.ogg'
	force = 40
	throwforce = 20

/obj/item/claymore/sword/dwarven
	name = "dwarven sword"
	desc = "A lethal sword made from strong Dwarven metal."
	icon_state = "claymore"
	item_state = "claymore"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	hitsound = 'sound/weapons/bladeslice.ogg'
	force = 45
	throwforce = 20

/obj/item/claymore/sword/scimitar
	name = "scimitar"
	desc = "A signature Alik'r scimitar."
	icon_state = "claymore"
	item_state = "claymore"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	hitsound = 'sound/weapons/bladeslice.ogg'
	force = 40
	throwforce = 20

/obj/item/claymore/sword/steel/imperial
	name = "imperial sword"
	desc = "A standard issue Imperial sword."
	icon_state = "claymore"
	item_state = "claymore"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	hitsound = 'sound/weapons/bladeslice.ogg'

/obj/item/claymore/mace
	name = "iron mace"
	desc = "An iron mace, a good beginner's bludgeon."
	icon_state = "iron_mace"
	item_state = "iron_mace"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	hitsound = 'sound/weapons/chainhit.ogg'
	slot_flags = ITEM_SLOT_BELT
	force = 20
	armour_penetration = 30
	throwforce = 10
	attack_verb = list("bashed", "bludgeoned", "hit", "struck", "beat")
	block_chance = 0
	sharpness = IS_BLUNT

/obj/item/claymore/mace/steel
	name = "steel mace"
	desc = "A strong steel mace."
	icon_state = "claymore"
	item_state = "claymore"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	force = 25
	armour_penetration = 35
	throwforce = 10

/obj/item/claymore/mace/orcish
	name = "orcish mace"
	desc = "A lethal and threatening orcish mace."
	icon_state = "claymore"
	item_state = "claymore"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	force = 30
	armour_penetration = 40
	throwforce = 15

/obj/item/claymore/mace/dwarven
	name = "dwarven mace"
	desc = "A sturdy and well forged Dwarven mace."
	icon_state = "claymore"
	item_state = "claymore"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	force = 35
	armour_penetration = 45
	throwforce = 15

/obj/item/claymore/mace/steel/imperial
	name = "imperial mace"
	desc = "A standard issue Imperial mace."
	icon_state = "claymore"
	item_state = "claymore"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'

/obj/item/hatchet/waraxe
	name = "iron waraxe"
	desc = "An iron axe made for war."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "hatchet"
	item_state = "hatchet"
	lefthand_file = 'icons/mob/inhands/equipment/hydroponics_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/hydroponics_righthand.dmi'
	force = 25
	armour_penetration = 15
	w_class = WEIGHT_CLASS_NORMAL
	throwforce = 30
	throw_speed = 3
	throw_range = 6

/obj/item/hatchet/waraxe/steel
	name = "steel waraxe"
	desc = "A steel waraxe, common among Stormcloak soldiers."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "hatchet"
	item_state = "hatchet"
	lefthand_file = 'icons/mob/inhands/equipment/hydroponics_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/hydroponics_righthand.dmi'
	force = 30
	armour_penetration = 20
	throwforce = 35

/obj/item/hatchet/waraxe/orcish
	name = "orcish waraxe"
	desc = "An intimidating orcish waraxe, as scary as it is deadly."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "hatchet"
	item_state = "hatchet"
	lefthand_file = 'icons/mob/inhands/equipment/hydroponics_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/hydroponics_righthand.dmi'
	force = 35
	armour_penetration = 25
	throwforce = 40

/obj/item/hatchet/waraxe/dwarven
	name = "dwarven waraxe"
	desc = "A strong and sturdy waraxe made from Dwarven metal."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "hatchet"
	item_state = "hatchet"
	lefthand_file = 'icons/mob/inhands/equipment/hydroponics_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/hydroponics_righthand.dmi'
	force = 40
	armour_penetration = 30
	throwforce = 45
