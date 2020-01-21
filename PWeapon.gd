extends Node

var isPressing = false
var deviateAngle
var bulletNum

var bullet = preload("res://Scenes/Instances/Bullet.tscn")
onready var screenShaker = get_node("../Camera2D/ScreenShaker")
onready var sprite = $PWeapon_sprite

export(float) var fireRate = 0 
export(float) var deviation = 0
export(int) var magazineSize = 0
export(int) var totalAmmo = 0


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
	
	if isPressing == false:
		opperateWeapon(fireRate)
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
	var tempBullet = bullet.instance() 
	sprite.stop()
	sprite.play("Idle")
	sprite.play("shoot")
	
	deviateAngle = rand_range(-deviation, deviation)
	
	get_parent().get_parent().add_child(tempBullet)
	
	tempBullet.position = $PWeapon_sprite/Shoot_pos.global_position


	tempBullet.rotation_degrees = sprite.rotation_degrees
	
	tempBullet.instantiatedBullet((sprite.rotation_degrees + 90) + deviateAngle, $PWeapon_sprite/Shoot_pos.global_position.x, $PWeapon_sprite/Shoot_pos.global_position.y)
	screenShaker.start()
	
	bulletNum -= 1

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
	pass # Replace with function body.
