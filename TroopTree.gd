extends Tree

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("item_selected", on_cell_selected)
	
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
	Events.unit_entered_army.connect(on_unit_enter_army)

func attacking_tree():
	return self.get_root().get_children().filter(func(x): return x.get_text(0) == "Attacking Troops")[0]
	
func defending_tree():
	return self.get_root().get_children().filter(func(x): return x.get_text(0) == "Defending Troops")[0]

func _process(delta):
	pass

var on_unit_enter_army = func _on_unit_enter_army(unit_instance):
	var new_unit;
	if unit_instance.get_team() == Globals.Team.Attacker:
		new_unit = self.create_item(attacking_tree())
	else:
		new_unit = self.create_item(defending_tree())
		
	new_unit.set_text(0, unit_instance.get_unit())
	new_unit.set_text(1, unit_instance.get_model_count())
	
	new_unit.set_metadata(0, unit_instance)
	new_unit.set_metadata(1, Globals.Type.Unit)

var on_model_enter_table = func _on_model_enter_table(model_instance):
	var new_unit;
	if model_instance.get_team() == Globals.Team.Attacker:
		new_unit = self.create_item(attacking_tree())
	else:
		new_unit = self.create_item(defending_tree())

	new_unit.set_text(0, model_instance.get_model_name())
	
	# Stores the original model instance so we can find it later
	new_unit.set_metadata(0, model_instance)

var on_cell_selected = func _on_cell_selected():
	var item = self.get_selected()
	

	
	print(item)
	var selected_item = item.get_metadata(0)
	
	# Ensure selected item is a unit
	if !selected_item:
		return
	
	# Fetches the unit type
	if selected_item.get_type() == Globals.Type.Unit:
		Events.emit_signal("unit_selected", selected_item)
	else:
		Events.emit_signal("model_selected", selected_item)
