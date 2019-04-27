//Light helmets like Hide, Leather, Elven, Glass, etc.

/obj/item/clothing/head/helmet/light
	name = "hide helmet"
	desc = "A fragile helmet made from animal hides."
	icon_state = "helmet"
	item_state = "helmet"
	armor = list("melee" = 20, "bullet" = 20, "laser" = 0,"energy" = 25, "bomb" = 20, "bio" = 0, "rad" = 0, "fire" = 20, "acid" = 0)
	dog_fashion = null

/obj/item/clothing/head/helmet/light/leather
	name = "leather helmet"
	desc = "A light helmet made from leather, mediocre head protection."
	icon_state = "helmet"
	item_state = "helmet"
	armor = list("melee" = 30, "bullet" = 30, "laser" = 0,"energy" = 35, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 30, "acid" = 0)

/obj/item/clothing/head/helmet/light/elven
	name = "elven helmet"
	desc = "An Elven style helmet made from refined Moonstone."
	icon_state = "helmet"
	item_state = "helmet"
	armor = list("melee" = 40, "bullet" = 40, "laser" = 0,"energy" = 45, "bomb" = 40, "bio" = 0, "rad" = 0, "fire" = 40, "acid" = 0)

/obj/item/clothing/head/helmet/light/glass
	name = "glass helmet"
	desc = "A light, but sturdy Glass helmet. Made mostly using refined Malachite."
	icon_state = "helmet"
	item_state = "helmet"
	armor = list("melee" = 50, "bullet" = 50, "laser" = 0,"energy" = 55, "bomb" = 50, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 0)

/obj/item/clothing/head/helmet/light/leather/imperial
	name = "imperial light helmet"
	desc = "A standard issue light Imperial helmet made from leather."
	icon_state = "helmet"
	item_state = "helmet"

/obj/item/clothing/head/helmet/light/leather/imperial/studded
	name = "studded imperial helmet"
	desc = "An Imperial helmet reinforced with metal studs and a bit of extra leather padding."
	icon_state = "helmet"
	item_state = "helmet"
	armor = list("melee" = 35, "bullet" = 35, "laser" = 0, "energy" = 40, "bomb" = 35, "bio" = 0, "rad" = 0, "fire" = 35, "acid" = 0)

/obj/item/clothing/head/helmet/light/leather/stormcloak
	name = "stormcloak helmet"
	desc = "A standard Stormcloak helmet made mostly from leather."
	icon_state = "stormcloak"
	item_state = "stormcloak"
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR

/obj/item/clothing/head/helmet/light/leather/stormcloak/reinforced
	name = "reinforced stormcloak helmet"
	desc = "Stormcloak helmet reinforced with extra metal and some more leather padding."
	icon_state = "stormcloak"
	item_state = "stormcloak"
	armor = list("melee" = 35, "bullet" = 35, "laser" = 0, "energy" = 40, "bomb" = 35, "bio" = 0, "rad" = 0, "fire" = 35, "acid" = 0)

/obj/item/clothing/head/helmet/light/leather/stormcloak/officer
	name = "stormcloak officer helmet"
	desc = "A Stormcloak officer's helmet, made from lots of leather and various animal hides."
	icon_state = "helmet"
	item_state = "helmet"
	flags_cover = HEADCOVERSEYES
	flags_inv = HIDEHAIR
	armor = list("melee" = 40, "bullet" = 40, "laser" = 0,"energy" = 45, "bomb" = 40, "bio" = 0, "rad" = 0, "fire" = 40, "acid" = 0)

/obj/item/clothing/head/helmet/light/leather/whiteguard
	name = "whitergun guard helmet"
	desc = "Standard Whiterun guard helmet made mostly from leather."
	icon_state = "whiteguard"
	item_state = "whiteguard"
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR

/obj/item/clothing/head/helmet/light/leather/whiteguard/captain
	name = "whitergun guard captain helmet"
	desc = "A Whiterun guard helmet reinforced with metal and leather, worn by the Guard Captain."
	icon_state = "whiteguard"
	item_state = "whiteguard"
	armor = list("melee" = 40, "bullet" = 40, "laser" = 0,"energy" = 45, "bomb" = 40, "bio" = 0, "rad" = 0, "fire" = 40, "acid" = 0)
