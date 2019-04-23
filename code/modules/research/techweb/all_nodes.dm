
//Current rate: 135000 research points in 90 minutes

//Base Nodes
/datum/techweb_node/base
	id = "base"
	starting_node = TRUE
	display_name = "Basic Research Technology"
	description = "NT default research technologies."
	// Default research tech, prevents bricking
	design_ids = list("packagewrap", "beaker", "large_beaker", "bucket")

//Helpers for debugging/balancing the techweb in its entirety!
/proc/total_techweb_exports()
	var/list/datum/techweb_node/processing = list()
	for(var/i in subtypesof(/datum/techweb_node))
		processing += new i
	. = 0
	for(var/i in processing)
		var/datum/techweb_node/TN = i
		. += TN.export_price

/proc/total_techweb_points()
	var/list/datum/techweb_node/processing = list()
	for(var/i in subtypesof(/datum/techweb_node))
		processing += new i
	var/datum/techweb/TW = new
	TW.research_points = list()
	for(var/i in processing)
		var/datum/techweb_node/TN = i
		TW.add_point_list(TN.research_costs)
	return TW.research_points

/proc/total_techweb_points_printout()
	var/list/datum/techweb_node/processing = list()
	for(var/i in subtypesof(/datum/techweb_node))
		processing += new i
	var/datum/techweb/TW = new
	TW.research_points = list()
	for(var/i in processing)
		var/datum/techweb_node/TN = i
		TW.add_point_list(TN.research_costs)
	return TW.printout_points()
