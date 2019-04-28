//Heavy boots like Iron, Steel, Orcish, Dwarven, etc.

/obj/item/clothing/shoes/combat/heavy
	name = "iron boots"
	desc = "Simple metal boots made from iron."
	icon_state = "jackboots"
	item_state = "jackboots"
	lefthand_file = null
	righthand_file = null
	armor = list("melee" = 40, "bullet" = 40, "laser" = 0, "energy" = 30, "bomb" = 45, "bio" = 0, "rad" = 0, "fire" = 45, "acid" = 0)
	body_parts_covered = FEET|LEGS
	slowdown = 0.25

/obj/item/clothing/shoes/combat/heavy/steel
	name = "steel boots"
	desc = "Metal boots forged from sturdy steel."
	icon_state = "jackboots"
	item_state = "jackboots"
	armor = list("melee" = 50, "bullet" = 50, "laser" = 0, "energy" = 40, "bomb" = 55, "bio" = 0, "rad" = 0, "fire" = 55, "acid" = 0)

/obj/item/clothing/shoes/combat/heavy/orcish
	name = "orcish boots"
	desc = "Strong metal boots forged from Orichalcum."
	icon_state = "jackboots"
	item_state = "jackboots"
	armor = list("melee" = 60, "bullet" = 60, "laser" = 0, "energy" = 50, "bomb" = 65, "bio" = 0, "rad" = 0, "fire" = 65, "acid" = 0)

/obj/item/clothing/shoes/combat/heavy/dwarven
	name = "dwarven boots"
	desc = "Sturdy and heavy metal boots fashioned from Dwarven metal."
	icon_state = "dwoots"
	item_state = "dwoots"
	armor = list("melee" = 70, "bullet" = 70, "laser" = 0, "energy" = 60, "bomb" = 75, "bio" = 0, "rad" = 0, "fire" = 75, "acid" = 0)

/obj/item/clothing/shoes/combat/heavy/steel/imperial
	name = "imperial heavy boots"
	desc = "Imperial steel boots, normally firmly protecting the legs and feet of Imperial Sergeants."
	icon_state = "impheavy"
	item_state = "impheavy"

/obj/item/clothing/shoes/combat/heavy/steel/imperial/officer
	name = "imperial officer boots"
	desc = "Imperial heavy boots reinforced with extra steel and flair, standard issue for Imperial officers."
	icon_state = "impheavy"
	item_state = "impheavy"
	armor = list("melee" = 60, "bullet" = 60, "laser" = 0, "energy" = 50, "bomb" = 65, "bio" = 0, "rad" = 0, "fire" = 65, "acid" = 0)