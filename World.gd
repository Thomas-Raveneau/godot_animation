extends WorldEnvironment

var platform = preload("res://Platform.tscn")

var OFFSET = 2
var PLATFORM_SIZE = 10
var current_z

func _ready():
	current_z = 4
	for n in (10):
		create_platform(Vector3(0, 0, current_z))
		current_z += PLATFORM_SIZE + OFFSET
		n += 1
		

func _process(delta):
	pass

func create_platform(position: Vector3):
	var new_platform = platform.instance()
	
	new_platform.set_global_transform(Transform(Basis(), position))
	
	add_child(new_platform)
