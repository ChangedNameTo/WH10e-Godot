extends MeshInstance3D

# Called when the node enters the scene tree for the first time.
func _ready():
	var root_node = self.get_owner()
	var team = root_node.get_team()
	
	if(team == Globals.Team.Attacker):
		self.get_active_material(0).albedo_color = Globals.Colors.AttackingTeamColor
	else:
		self.get_active_material(0).albedo_color = Globals.Colors.DefendingTeamColor

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
