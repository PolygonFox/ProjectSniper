extends TestCube

#Accuracy Internatiol AWM (Sniper Rifle)
# Length = 1200 mm
# Barrel Length = 660 mm
# Cartridge = .300 Winchester Magnum
# Firing Range = 1100 m

var mass = 11.66 / 1000
# kg
var grav_acc = Vector3(0,-9.81,0)
# m/(s^2)
var k = 0.000015
# kg/m
var number_x = range(-100,100)[randi()%range(-100,100).size()]
var number_y = range(-100,100)[randi()%range(-100,100).size()]


func _ready():
	randomize()
	print(number_x)
	print(number_y)
	#set_process(true)
	#set_translation(bullet)
	
	pass


func _process(delta):
	
	var bullet = get_translation()
	var speed = 910 * get_translation().normalized()
	var force_gravity = mass * grav_acc
	var wind = Vector3()
	wind.x = number_x
	wind.z = number_y
	
	
	var force_wind = Vector3() * wind.normalized()
	force_wind.x = k * wind.x * wind.x
	force_wind.y = k * wind.y * wind.y
	var acceleration = (force_wind + force_gravity)/mass
	speed += delta * acceleration
	bullet = delta * speed + get_translation()
	look_at(get_translation() + speed,Vector3(0,1,0))
	set_translation(bullet)
	#print(get_translation())
	print(speed)
	
	
	pass