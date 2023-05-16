extends Node

enum Team {
	Attacking,
	Defending
}

const Colors = {
	# Ultramarine Blue
	AttackingTeamColor = Color(.255, .4, .961),
	# Khorne Red
	DefendingTeamColor = Color(.424, 0.008, 0.004)
}

const Phases = {
	"MusterArmies" : "Muster Armies",
	"MissionSelect" : "Mission Select",
	"PickSides" : "Pick Sides",
	"CoinFlip" : "Flip Coin for 1st Turn"
}

const StrikeForce = {
	"points":2000,
	"name":"Strike Force"
}

const Game_Format = {
	"Incursion" = "Incursion",
	"Strike_Force" = StrikeForce,
	"Onslaught" = "Onslaught"
}

enum Type {
	Unit,
	Model
}

const BattefieldRole = {
	"HQ" : "HQ",
	"Troops" : "Troops",
	"Elites" : "Elites",
	"FastAttack" : "Fast Attack",
	"Flyer" : "Flyer",
	"HeavySupport" : "Heavy Support",
	"Fortification" : "Fortification",
	"DedicatedTransport" : "Dedicated Transport",
	"LordOfWar" : "Lord of War"
}

const Faction = {
	"SpaceMarines": "Space Marines",
	"Necrons" : "Necrons"
}

var selectedUnit;
var unitCohesionToggled = false;

func _ready():
	setup_event_connections()

func setup_event_connections():
	Events.unit_selected.connect(on_unit_selected)
	Events.unit_cohesion_toggle.connect(on_unit_cohesion_toggle)

func get_team_label(team):
		return "Attacking" if team == Globals.Team.Attacking else "Defending"

var on_unit_selected = func _on_unit_selected(unit_instance):
	selectedUnit = unit_instance

var on_unit_cohesion_toggle = func _on_unit_cohesion_toggle():
	unitCohesionToggled = !unitCohesionToggled
