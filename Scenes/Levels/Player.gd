extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var ShootStick
var primaryWeapon

var motion = Vector2 (0,0)
var goRight = false
var goLeft = false 
var stopMove = false
var crouching = false 
var canJump = true


var interface

const hboxScale = Vector2(1,1)
const gravity = 30 
const UP = Vector2(0, -1)
const speed = 1000
const jumpSpeed = -700


signal getHit
# Called when the node enters the scene tree for the first time.
func _ready():
	primaryWeapon = get_child(1)
	interface = load("res://Scenes/Instances/Interface.tscn")
	var Joystick = get_node("../Interface/CanvasLayer/VBoxContainer/OuterJoystickSprite/InnerJoystick")
	ShootStick = get_node("../Interface/CanvasLayer/VBoxContainer/OuterJoystickShoot/InnerJoystickShoot")
	#Joystick.connect("walkRight", self, "_on_walk_Right")
	pass # Replace with function body.

func _physics_process(delta):
	movement()
	animation()

	pass

func movement():
	
	motion.y += gravity	
	
	rotateWeapon()
	
	if crouching:
		$CollisionShape2D
	if is_on_floor():
		canJump = true 
	
	if !stopMove:
		if goRight:
			if crouching:
				motion.x = speed/3
			else:
				motion.x = speed
		elif goLeft:
			
			if crouching:
				motion.x = -speed/3
			else:
				motion.x = -speed
	else:
		motion.x = 0
	motion = move_and_slide(motion, UP) 
	pass



func _on_Crouch():
	crouching = true
	#print("ducking")

func _on_Stand():
	crouching = false

func _on_walk_Right():
	goRight = true
	goLeft = false
	stopMove = false
	#print("frente")
	
func _on_walk_Left():
	goLeft = true
	goRight = false
	stopMove = false
	#print("tras")

func _on_walk_Stop():
	stopMove = true
	goRight = false
	goLeft = false 
	#print("para")
	
func _on_Jump():
	#print("And I heard as if it ")
	if canJump:
	#	print("FFFFFFFFF")
		motion.y = jumpSpeed
		canJump = false
	
func animation():
	if motion.x == 0 && motion.y == 0 && !crouching:
		$PlayerSprite.play("Idle")
	elif motion.x != 0 && motion.y == 0 && !crouching:
		$PlayerSprite.play("Move")
		
	if motion.x > 0:
		$PlayerSprite.flip_h = false
	elif motion.x < 0:
		$PlayerSprite.flip_h = true
		
	if crouching:
		$PlayerSprite.play("Duck")

func rotateWeapon():
	primaryWeapon._setRotation(ShootStick.converttoAnlge())
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
