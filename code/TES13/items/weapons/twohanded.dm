//TES13 twohanded weapons- spears, battleaxes, and warhammers
//based on fireaxe code in twohanded.dm

/obj/item/twohanded/fireaxe/spear
	icon_state = "fireaxe0"
	lefthand_file = 'icons/mob/inhands/weapons/axes_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/axes_righthand.dmi'
	name = "iron spear"
	desc = "A heavy and simple iron spear."
	force = 10
	throwforce = 25
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	force_unwielded = 10
	force_wielded = 60
	attack_verb = list("attacked", "stabbed", "struck", "impaled")

/obj/item/twohanded/fireaxe/spear/steel
	icon_state = "fireaxe0"
	lefthand_file = 'icons/mob/inhands/weapons/axes_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/axes_righthand.dmi'
	name = "steel spear"
	desc = "A well forged steel spear."
	force = 10
	throwforce = 25
	force_unwielded = 10
	force_wielded = 65

/obj/item/twohanded/fireaxe/spear/orcish
	icon_state = "fireaxe0"
	lefthand_file = 'icons/mob/inhands/weapons/axes_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/axes_righthand.dmi'
	name = "orcish spear"
	desc = "A threatening and incredibly deadly Orcish spear."
	force = 10
	throwforce = 30
	force_unwielded = 10
	force_wielded = 70

/obj/item/twohanded/fireaxe/spear/dwarven
	icon_state = "fireaxe0"
	lefthand_file = 'icons/mob/inhands/weapons/axes_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/axes_righthand.dmi'
	name = "dwarven spear"
	desc = "A bulky and strong spear fashioned from Dwarven metal."
	force = 15
	throwforce = 30
	force_unwielded = 15
	force_wielded = 75

/obj/item/twohanded/fireaxe/spear/steel/imperial
	icon_state = "fireaxe0"
	lefthand_file = 'icons/mob/inhands/weapons/axes_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/axes_righthand.dmi'
	name = "imperial spear"
	desc = "A sturdy Imperial spear, standard issue for Imperial Knights."

/obj/item/twohanded/fireaxe/baxe
	icon_state = "fireaxe0"
	lefthand_file = 'icons/mob/inhands/weapons/axes_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/axes_righthand.dmi'
	name = "iron battleaxe"
	desc = "The iron waraxe's stronger and longer brother."
	force = 10
	throwforce = 20
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	force_unwielded = 10
	force_wielded = 50
	armour_penetration = 25

/obj/item/twohanded/fireaxe/baxe/steel
	icon_state = "fireaxe0"
	lefthand_file = 'icons/mob/inhands/weapons/axes_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/axes_righthand.dmi'
	name = "steel battleaxe"
	desc = "A strong, steel battleaxe. Commonly seen in the hands of the Stormcloak's seasoned veterans."
	force = 10
	throwforce = 20
	force_unwielded = 10
	force_wielded = 55
	armour_penetration = 30

/obj/item/twohanded/fireaxe/baxe/orcish
	icon_state = "fireaxe0"
	lefthand_file = 'icons/mob/inhands/weapons/axes_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/axes_righthand.dmi'
	name = "orcish battleaxe"
	desc = "A large and in charge Orcish battleaxe."
	force = 10
	throwforce = 25
	force_unwielded = 10
	force_wielded = 60
	armour_penetration = 35

/obj/item/twohanded/fireaxe/baxe/dwarven
	icon_state = "fireaxe0"
	lefthand_file = 'icons/mob/inhands/weapons/axes_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/axes_righthand.dmi'
	name = "dwarven battleaxe"
	desc = "A battleaxe forged from Dwarven metal, with strength to match."
	force = 15
	throwforce = 25
	force_unwielded = 15
	force_wielded = 65
	armour_penetration = 40

/obj/item/twohanded/fireaxe/warham
	icon_state = "fireaxe0"
	lefthand_file = 'icons/mob/inhands/weapons/axes_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/axes_righthand.dmi'
	name = "iron warhammer"
	desc = "An iron hammer with an attitude."
	force = 10
	throwforce = 5
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	force_unwielded = 10
	force_wielded = 40
	armour_penetration = 35
	sharpness = IS_BLUNT
	attack_verb = list("bashed", "bludgeoned", "hit", "struck", "beat")

/obj/item/twohanded/fireaxe/warham/steel
	icon_state = "fireaxe0"
	lefthand_file = 'icons/mob/inhands/weapons/axes_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/axes_righthand.dmi'
	name = "steel warhammer"
	desc = "A sturdy and well made steel warhammer."
	force = 15
	throwforce = 5
	force_unwielded = 15
	force_wielded = 45
	armour_penetration = 40


/obj/item/twohanded/fireaxe/warham/orcish
	icon_state = "fireaxe0"
	lefthand_file = 'icons/mob/inhands/weapons/axes_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/axes_righthand.dmi'
	name = "orcish warhammer"
	desc = "An Orcish warhammer capable of shattering armor."
	force = 15
	throwforce = 10
	force_unwielded = 15
	force_wielded = 50
	armour_penetration = 45

/obj/item/twohanded/fireaxe/warham/dwarven
	icon_state = "fireaxe0"
	lefthand_file = 'icons/mob/inhands/weapons/axes_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/axes_righthand.dmi'
	name = "dwarven warhammer"
	desc = "A warhammer forged from Dwarven metal. Armor is hardly a barrier for this beast."
	force = 15
	throwforce = 10
	force_unwielded = 15
	force_wielded = 55
	armour_penetration = 50