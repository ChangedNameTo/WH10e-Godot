extends StaticBody3D

# Called when the node enters the scene tree for the first time.
func _ready():
	print('hi')
	self.connect("input_event", on_input_event)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var on_input_event = func _on_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		# If there is a selected unit and the game state is unit placement, spawn a model
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed and Globals.selectedUnit:
			Globals.selectedUnit.spawn_model(position)
