/obj/machinery/forge
	name = "metalworking forge"
	desc = "A large furnace used for melting down ore into ingots."
	icon = 'icons/obj/cult.dmi'
	icon_state = "forge"
	resistance_flags = INDESTRUCTIBLE
	density = TRUE
	layer = BELOW_OBJ_LAYER
	anchored = TRUE
	machine_tool_behaviour = list(TOOL_FORGE)

/obj/machinery/forge/wrench_act(mob/living/user, obj/item/I)
	default_unfasten_wrench(user, I, 10)
	return TRUE

/obj/machinery/anvil
	name = "metalworking anvil"
	desc = "An anvil used for making weapons and armor. You can imagine yourself making iron daggers here for a long time."
	icon = 'icons/obj/cult.dmi'
	icon_state = "forge"
	resistance_flags = INDESTRUCTIBLE
	density = TRUE
	layer = BELOW_OBJ_LAYER
	anchored = TRUE
	machine_tool_behaviour = list(TOOL_ANVIL)

/obj/machinery/anvil/wrench_act(mob/living/user, obj/item/I)
	default_unfasten_wrench(user, I, 10)
	return TRUE


//CRAFTLEATHER

/datum/crafting_recipe/leatherstrip
	name = "Leather strip"
	result = /obj/item/stack/sheet/mineral/TES/leather
	time = 10
	reqs = list(/obj/item/stack/sheet/leather = 1)
	category = CAT_SMITH
	subcategory = CAT_LEATHER


//CRAFTIRON

/datum/crafting_recipe/ironingot
	name = "Iron ingot"
	result = /obj/item/stack/sheet/mineral/TES/iron
	time = 10
	reqs = list(/obj/item/stack/ore/iron = 1)
	tools = list(TOOL_FORGE)
	category = CAT_SMITH
	subcategory = CAT_IRON


//CRAFTSTEEL

/datum/crafting_recipe/steelingot
	name = "Steel ingot"
	result = /obj/item/stack/sheet/mineral/TES/steel
	time = 10
	reqs = list(/obj/item/stack/ore/iron = 1, /obj/item/stack/ore/corundum = 1)
	tools = list(TOOL_FORGE)
	category = CAT_SMITH
	subcategory = CAT_STEEL


//CRAFTELVEN

/datum/crafting_recipe/elveningot
	name = "Refined moonstone"
	result = /obj/item/stack/sheet/mineral/TES/elven
	time = 10
	reqs = list(/obj/item/stack/ore/moonstone = 2)
	tools = list(TOOL_FORGE)
	category = CAT_SMITH
	subcategory = CAT_ELVEN


//CRAFTDWARVEN

/datum/crafting_recipe/dwarveningot
	name = "Dwarven ingot"
	result = /obj/item/stack/sheet/mineral/TES/dwarven
	time = 10
	reqs = list(/obj/item/stack/ore/dwarven = 2)
	tools = list(TOOL_FORGE)
	category = CAT_SMITH
	subcategory = CAT_DWARVEN


//CRAFTORCISH

/datum/crafting_recipe/orcishingot
	name = "Orichalcum ingot"
	result = /obj/item/stack/sheet/mineral/TES/orcish
	time = 10
	reqs = list(/obj/item/stack/ore/orcish = 2)
	tools = list(TOOL_FORGE)
	category = CAT_SMITH
	subcategory = CAT_ORCISH


//CRAFTGLASS

/datum/crafting_recipe/glassingot
	name = "Refined malachite"
	result = /obj/item/stack/sheet/mineral/TES/glass
	time = 10
	reqs = list(/obj/item/stack/ore/malachite = 2)
	tools = list(TOOL_FORGE)
	category = CAT_SMITH
	subcategory = CAT_GLASS


//CRAFTEBONY

/datum/crafting_recipe/ebonyingot
	name = "Ebony ingot"
	result = /obj/item/stack/sheet/mineral/TES/ebony
	time = 10
	reqs = list(/obj/item/stack/ore/ebony = 2)
	tools = list(TOOL_FORGE)
	category = CAT_SMITH
	subcategory = CAT_EBONY


//CRAFTDRAGON

/datum/crafting_recipe/dragoningot
	name = "Refined dragonscales"
	result = /obj/item/stack/sheet/mineral/TES/dragon
	time = 10
	reqs = list(/obj/item/stack/ore/dragon = 1)
	tools = list(TOOL_FORGE)
	category = CAT_SMITH
	subcategory = CAT_DRAGON