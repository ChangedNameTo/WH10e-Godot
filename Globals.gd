extends Node

enum Team{Attacker, Defender}

const Colors = {
	# Ultramarine Blue
	AttackingTeamColor = Color(.255, .4, .961),
	# Khorne Red
	DefendingTeamColor = Color(.424, 0.008, 0.004)
}

const Phases = {
	"Mission_Select" : "Mission Select",
	"Game_Start" : "Game Start",
}

const strike_force = {
	"points":2000,
	"name":"Strike Force"
}

const Game_Format = {
	"Incursion" = "Incursion",
	"Strike_Force" = strike_force,
	"Onslaught" = "Onslaught"
}
