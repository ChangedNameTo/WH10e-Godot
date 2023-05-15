extends Node

@export var model_scene: PackedScene

var unit = "Space Marine Intercessors"
var team = Globals.Team.Attacker
var type = Globals.Type.Unit

var move = 12
var wounds = 2

var model_count = 10
var unit_models = []

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	
	Events.emit_signal("unit_entered_army", self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		match event.button_index:
			MOUSE_BUTTON_RIGHT:
				if !is_unit_full():
					var model_instance = model_scene.instantiate()
					model_instance.init(unit, team, move, wounds, self.next_model_number())
					self.add_child(model_instance)
					self.unit_models.append(model_instance)
			MOUSE_BUTTON_LEFT:
				pass

func get_team():
	return self.team

func get_unit():
	return self.unit

func get_models():
	return unit_models

func get_model_count():
	var curr_count = self.get_models().size()
	return "%s / %s" % [curr_count, model_count]

func is_unit_full():
	return unit_models.size() == model_count

func next_model_number():
	return unit_models.size() + 1

func get_type():
	return self.type
