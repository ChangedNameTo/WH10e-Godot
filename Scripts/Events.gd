extends Node

signal action_confirmed()

signal log_event(type, text)

signal spawn_model(unit_instance)

signal unit_entered_army(unit_instance)
signal model_entered_table(model_instance)

signal unit_cohesion_toggle()

signal unit_selected(unit_instance)
signal model_selected(model_instance)

signal unit_deselected()
signal model_deselected()
