extends VBoxContainer

@export var team: Globals.Team

var selectionButtonGroup = ButtonGroup.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	
	for faction in Globals.Faction.values():
		var newCheckbox = CheckBox.new()
		newCheckbox.set_text(faction)
		
		# Grab faction icon
		var factionIcon = load("res://Assets/Icons/Factions/%s.svg" % [faction])
		
		newCheckbox.set_button_icon(factionIcon)
		newCheckbox.expand_icon = true
		newCheckbox.set_button_group(selectionButtonGroup)
		
		self.add_child(newCheckbox)


	$TeamLabel.set_text(Globals.get_team_label(team))
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
