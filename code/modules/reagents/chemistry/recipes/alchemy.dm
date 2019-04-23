/datum/chemical_reaction/restore_health_minor
	name = "Restore Health (Minor)"
	id = "restore_health_minor"
	results = list("restore_health_minor" = 2)
	required_reagents = list("wheat" = 1, "blisterwort" = 1)

/datum/chemical_reaction/restore_health_plentiful
	name = "Restore Health (Plentiful)"
	id = "restore_health_plentiful"
	results = list("restore_health_plentiful" = 2)
	required_reagents = list("restore_health_minor" = 2, "skeevermeat" = 1)

/datum/chemical_reaction/restore_health_extreme
	name = "Restore Health (Extreme)"
	id = "restore_health_extreme"
	results = list("restore_health_extreme" = 2)
	required_reagents = list("restore_health_plentiful" = 2, "sabercatmeat" = 1)

/datum/chemical_reaction/cure_poison_minor
	name = "Cure Poison (Minor)"
	id = "cure_poison_minor"
	results = list("cure_poison_minor" = 2)
	required_reagents = list("wheat" = 1, "mudcrabchitin" = 1)

/datum/chemical_reaction/cure_poison_plentiful
	name = "Cure Poison (Plentiful)"
	id = "cure_poison_plentiful"
	results = list("cure_poison_plentiful" = 2)
	required_reagents = list("cure_poison_minor" = 2, "skeevermeat" = 1)

/datum/chemical_reaction/cure_poison_extreme
	name = "Cure Poison (Extreme)"
	id = "cure_poison_extreme"
	results = list("cure_poison_extreme" = 2)
	required_reagents = list("cure_poison_plentiful" = 2, "sabercatmeat" = 1)

/datum/chemical_reaction/fortify_health
	name = "Fortify Health"
	id = "fortify_health"
	results = list("fortify_health" = 2)
	required_reagents = list("flyamanita" = 1, "mountainflowers" = 1)

/datum/chemical_reaction/fortify_stamina
	name = "Fortify Stamina"
	id = "fortify_stamina"
	results = list("fortify_stamina" = 2)
	required_reagents = list("bearmeat" = 1, "mountainflowers" = 1)

/datum/chemical_reaction/fortify_magicka
	name = "Fortify Magicka"
	id = "fortify_magicka"
	results = list("fortify_magicka" = 2)
	required_reagents = list("hangingmoss" = 1, "mountainflowers" = 1)

/datum/chemical_reaction/invisibility
	name = "Invisibility"
	id = "invisibility"
	results = list("invisibility" = 2)
	required_reagents = list("nirnroot" = 1, "chauruseggs" = 1)

/datum/chemical_reaction/fortify_melee
	name = "Fortify Melee"
	id = "fortify_melee"
	results = list("fortify_melee" = 2)
	required_reagents = list("bearmeat" = 1, "hangingmoss" = 1)

/datum/chemical_reaction/stabilize_temperature
	name = "Stabilize Temperature"
	id = "stabilize_temperature"
	results = list("stabilize_temperature" = 2)
	required_reagents = list("mudcrabchitin" = 1, "mountainflowers" = 1)

/datum/chemical_reaction/hawkeye
	name = "Hawkeye"
	id = "hawkeye"
	results = list("hawkeye" = 2)
	required_reagents = list("spidermeat" = 1, "mammothtusk" = 1)

/datum/chemical_reaction/damage_health_weak
	name = "Damage Health (Weak)"
	id = "damage_health_weak"
	results = list("damage_health_weak" = 2)
	required_reagents = list("nightshade" = 1, "mountainflowers" = 1)

/datum/chemical_reaction/damage_health_potent
	name = "Damage Health (Potent)"
	id = "damage_health_potent"
	results = list("damage_health_potent" = 2)
	required_reagents = list("damage_health_weak" = 2, "deathbell" = 1)

/datum/chemical_reaction/damage_health_deadly
	name = "Damage Health (Strong)"
	id = "damage_health_strong"
	results = list("damage_health_deadly" = 2)
	required_reagents = list("damage_health_potent" = 2, "nirnroot" = 1)

/datum/chemical_reaction/damage_stamina
	name = "Damage Stamina"
	id = "damage_stamina"
	results = list("damage_stamina" = 2)
	required_reagents = list("deathbell" = 1, "blisterwort" = 1)

/datum/chemical_reaction/damage_magicka_weak
	name = "Damage Magicka (Weak)"
	id = "damage_magicka_weak"
	results = list("damage_magicka_weak" = 2)
	required_reagents = list("nightshade" = 1, "hangingmoss" = 1)

/datum/chemical_reaction/damage_magicka_potent
	name = "Damage Magicka (Potent)"
	id = "damage_magicka_potent"
	results = list("damage_magicka_potent" = 2)
	required_reagents = list("damage_magicka_weak" = 2, "spidermeat" = 1)

/datum/chemical_reaction/damage_magicka_deadly
	name = "Damage Magicka (Deadly)"
	id = "damage_magicka_deadly"
	results = list("damage_health_deadly" = 2)
	required_reagents = list("damage_magicka_potent" = 2, "chauruseggs" = 1)

/datum/chemical_reaction/combustion
	name = "Alchemical Combustion"
	id = "combustion"
	results = list("combustion" = 2)
	required_reagents = list("mammothtusk" = 1, "chauruseggs" = 1)