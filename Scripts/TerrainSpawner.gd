extends MeshInstance3D

@export var tree_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	# Slightly change brightness to show regions
	var material = self.mesh.surface_get_material(0)
	var curr_albedo = material.albedo_color
	var offset = randf_range(-0.1, 0.1)
	material.set_albedo(curr_albedo.darkened(offset))
	
	var terrain_piece = tree_scene.instantiate()
	
	# Scales the tree to the proper size
	terrain_piece.set_scale(Vector3(0.001,0.001,0.001))
	
	# Gets a random x/z coordinate for positioning on the plane
	var x_coord = randf_range(-0.5, 0.5)
	var z_coord = randf_range(-0.5, 0.5)
	terrain_piece.set_position(Vector3(x_coord, 0, z_coord))
	self.add_child(terrain_piece)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
