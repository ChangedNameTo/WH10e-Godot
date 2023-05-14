extends CSGCylinder3D


# Called when the node enters the scene tree for the first time.
func _ready():
	Events.unit_cohesion_toggle.connect(on_unit_cohesion_toggle)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var on_unit_cohesion_toggle = func _on_unit_cohesion_toggle():
	self.visible = !self.visible
