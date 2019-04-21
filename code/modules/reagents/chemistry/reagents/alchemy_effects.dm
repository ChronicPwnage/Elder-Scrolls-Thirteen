
//////////////////////////////////////////////////////////////////////////////////////////
					// ALCHEMICAL EFFECTS
//////////////////////////////////////////////////////////////////////////////////////

// where all the alchemical effects go- Restore Health, etc. the reagents they're made from are in alchemy_reagents.dm
// default REM = 2.5, so 10u = (25*n) heal/damage, where n = whatever the number is

/datum/reagent/potion
	name = "Alchemical potion"
	id = "potion"
	taste_description = "realized potential"
	reagent_state = LIQUID
	color = "#8B0000"

/datum/reagent/potion/restore_health
	name = "Restore Health"
	id = "restore_health"
	description = "A potion which restores the vitality of those who ingest it, closing up wounds and healing burns."
	taste_description = "health"

/datum/reagent/potion/restore_health/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-1*REM, 0)
	M.adjustFireLoss(-1*REM, 0)
	..()
	. = 1

/datum/reagent/potion/restore_health_strong
	name = "Restore Health (Strong)"
	id = "restore_health_strong"
	description = "A potion which greatly restores the vitality of those who ingest it, closing up wounds and healing burns at an accelerated rate."
	taste_description = "health"

/datum/reagent/potion/restore_health_strong/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-2*REM, 0)
	M.adjustFireLoss(-2*REM, 0)
	..()
	. = 1

/datum/reagent/potion/cure_poison
	name = "Cure Poison"
	id = "cure_poison"
	description = "A general-purpose alchemical antidote to almost every natural toxin."
	taste_description = "health"

/datum/reagent/potion/cure_poison/on_mob_life(mob/living/carbon/M)
	M.adjustToxLoss(-1*REM, 0)
	..()
	. = 1

/datum/reagent/potion/cure_poison_strong
	name = "Cure Poison (Strong)"
	id = "cure_poison_strong"
	description = "A powerful general-purpose alchemical antidote to almost every natural toxin (and some unnatural ones too)."
	taste_description = "health"

/datum/reagent/potion/cure_poison_strong/on_mob_life(mob/living/carbon/M)
	M.adjustToxLoss(-2*REM, 0)
	..()
	. = 1

/datum/reagent/potion/fortify_health
	name = "Fortify Health"
	id = "fortify_health"
	description = "An alchemical concoction that can fortify the vitality of whoever drinks it, allowing them to temporarily resist more damage than usual."
	taste_description = "health"

/datum/reagent/potion/fortify_health/on_mob_add(mob/M)
	..()
	if(isliving(M))
		var/mob/living/L = M
		L.maxHealth += 15
		L.health += 15

/datum/reagent/potion/fortify_health/on_mob_delete(mob/M)
	if(isliving(M))
		var/mob/living/L = M
		L.maxHealth -= 15
		L.health -= 15
	..()

/datum/reagent/potion/fortify_stamina
	name = "Fortify Stamina"
	id = "fortify_stamina"
	description = "A potion to increase the stamina of whoever drinks it, reducing the effect of most things that would otherwise slow them down."
	taste_description = "strength"

/datum/reagent/potion/fortify_stamina/on_mob_add(mob/M)
	..()
	if(isliving(M))
		var/mob/living/L = M
		L.add_trait(TRAIT_IGNORESLOWDOWN, id)

/datum/reagent/potion/fortify_stamina/on_mob_delete(mob/M)
	if(isliving(M))
		var/mob/living/L = M
		L.remove_trait(TRAIT_IGNORESLOWDOWN, id)
	..()

/datum/reagent/potion/restore_magicka
	name = "Restore Magicka"
	id = "restore_magicka"
	description = "A potion to restore the magical abilities of the drinker over time, allowing them to cast more spells."
	taste_description = "magic"

/datum/reagent/potion/restore_magicka/on_mob_life(mob/living/carbon/M) //placeholder until we get magicka system
	M.adjustToxLoss(-1*REM, 0)
	..()
	. = 1

