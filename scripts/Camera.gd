extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export(float) var sensitivity = 1

var cameraFront
var yaw = 0
var pitch = 0


func _ready():
	
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	cameraFront = Vector3(0, 0, 1)

	set_process_input(true)

func _input(event):
	
	if(event.type == InputEvent.MOUSE_MOTION):
		yaw += event.relative_x * sensitivity
		pitch += event.relative_y * sensitivity
		
		if pitch > 89.0:
			pitch = 89.0
	
		if pitch < -89.0:
			pitch = -89.0
		
		var front = Vector3()
		front.x = cos(deg2rad(yaw)) * cos(deg2rad(pitch))
		front.y = -sin(deg2rad(pitch))
		front.z = sin(deg2rad(yaw)) * cos(deg2rad(pitch))
		
		cameraFront = front.normalized()
		look_at(get_translation() + cameraFront, Vector3(0, 1, 0))	