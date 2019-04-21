
//////////////////////////////////////////////////////////////////////////////////////////
					// ALCHEMICAL INGREDIENTS
//////////////////////////////////////////////////////////////////////////////////////

// alchemical ingredients (i.e. the actual items) go here
// they can all be grinded up for 15 units of that item's reagent (eg mammoth tusk can be grinded for 15u 'mammothtusk' reagent)
// if you eat it you're in for a bad time

/obj/item/reagent_containers/food/snacks/alchemy
	name = "alchemical ingredient"
	desc = "This ingredient is ready to be used in alchemical potions."
	icon = 'icons/obj/alchemy.dmi'
	list_reagents = list(nutriment = 5) //you can eat them and combine the reagents in your body, but...
	grind_results = list(nutriment = 10) //it's far more efficient when ground up in an alchemy lab and used in a potion - note that this is in addition to the 5 above, for a total of 15
	w_class = WEIGHT_CLASS_TINY

/obj/item/reagent_containers/food/snacks/alchemy/wheat
	name = "alchemical wheat"
	icon_state = "wheat"
	list_reagents = list(wheat = 5)
	grind_results = list(wheat = 10)

/obj/item/reagent_containers/food/snacks/alchemy/blisterwort
	name = "blisterwort"
	icon_state = "blisterwort"
	list_reagents = list(blisterwort = 5)
	grind_results = list(blisterwort = 10)

/obj/item/reagent_containers/food/snacks/alchemy/skeevermeat
	name = "skeever meat"
	icon_state = "skeevermeat"
	list_reagents = list(skeevermeat = 5)
	grind_results = list(skeevermeat = 10)

/obj/item/reagent_containers/food/snacks/alchemy/mudcrabchitin
	name = "mudcrab chitin"
	icon_state = "mudcrabchitin"
	list_reagents = list(mudcrabchitin = 5)
	grind_results = list(mudcrabchitin = 10)

/obj/item/reagent_containers/food/snacks/alchemy/flyamanita
	name = "fly amanita"
	icon_state = "flyamanita"
	list_reagents = list(flyamanita = 5)
	grind_results = list(flyamanita = 10)

/obj/item/reagent_containers/food/snacks/alchemy/mountainflowers
	name = "mountain flowers"
	icon_state = "mountainflowers"
	list_reagents = list(mountainflowers = 5)
	grind_results = list(mountainflowers = 10)

/obj/item/reagent_containers/food/snacks/alchemy/bearmeat
	name = "bear meat"
	icon_state = "bearmeat"
	list_reagents = list(bearmeat = 5)
	grind_results = list(bearmeat = 10)

/obj/item/reagent_containers/food/snacks/alchemy/hangingmoss
	name = "hanging moss"
	icon_state = "hangingmoss"
	list_reagents = list(hangingmoss = 5)
	grind_results = list(hangingmoss = 10)

/obj/item/reagent_containers/food/snacks/alchemy/spidermeat
	name = "spider meat"
	icon_state = "spidermeat"
	list_reagents = list(spidermeat = 5)
	grind_results = list(spidermeat = 10)

/obj/item/reagent_containers/food/snacks/alchemy/chauruseggs
	name = "chaurus eggs"
	icon_state = "chauruseggs"
	list_reagents = list(chauruseggs = 5)
	grind_results = list(chauruseggs = 10)

/obj/item/reagent_containers/food/snacks/alchemy/deathbell
	name = "deathbell"
	icon_state = "deathbell"
	list_reagents = list(deathbell = 5)
	grind_results = list(deathbell = 10)

/obj/item/reagent_containers/food/snacks/alchemy/mammothtusk
	name = "mammoth tusk"
	icon_state = "mammothtusk"
	list_reagents = list(mammothtusk = 5)
	grind_results = list(mammothtusk = 10)