/datum/reagent/potion/invisibility
	name = "Invisibility"
	id = "invisibility"
	description = "A potion to mask the drinker from sight, making them completely invisible until it wears off (very quickly)."
	taste_description = "magic"
	metabolization_rate = 5 * REAGENTS_METABOLISM

/datum/reagent/potion/invisibility/on_mob_add(mob/M)
	..()
	if(isliving(M))
		var/mob/living/L = M
		L.alpha = 0

/datum/reagent/potion/invisibility/on_mob_delete(mob/M)
	if(isliving(M))
		var/mob/living/L = M
		L.alpha = 255
	..()

/datum/reagent/potion/fortify_melee
	name = "Fortify Melee"
	id = "fortify_melee"
	description = "A potion that increases the physical strength of whoever drinks it, making their weapons hit harder."
	taste_description = "strength"

/datum/reagent/potion/fortify_melee/on_mob_add(mob/M)
	..()
	if(isliving(M))
		var/mob/living/L = M
		L.add_trait(TRAIT_FORTIFY_MELEE, id)

/datum/reagent/potion/fortify_melee/on_mob_delete(mob/M)
	if(isliving(M))
		var/mob/living/L = M
		L.remove_trait(TRAIT_FORTIFY_MELEE, id)
	..()

/datum/reagent/potion/stabilize_temperature
	name = "Stabilize Temperature"
	id = "stabilize_temperature"
	description = "A potion to regulate the temperature of whoever drinks it, granting them resistance to extreme temperatures of all kinds."
	taste_description = "magic"

/datum/reagent/potion/stabilize_temperature/on_mob_life(mob/living/carbon/M)
	if(M.bodytemperature > BODYTEMP_NORMAL)
		M.adjust_bodytemperature(-80 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	else if(M.bodytemperature < (BODYTEMP_NORMAL + 1))
		M.adjust_bodytemperature(80 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	..()

/datum/reagent/potion/hawkeye //WIP- increases view range, possibly nightvision
	name = "Hawkeye"
	id = "hawkeye"
	taste_description = "acuity"

/datum/reagent/potion/damage_health
	name = "Damage Health"
	id = "damage_health"
	taste_description = "death"

/datum/reagent/potion/damage_health/on_mob_life(mob/living/carbon/M)
	M.adjustToxLoss(1*REM, 0)
	. = TRUE
	..()

/datum/reagent/potion/damage_health_strong
	name = "Damage Health (Strong)"
	id = "damage_health_strong"
	taste_description = "death"

/datum/reagent/potion/damage_health_strong/on_mob_life(mob/living/carbon/M)
	M.adjustToxLoss(2*REM, 0)
	. = TRUE
	..()

/datum/reagent/potion/damage_stamina
	name = "Damage Stamina"
	id = "damage_stamina"
	taste_description = "snails"

/datum/reagent/potion/damage_stamina/on_mob_life(mob/living/carbon/M)
	M.adjustStaminaLoss(REM * data, 0)
	data = max(data - 1, 3)
	..()
	. = 1

/datum/reagent/potion/damage_magicka //needs a magicka system before we do this
	name = "Damage Magicka"
	id = "damage_magicka"
	taste_description = "muggles"

/datum/reagent/potion/damage_magicka_strong //needs a magicka system before we do this
	name = "Damage Magicka (Strong)"
	id = "damage_magicka_strong"
	taste_description = "muggles"

/datum/reagent/potion/combustion
	name = "Alchemical Combustion"
	id = "combustion"
	taste_description = "fire"
	metabolization_rate = 5 * REAGENTS_METABOLISM

/datum/reagent/potion/combustion/reaction_mob(mob/living/M, method=TOUCH, reac_volume)
	M.adjust_fire_stacks(0.2)
	M.IgniteMob()
	..()

/datum/reagent/potion/combustion/on_mob_life(mob/living/carbon/M)
	M.adjust_fire_stacks(0.2)
	M.IgniteMob()
	..()
	return TRUE
