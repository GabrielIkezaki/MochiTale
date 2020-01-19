extends AnimatedSprite

var bullet = preload("res://Scenes/Instances/Bullet.tscn")
onready var screenShaker = get_node("../Camera2D/ScreenShaker")
#export(NodePath) var screenShaker
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var playerSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	playerSprite = get_node("../").get_child(0)
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		print("shoot")
		var tempBullet = bullet.instance() 
		stop()
		play("Idle")
		play("Shoot")
		
		get_parent().get_parent().add_child(tempBullet)

		
		tempBullet.position = $PrimaryWeaponPos.global_position


		tempBullet.rotation_degrees = rotation_degrees
		
		tempBullet.instantiatedBullet(rotation_degrees + 90, $PrimaryWeaponPos.global_position.x, $PrimaryWeaponPos.global_position.y)
		screenShaker.start()
		
	pass

func _setRotation(var degNum):
	rotation_degrees = degNum
	flipSprite(playerSprite)


func flipSprite(var playerSprite):
	if rotation_degrees < -90 and rotation_degrees != 0 or rotation_degrees > 90 and rotation_degrees != 0:
		flip_v = true
		flip_h = false 
	else:
		flip_v = false
		flip_h = false
		
	if rotation_degrees == 0:
		if playerSprite.flip_h == false:
			flip_h = false
		elif playerSprite.flip_h == true:
			flip_h = true 

 

