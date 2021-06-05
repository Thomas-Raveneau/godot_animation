extends KinematicBody

var camera

export var velocity = Vector3()
var jump = 5

const GRAVITY = 9.8
const SPEED = 6
const ACCELERATION = 3
const DEACCELERATION = 5

func _ready():
	 pass

func _physics_process(delta):
	camera = $CameraTarget/Camera.get_global_transform()
	var is_moving = false
	var dir = Vector3()

	if(Input.is_action_pressed("move_forward")):
		dir += -camera.basis[2]
		is_moving = true
	if(Input.is_action_pressed("move_backward")):
		dir += camera.basis[2]
		is_moving = true
	if(Input.is_action_pressed("move_left")):
		dir += -camera.basis[0]
		is_moving = true
	if(Input.is_action_pressed("move_right")):
		dir += camera.basis[0]
		is_moving = true
	if(Input.is_action_just_pressed("jump") and is_on_floor()):
		velocity.y = jump
	
	
	dir.y = 0
	dir = dir.normalized()
	
	
	velocity.y -= delta * GRAVITY
	
	var hv = velocity
	hv.y = 0
	
	var new_pos = dir * SPEED
	var accel = DEACCELERATION
	
	if (dir.dot(hv) > 0):
		accel = ACCELERATION
	
	hv = hv.linear_interpolate(new_pos, accel * delta)
	
	velocity.x = hv.x
	velocity.z = hv.z 
	
	velocity = move_and_slide(velocity, Vector3(0, 1, 0))
	
	if (is_moving):
		var angle = atan2(hv.x, hv.z)
		var player_rot = self.get_rotation()
		
		player_rot.y = angle
		self.set_rotation(player_rot)

func handleInputs():
	pass
