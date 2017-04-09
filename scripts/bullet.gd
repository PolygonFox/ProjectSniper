extends TestCube

#Accuracy Internatiol AWM (Sniper Rifle)
# Length = 1200 mm
# Barrel Length = 660 mm
# Cartridge = .300 Winchester Magnum
# Firing Range = 1100 m
# 
var speed = 910 * Vector3(0,0,-1) / 1000
# m/s
var mass = 180
# g
var drag = Vector3(0,0,0)
# N
var RGN = 0
# Randomly Generated Number
var wind_speed = RGN * Vector3(0,0,0)
# m/s
var gravity = Vector3(0,-9.81,0)
# m/(s^2)


func _ready():
	
	set_process(true)
	#set_translation(bullet)
	
	pass


func _process(delta):
	var bullet = get_translation()
	var speed = 910 * get_translation().normalized()
	speed += delta * gravity
	bullet = delta * speed + get_translation()
	look_at(get_translation() + speed,Vector3(0,1,0))
	set_translation(bullet)
	#print(get_translation())
	
	pass