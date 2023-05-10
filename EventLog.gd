extends ItemList


# Called when the node enters the scene tree for the first time.
func _ready():
	Events.log_event.connect(on_log_event)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func string_pad_number(number):
	if(number < 10):
		return ("0" + str(number))
	else:
		return str(number)

var on_log_event = func _on_log_event(type, text):
	var time = Time.get_time_dict_from_system()
	var time_string = string_pad_number(time.hour) +":" + string_pad_number(time.minute)+":" + string_pad_number(time.second)
	var item_string = "[%s][%s] %s" % [time_string, type, text]
	self.select(self.add_item(item_string))
	self.ensure_current_is_visible()
