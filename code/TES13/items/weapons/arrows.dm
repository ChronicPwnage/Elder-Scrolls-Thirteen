//arrow variations go in here- arrow code in archery.dm. for reference:
/*
/obj/item/weapon/arrow
	name = "placeholder arrow"
	desc = "A sturdy wooden arrow tipped with iron. You shouldn't really be seeing this."
	icon = 'icons/obj/ammo.dmi'
	icon_state = "arrow"
	item_state = "arrow"
	throwforce = 10
	throw_range = 6
	var/recoverchance = 0 //% for arrow to remain after being fired
	w_class = WEIGHT_CLASS_NORMAL
*/

/obj/item/weapon/arrow/bow
	name = "arrow"
	desc = "A sturdy wooden arrow tipped with iron."

/obj/item/ammo_casing/arrow/bow
	name = "bowstring"
	desc = "A sinew bowstring."
	projectile_type = /obj/item/projectile/bullet/dart/arrow/bow
	firing_effect_type = null

/obj/item/projectile/bullet/dart/arrow/bow
	name = "arrow"
	icon_state = "arrow"
	damage = 40

/obj/item/weapon/arrow/bow/practice
	name = "practice arrow"
	desc = "It's just a long shaft of wood. It doesn't look very powerful."
	icon_state = "practicearrow"
	recoverchance = 100
	throwforce = 5 //doesn't even have a tip

/obj/item/ammo_casing/arrow/bow/practice
	name = "bowstring"
	desc = "A sinew bowstring."
	projectile_type = /obj/item/projectile/bullet/dart/arrow/bow/practice
	firing_effect_type = null

/obj/item/projectile/bullet/dart/arrow/bow/practice
	name = "practice arrow"
	icon_state = "practicearrow"
	damage = 15

/obj/item/weapon/arrow/crossbow
	name = "bolt"
	desc = "A sturdy metal crossbow bolt forged from iron."
	icon_state = "bolt"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/ammo_casing/arrow/crossbow
	name = "crossbow string"
	desc = "A sinew bowstring."
	projectile_type = /obj/item/projectile/bullet/dart/arrow/crossbow
	firing_effect_type = null

/obj/item/projectile/bullet/dart/arrow/crossbow
	name = "crossbow bolt"
	icon_state = "bolt"
	damage = 30

/obj/item/weapon/arrow/lightcrossbow
	name = "light bolt"
	desc = "A sturdy metal crossbow bolt forged from iron. This one is designed for a light crossbow."
	icon_state = "bolt"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/ammo_casing/arrow/lightcrossbow
	name = "crossbow string"
	desc = "A sinew bowstring."
	projectile_type = /obj/item/projectile/bullet/dart/arrow/crossbow
	firing_effect_type = null

/obj/item/projectile/bullet/dart/arrow/lightcrossbow
	name = "light crossbow bolt"
	icon_state = "bolt"
	damage = 20
