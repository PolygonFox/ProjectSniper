extends TestCube

#Accuracy Internatiol AWM (Sniper Rifle)
# Length = 1200 mm
# Barrel Length = 660 mm
# Cartridge = .300 Winchester Magnum
# Firing Range = 1100 m

var mass = 11.66 / 1000
# kg
var drag = Vector3(0,0,0)
# N
var RGN = 0
# Randomly Generated Number
var wind_speed = RGN * Vector3(0,0,0)
# m/s
var grav_acc = Vector3(0,-9.81,0)
# m/(s^2)
var k = 0.000015
# kg/m

func _ready():
	
	set_process(true)
	#set_translation(bullet)
	
	pass


func _process(delta):
	
	var bullet = get_translation()
	var speed = 910 * get_translation().normalized()
	var force_gravity = mass * grav_acc
	var wind = Vector3()
	wind.x = rand_range(-100,100)
	wind.z = rand_range(-100,100)
	var force_wind = Vector3()
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