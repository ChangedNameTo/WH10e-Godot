extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
	Events.unit_selected.connect(on_unit_selected)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Globals.selectedUnit:
		self.text = Globals.selectedUnit.get_unit_name()
	else:
		self.text = "No Unit Selected"

var on_unit_selected = func _on_unit_selected(unit_instance):
	self.text = unit_instance.get_unit_name()

var on_unit_deselected = func _on_unit_deselected():
	self.text = "No Selected Unit"
