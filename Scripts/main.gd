extends Node

var currentGamePhase;
var currentGameTurn;
var currentSide;

func _ready():
	game_start()

func game_start():
	self.currentGamePhase = Globals.Phases.MusterArmies
	self.currentGameTurn = 1
	self.currentSide = Globals.Team.Attacking
	

func get_current_game_phase():
	return self.currentGamePhase
	
func get_current_game_turn():
	return self.currentGameTurn
	
func get_current_side():
	return self.currentSide
	
func get_attacking_army():
	return $AttackingArmy

func get_defending_army():
	return $DefendingArmy
