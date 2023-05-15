extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
	Events.unit_selected.connect(on_unit_selected)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var on_unit_selected = func _on_unit_selected(unit_instance):
	print(unit_instance)
	self.text = unit_instance.get_unit()
