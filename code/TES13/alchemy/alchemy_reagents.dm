
//////////////////////////////////////////////////////////////////////////////////////////
					// ALCHEMICAL REAGENTS
//////////////////////////////////////////////////////////////////////////////////////

// where all the alchemy reagents go. alchemical effects can be found in alchemy_effects.dm
// most of these aren't good for you until you mix them into potions, don't eat random alchemical ingredients

/datum/reagent/alchemy
	name = "Alchemical reagent"
	id = "alchemy"
	taste_description = "potential"
	color = "#FF00FF"
	var/toxpwr = 0

/datum/reagent/alchemy/on_mob_life(mob/living/carbon/M)
	if(toxpwr)
		M.adjustToxLoss(toxpwr*REM, 0)
		. = TRUE
	..()

/datum/reagent/alchemy/wheat
	name = "Wheat"
	id = "wheat"
	taste_description = "restorative blandness"
	description = "Grown from crops and used to make flour, wheat has powerful medicinal properties when mixed with the right ingredients."

/datum/reagent/alchemy/wheat/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-0.5*REM, 0)
	M.adjustFireLoss(-0.5*REM, 0)
	..()
	. = 1

/datum/reagent/alchemy/blisterwort
	name = "Blisterwort"
	id = "blisterwort"
	taste_description = "restorative blandness"
	description = "A common mushroom with potent alchemical properties, blisterwort can bring both life and death when used correctly."

/datum/reagent/alchemy/blisterwort/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-0.2*REM, 0)
	M.adjustFireLoss(-0.2*REM, 0)
	..()
	. = 1

/datum/reagent/alchemy/skeevermeat
	name = "Skeever meat"
	id = "skeevermeat"
	taste_description = "rotten meat"
	description = "Harvested from dead skeevers, this ground-up meat can be added to weaker restorative potions to increase their effects significantly."
	toxpwr = 0.25

/datum/reagent/alchemy/mudcrabchitin
	name = "Mudcrab chitin"
	id = "mudcrabchitin"
	taste_description = "crab"
	description = "The ground-up chitinous exoskeleton of a mudcrab carries several useful effects when used in alchemical potions."

/datum/reagent/alchemy/mudcrabchitin/on_mob_life(mob/living/carbon/M)
	M.adjustToxLoss(-0.25*REM, 0)
	..()
	. = 1

/datum/reagent/alchemy/flyamanita
	name = "Fly Amanita"
	id = "flyamanita"
	taste_description = "mushrooms"
	description = "Found in the depths of caves, fly amanita is dangerous to eat, but can be combined with other ingredients for powerful effects."
	toxpwr = 0.25

/datum/reagent/alchemy/mountainflowers
	name = "Mountain flowers"
	id = "mountainflowers"
	taste_description = "a bouquet"
	description = "Mountain flowers have many potent alchemical effects, but should not be ingested before mixing."
	toxpwr = 0.25

/datum/reagent/alchemy/bearmeat
	name = "Bear meat"
	id = "bearmeat"
	taste_description = "strength"
	description = "The meat of a bear, just like the creature it comes from, is known for its strength."

/datum/reagent/alchemy/sabercatmeat
	name = "Sabercat meat"
	id = "sabercatmeat"
	taste_description = "power"
	description = "The meat of a sabercat is difficult to harvest, but can create powerful restorative potions."

/datum/reagent/alchemy/sabercatmeat/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-0.2*REM, 0)
	M.adjustFireLoss(-0.2*REM, 0)
	..()
	. = 1

/datum/reagent/alchemy/hangingmoss
	name = "Hanging moss"
	id = "hangingmoss"
	taste_description = "dirt"
	description = "Often found hanging from ceilings, hanging moss has several useful alchemical properties."
	toxpwr = 0.25

/datum/reagent/alchemy/nirnroot
	name = "Nirnroot"
	id = "nirnroot"
	taste_description = "bitter lettuce"
	description = "Perhaps one of the rarest alchemical ingredients, nirnroot is known for its distinctive brilliant glow and loud chime."
	toxpwr = 0.6

/datum/reagent/alchemy/spidermeat
	name = "Spider meat"
	id = "spidermeat"
	taste_description = "poison"
	description = "The meat of a particularly large spider, and a potent alchemical ingredient."
	toxpwr = 0.6

/datum/reagent/alchemy/chauruseggs
	name = "Chaurus eggs"
	id = "chauruseggs"
	taste_description = "recklessness"
	description = "These eggs can be found near the dangerous chaurus, pets of the Falmer."
	toxpwr = 0.6

/datum/reagent/alchemy/nightshade
	name = "Nightshade"
	id = "nightshade"
	taste_description = "suffering"
	description = "A purple flower used in the creation of deadly poisons, and in certain dark rituals."
	toxpwr = 0.8 //20 damage per 10u, do not ingest

/datum/reagent/alchemy/deathbell
	name = "Deathbell"
	id = "deathbell"
	taste_description = "regret"
	description = "A purple flower as dangerous as its name suggests, used in the creation of deadly poisons."
	toxpwr = 0.8 //20 damage per 10u, do not ingest

/datum/reagent/alchemy/mammothtusk
	name = "Mammoth tusk"
	id = "mammothtusk"
	taste_description = "dust"
	description = "The powdered tusk of a mammoth is not obtained easily, but has great alchemical properties."
	toxpwr = 0.25