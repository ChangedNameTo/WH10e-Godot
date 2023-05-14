extends Node

var pressed = false;

@export var model_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		match event.button_index:
			MOUSE_BUTTON_RIGHT:
				var model_instance = model_scene.instantiate()
				self.add_child(model_instance)
			MOUSE_BUTTON_LEFT:
				pass
