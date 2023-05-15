extends CharacterBody3D

# How fast the player moves in meters per second.
@export var speed = 14
# The downward acceleration when in the air, in meters per second squared.
@export var fall_acceleration = 75

var target_velocity = Vector3.ZERO

var wounds;
var move;
var unit;
var team;
var number

func init(unit_p, team_p, move_p, wounds_p, number_p):
	wounds = wounds_p;
	move = move_p;
	
	unit = unit_p;
	team = team_p;
	number = number_p;

func _ready():
	pass
#	Events.emit_signal("log_event", "Space Marine", "Entered Field")
#	Events.emit_signal("model_entered_table", self, unit, team)

func _physics_process(delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("move_right"):
		direction.z += 1
	if Input.is_action_pressed("move_left"):
		direction.z -= 1
	if Input.is_action_pressed("move_back"):
		direction.x -= 1
	if Input.is_action_pressed("move_forward"):
		direction.x += 1

	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.look_at(position + direction, Vector3.UP)

	# Ground Velocity
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed

	# Vertical Velocity
	if not is_on_floor(): # If in the air, fall towards the floor. Literally gravity
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)

	# Moving the Character
	velocity = target_velocity
	move_and_slide()

func get_team():
	return team

func get_unit():
	return unit.get_unit()

func get_model_name():
	return get_unit() + " " + number

