extends Tree

# Called when the node enters the scene tree for the first time.
func _ready():
	# Sets up the tree
	var root = self.create_item()

	# Creates the attacker and defender trees
	var attacker_tree = self.create_item(root)
	var defender_tree = self.create_item(root)
	root.set_text(0, '')
	self.hide_root = true
	attacker_tree.set_text(0, "Attacking Troops")
	defender_tree.set_text(0, "Defending Troops")
	Events.model_entered_table.connect(on_model_enter_table)

func attacking_tree():
	return self.get_root().get_children().filter(func(x): return x.get_text(0) == "Attacking Troops")[0]
	
func defending_tree():
	return self.get_root().get_children().filter(func(x): return x.get_text(0) == "Defending Troops")[0]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var on_model_enter_table = func _on_model_enter_table(model_instance, model_name, team):
	var new_unit;
	if team == Globals.Team.Attacker:
		new_unit = self.create_item(attacking_tree())
	else:
		new_unit = self.create_item(defending_tree())

	new_unit.set_text(0, model_name)
	
	# Stores the original model instance so we can find it later
	new_unit.set_metadata(0, model_instance)
