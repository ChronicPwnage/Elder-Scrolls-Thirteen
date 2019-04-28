//Heavy helmets like Iron, Steel, Orcish, Dwarven, etc.

/obj/item/clothing/head/helmet/heavy
	name = "iron helmet"
	desc = "An iconic helmet forged from simple iron."
	icon_state = "helmet"
	item_state = "helmet"
	armor = list("melee" = 40, "bullet" = 40, "laser" = 0,"energy" = 30, "bomb" = 45, "bio" = 0, "rad" = 0, "fire" = 45, "acid" = 0)
	dog_fashion = null
	slowdown = 0.25

/obj/item/clothing/head/helmet/heavy/steel
	name = "steel helmet"
	desc = "A strong helmet forged from steel."
	icon_state = "helmet"
	item_state = "helmet"
	armor = list("melee" = 50, "bullet" = 50, "laser" = 0, "energy" = 40, "bomb" = 55, "bio" = 0, "rad" = 0, "fire" = 55, "acid" = 0)

/obj/item/clothing/head/helmet/heavy/orcish
	name = "orcish helmet"
	desc = "An intimidating Orcish style helmet made from sturdy Orichalcum metal."
	icon_state = "helmet"
	item_state = "helmet"
	armor = list("melee" = 60, "bullet" = 60, "laser" = 0, "energy" = 50, "bomb" = 65, "bio" = 0, "rad" = 0, "fire" = 65, "acid" = 0)

/obj/item/clothing/head/helmet/heavy/dwarven
	name = "dwarven helmet"
	desc = "A full, impenetrable Dwarven helmet."
	icon_state = "dwelm"
	item_state = "dwelm"
	armor = list("melee" = 70, "bullet" = 70, "laser" = 0, "energy" = 60, "bomb" = 75, "bio" = 0, "rad" = 0, "fire" = 75, "acid" = 0)
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR

/obj/item/clothing/head/helmet/heavy/steel/imperial
	name = "imperial heavy helmet"
	desc = "A steel helmet made in an Imperial style, normally worn by Imperial Sergeants."
	icon_state = "impheavy"
	item_state = "impheavy"

/obj/item/clothing/head/helmet/heavy/steel/imperial/officer
	name = "imperial officer helmet"
	desc = "An Imperial heavy helmet reinforced with extra metal and a face plate, typically worn by the Imperial Captain."
	icon_state = "impheavy"
	item_state = "impheavy"
	armor = list("melee" = 60, "bullet" = 60, "laser" = 0, "energy" = 50, "bomb" = 65, "bio" = 0, "rad" = 0, "fire" = 65, "acid" = 0)
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR