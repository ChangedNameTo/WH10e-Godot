extends CollisionShape3D


# Called when the node enters the scene tree for the first time.
func _ready():
	print('hi')
	self.connect("input_event", on_input_event)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var on_input_event = func _on_input_event(camera, event, position, normal, shape_idx):
	print('hi2')
	pass # Replace with function body.
