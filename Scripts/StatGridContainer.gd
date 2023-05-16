extends GridContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	Events.unit_selected.connect(on_unit_selected)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var on_unit_selected = func _on_unit_selected(unit_instance):
	print(unit_instance)
	$MoveStatContainer/MoveStat.text = str(unit_instance.get_move())
	$ToughnessStatContainer/ToughnessStat.text = '-'
	$SaveStatContainer/SaveStat.text = '-'
	$WoundStatContainer/WoundStat.text = '-'
	$LeadershipStatContainer/LeadershipStat.text = '-'
	$ObjectiveControlStatContainer/ObjectiveControlStat.text = '-'

var on_unit_deselected = func _on_unit_deselected():
	return

var on_model_selected = func _on_model_selected(model_instance):
	return
