/obj/item/stack/sheet/mineral/TES
	name = "TES ingot"
	desc = "There's not much you can do with it right now, but maybe with a forge you could turn it into greatness."
	icon_state = "sheet-gold"
	item_state = "sheet-gold"
	singular_name = "TES ingot"
	sheettype = "TESingot"
	materials = list(MAT_METAL=MINERAL_MATERIAL_AMOUNT)
	grind_results = list("iron" = 20)
	point_value = 20
	merge_type = /obj/item/stack/sheet/mineral/TES

/obj/item/stack/sheet/mineral/TES/leather
	name = "leather strips"
	icon_state = "sheet-leather" //needs sprites
	item_state = "sheet-leather" //needs sprites
	singular_name = "leather strip"
	sheettype = "leatherstrip"
	merge_type = /obj/item/stack/sheet/mineral/TES/leather
	materials = list(MAT_LEATHER=MINERAL_MATERIAL_AMOUNT)

/obj/item/stack/sheet/mineral/TES/iron
	name = "iron ingots"
	icon_state = "sheet-titaniumglass" //needs sprites
	item_state = "sheet-titaniumglass" //needs sprites
	singular_name = "iron ingot"
	sheettype = "ironingot"
	merge_type = /obj/item/stack/sheet/mineral/TES/iron
	materials = list(MAT_METAL=MINERAL_MATERIAL_AMOUNT)

/obj/item/stack/sheet/mineral/TES/steel
	name = "steel ingots"
	icon_state = "sheet-plastitaniumglass" //needs sprites
	item_state = "sheet-plastitaniumglass" //needs sprites
	singular_name = "steel ingot"
	sheettype = "steelingot"
	merge_type = /obj/item/stack/sheet/mineral/TES/steel
	materials = list(MAT_METAL=MINERAL_MATERIAL_AMOUNT/2, MAT_CORUNDUM=MINERAL_MATERIAL_AMOUNT/2) //50% iron 50% corundum

/obj/item/stack/sheet/mineral/TES/elven
	name = "refined moonstone"
	icon_state = "sheet-gold" //needs sprites
	item_state = "sheet-gold" //needs sprites
	singular_name = "refined moonstone"
	sheettype = "elveningot"
	merge_type = /obj/item/stack/sheet/mineral/TES/elven
	materials = list(MAT_ELVEN=MINERAL_MATERIAL_AMOUNT)

/obj/item/stack/sheet/mineral/TES/orcish
	name = "orcish ingots"
	icon_state = "sheet-uranium" //needs sprites
	item_state = "sheet-uranium" //needs sprites
	singular_name = "orcish ingot"
	sheettype = "orcishingot"
	merge_type = /obj/item/stack/sheet/mineral/TES/orcish
	materials = list(MAT_ORCISH=MINERAL_MATERIAL_AMOUNT)

/obj/item/stack/sheet/mineral/TES/dwarven
	name = "dwarven ingots"
	icon_state = "sheet-brass" //needs sprites
	item_state = "sheet-brass" //needs sprites
	singular_name = "dwarven ingot"
	sheettype = "dwarveningot"
	merge_type = /obj/item/stack/sheet/mineral/TES/dwarven
	materials = list(MAT_DWARVEN=MINERAL_MATERIAL_AMOUNT)

/obj/item/stack/sheet/mineral/TES/glass
	name = "refined malachite"
	icon_state = "sheet-mythril" //needs sprites
	item_state = "sheet-mythril" //needs sprites
	singular_name = "refined malachite"
	sheettype = "glassingot"
	merge_type = /obj/item/stack/sheet/mineral/TES/glass
	materials = list(MAT_MALACHITE=MINERAL_MATERIAL_AMOUNT)

/obj/item/stack/sheet/mineral/TES/ebony
	name = "ebony ingots"
	icon_state = "sheet-adamantine" //needs sprites
	item_state = "sheet-adamantine" //needs sprites
	singular_name = "ebony ingot"
	sheettype = "ebonyingot"
	merge_type = /obj/item/stack/sheet/mineral/TES/ebony
	materials = list(MAT_EBONY=MINERAL_MATERIAL_AMOUNT)

/obj/item/stack/sheet/mineral/TES/dragon
	name = "refined dragonscales"
	icon_state = "sheet-durathread" //needs sprites
	item_state = "sheet-durathread" //needs sprites
	singular_name = "refined dragonscale"
	sheettype = "dragonscale"
	merge_type = /obj/item/stack/sheet/mineral/TES/dragon
	materials = list(MAT_DRAGON=MINERAL_MATERIAL_AMOUNT)