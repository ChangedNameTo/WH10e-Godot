extends Node

@export var team: Globals.Team

var faction;
var armyUnits = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setFaction(faction):
	self.faction = faction
