extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var bullet = get_node("Bullet")
onready var tip = get_node("Barrel_tip")
var size = Vector3(0.1,0.1,0.1)
func _ready():
	set_process(true)
	set_process_input(true)
	
	pass



func _input(event):
	if event.is_action_pressed("left_mouse_button"):
		_fire()
	pass 
	
func _fire():
	var instance = bullet.duplicate(true)
	#instance.get_parent().remove_child(instance)
	get_node("/root").add_child(instance)
	instance.set_global_transform(tip.get_global_transform())
	instance.set_scale(size)
	instance.show()
	instance.set_process(true)
	pass
