extends Node

@export var model_scene: PackedScene

var unit_name = "Space Marine Intercessors"
var team = Globals.Team.Attacking
var type = Globals.Type.Unit

var move = 5
var toughness = 4
var save = 3
var wounds = 2
var leadership = 6
var objective_control = 2

var model_count = 10
var unit_models = []

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	
	Events.emit_signal("unit_entered_army", self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_team():
	return self.team

func get_unit_name():
	return self.unit_name

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

func get_move():
	return self.move

func spawn_model(position):
	# Check that we have a unit selected, that it's not full, and that this placement is valid
	if !is_unit_full():
		# Instantiate the model and add it to the scene
		var model_instance = model_scene.instantiate()
		model_instance.init(self, team, move, wounds, self.next_model_number())
		self.add_child(model_instance)
		self.unit_models.append(model_instance)
		model_instance.position = position
		
		Events.emit_signal("model_entered_table", model_instance)
