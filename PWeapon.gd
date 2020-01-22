extends Node

var isPressing = false
var deviateAngle
var bulletNum
var startTimer = false 
var resetTimer = false 

var bullet = preload("res://Scenes/Instances/Bullet.tscn")
onready var screenShaker = get_node("../Camera2D/ScreenShaker")
onready var sprite = $PWeapon_sprite

export(int) var bulletpershot = 0
export(float) var fireRate = 0 
export(float) var deviation = 0
export(int) var magazineSize = 0
export(int) var totalAmmo = 0
export(String) var idleanim = "."
export(String) var shootanim = "."

#export(NodePath) var screenShaker
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var playerSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	bulletNum = magazineSize
	playerSprite = get_node("../").get_child(0)
	pass # Replace with function body.

func _process(delta):
	
	if startTimer && resetTimer:
		opperateWeapon(fireRate)
		resetTimer = false
	
	if isPressing == true:
		if !startTimer:
			startTimer = true
			resetTimer = true
	elif isPressing == false:
		startTimer = false
		$FireTimer.stop()
		#opperateWeapon(fireRate)
	pass
func _setRotation(var degNum):
	sprite.rotation_degrees = degNum
	flipSprite(playerSprite)
	#print("NEW WEAPPPPOOOOOOOON")
func opperateWeapon(var waitTime, var one = 1):
	
	print("timer STARTED")
	$FireTimer.wait_time = waitTime
	$FireTimer.start()

func _reload():
	if totalAmmo >= magazineSize:
		bulletNum += (magazineSize - bulletNum)
		totalAmmo -= (magazineSize - bulletNum)

func _shootBullet():
	print("shoot")
	
	sprite.stop()
	sprite.play(idleanim)
	sprite.play(shootanim)
	

	
	
	for i in range(0, bulletpershot):
		var tempBullet = bullet.instance() 
		get_parent().get_parent().add_child(tempBullet)
	
		tempBullet.position = $PWeapon_sprite/Shoot_pos.global_position
		tempBullet.rotation_degrees = sprite.rotation_degrees
		deviateAngle = rand_range(-deviation, deviation)
		tempBullet.instantiatedBullet((sprite.rotation_degrees + 90) + deviateAngle, $PWeapon_sprite/Shoot_pos.global_position.x, $PWeapon_sprite/Shoot_pos.global_position.y)
	
	screenShaker.start()
	
	bulletNum -= bulletpershot

func _inputReleasing():
	isPressing = false
	print(isPressing)
	#print("RELEASED SIGNAL")
	
func _inputPressing():
	isPressing = true
	print(isPressing)
	#print("PRESSED SIGNAL")


func flipSprite(var playerSprite):
	if sprite.rotation_degrees < -90 and sprite.rotation_degrees != 0 or sprite.rotation_degrees > 90 and sprite.rotation_degrees != 0:
		sprite.flip_v = true
		sprite.flip_h = false 
	else:
		sprite.flip_v = false
		sprite.flip_h = false
		
	if sprite.rotation_degrees == 0:
		if playerSprite.flip_h == false:
			sprite.flip_h = false
		elif playerSprite.flip_h == true:
			sprite.flip_h = true 

 





func _on_FireTimer_timeout():
	if bulletNum > 0:
		_shootBullet()
		resetTimer = true 
	pass # Replace with function body.
