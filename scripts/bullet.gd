extends TestCube

# Accuracy Internatiol AWM (Sniper Rifle)
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
var number_z = range(-100,100)[randi()%range(-100,100).size()]

onready var speed = 910 * get_translation().normalized()

func _ready():
	randomize()
	
	print(number_x)
	print(number_z)
	#set_process(true)
	#set_translation(bullet)
	
	pass


func _process(delta):
	var bullet = get_translation()
	var force_gravity = mass * grav_acc
	var wind_x = Vector3()
	wind_x.x = number_x
	var wind_z = Vector3()
	wind_z.z = number_z
	
	
	var force_wind_x = Vector3()
	force_wind_x.x = k * wind_x.x * wind_x.x * wind_x.normalized().x
	var force_wind_z = Vector3()
	force_wind_z.z = k * wind_z.z * wind_z.z * wind_z.normalized().z
	var acceleration = (force_wind_x + force_wind_z + force_gravity)/mass
	
	
	speed += delta * acceleration
	bullet = delta * speed + get_translation()
	look_at(get_translation() + speed,Vector3(0,1,0))
	set_translation(bullet)
	print(get_translation())
	# print(speed)
	
	
	pass