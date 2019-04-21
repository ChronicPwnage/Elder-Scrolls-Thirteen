
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
	description = "Grown from crops and used to make flour, wheat can also be mixed with blisterwort to restore health to the injured, or with mudcrab chitin to cure even the most serious poisons."

/datum/reagent/alchemy/wheat/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-0.5*REM, 0)
	M.adjustFireLoss(-0.5*REM, 0)
	..()
	. = 1

/datum/reagent/alchemy/blisterwort
	name = "Blisterwort"
	id = "blisterwort"
	taste_description = "restorative blandness"
	description = "A common mushroom with potent alchemical properties, blisterwort can be mixed with wheat to restore health to the injured, or with deathbell to create a potent slowing poison."

/datum/reagent/alchemy/blisterwort/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-0.2*REM, 0)
	M.adjustFireLoss(-0.2*REM, 0)
	..()
	. = 1

/datum/reagent/alchemy/skeevermeat
	name = "Skeever meat"
	id = "skeevermeat"
	description = "Harvested from dead skeevers, this ground-up meat can be added to weaker restorative potions to increase their effects significantly."
	toxpwr = 0.25

/datum/reagent/alchemy/mudcrabchitin
	name = "Mudcrab chitin"
	id = "mudcrabchitin"
	taste_description = "crab"
	description = "The ground-up chitinous exoskeleton of a mudcrab can be combined with wheat to cure poison effectively, or with mountain flowers to stabilize a patient's temperature."
/
datum/reagent/alchemy/mudcrabchitin/on_mob_life(mob/living/carbon/M)
	M.adjustToxLoss(-0.25*REM, 0)
	..()
	. = 1

/datum/reagent/alchemy/flyamanita
	name = "Fly Amanita"
	id = "flyamanita"
	description = "Found in the depths of caves, glowing mushrooms have the unique property of fortifying one's health greatly when combined with mountain flowers."
	toxpwr = 0.25

/datum/reagent/alchemy/mountainflowers
	name = "Mountain flowers"
	id = "mountainflowers"
	description = "Mountain flowers have many alchemical effects- they can be combined with glowing mushroom to fortify health, bear claws to fortify stamina, hanging moss to restore magicka, mudcrab chitin to stabilize temperature, or deathbell to create a minor poison."
	toxpwr = 0.25

/datum/reagent/alchemy/bearmeat
	name = "Bear meat"
	id = "bearmeat"
	description = "The meat of a bear, just like the creature it comes from, is known for its strength. It can be combined with hanging moss to increase the force of melee attacks, or with mountain flower to allow someone to carry even the heaviest burdens."

/datum/reagent/alchemy/hangingmoss
	name = "Hanging moss"
	id = "hangingmoss"
	description = "Often found hanging from ceilings, hanging moss can be combined with mountain flowers to restore magicka, bear claws to increase the force of melee attacks, or with spider eggs to weaken the magical abilities of enemy mages."
	toxpwr = 0.25

/datum/reagent/alchemy/nirnroot
	name = "Nirnroot"
	id = "nirnroot"
	description = "Perhaps one of the rarest alchemical ingredients, nirnroot is known for its distinctive brilliant glow and loud chime. It can create a potion of invisibility when mixed with chaurus eggs, or can be added to a weak poison to increase its potency greatly."
	toxpwr = 0.75

/datum/reagent/alchemy/spidermeat
	name = "Spider meat"
	id = "spidermeat"
	description = "The meat of a particularly large spider. Combining them with hanging moss can create a poison to sap magicka from a caster, or when mixed instead with powdered mammoth tusk, enhance one's vision significantly."
	toxpwr = 0.75

/datum/reagent/alchemy/chauruseggs
	name = "Chaurus eggs"
	id = "chauruseggs"
	description = "These eggs can be found near the dangerous chaurus, pets of the Falmer. Alongside nirnroot, it can create a potion of invisibility, and can be added to a magicka poison to increase its potency. Combined with powdered mammoth tusk, it can create a poison that ignites others from within."
	toxpwr = 0.75

/datum/reagent/alchemy/deathbell
	name = "Deathbell"
	id = "deathbell"
	taste_description = "regret"
	description = "A purple flower as dangerous as its name suggests, deathbell can be combined with mountain flowers to create a deadly poison that damages those who ingest it, or with blisterwort to create a slowing poison."
	toxpwr = 1 //25 damage per 10u, do not ingest

/datum/reagent/alchemy/mammothtusk
	name = "Mammoth tusk"
	id = "mammothtusk"
	description = "The powdered tusk of a mammoth is not obtained easily, but has great alchemical properties- when combined with the eggs of a chaurus, it creates a poison that ignites those who ingest it, or with the eggs of a spider, enhances one's vision significantly."
	toxpwr = 0.5