extends AnimationTree

var is_moving
var is_jumping

func _ready():
	active = true
	set("parameters/Blend2/blend_amount", 0)

func _process(delta):
	is_moving = false
	is_jumping = false
	
	if (Input.is_action_pressed("move_forward")):
		is_moving = true
	if (Input.is_action_pressed("move_backward")):
		is_moving = true
	if (Input.is_action_pressed("move_left")):
		is_moving = true
	if (Input.is_action_pressed("move_right")):
		is_moving = true
	if (Input.is_action_just_pressed("jump") && get_parent().is_on_floor()):
		is_jumping = true
	
	if (is_moving && !is_jumping):
		set("parameters/Blend2/blend_amount", lerp(get("parameters/Blend2/blend_amount"), 1, delta * 3))
	elif (!is_moving && !is_jumping):
		set("parameters/Blend2/blend_amount", lerp(get("parameters/Blend2/blend_amount"), 0, delta * 5))
	else:
		set("parameters/OneShot/active", true)
