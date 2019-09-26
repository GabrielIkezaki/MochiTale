extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var motion = Vector2 (0,0)
var goRight = false
var goLeft = false 
var stopMove = false
var crouching = false 


const hboxScale = Vector2(1,1)
const gravity = 10 
const UP = Vector2(0, -1)
const speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	var Joystick = get_node("/root/Test World/Interface/CanvasLayer/VBoxContainer/OuterJoystickSprite/InnerJoystick")
	#Joystick.connect("walkRight", self, "_on_walk_Right")
	pass # Replace with function body.

func _physics_process(delta):
	movement()
	animation()
	pass

func movement():
	
	motion.y += gravity
	
	if crouching:
		motion.x = motion.x/2
	
	
	if !stopMove:
		if goRight:
			motion.x = speed
		elif goLeft:
			motion.x = -speed
	else:
		motion.x = 0
	motion = move_and_slide(motion, UP) 
	pass

func _on_Crouch():
	crouching = true
	print("ducking")

func _on_Stand():
	crouching = false

func _on_walk_Right():
	goRight = true
	goLeft = false
	stopMove = false
	print("frente")
	
func _on_walk_Left():
	goLeft = true
	goRight = false
	stopMove = false
	print("tras")

func _on_walk_Stop():
	stopMove = true
	goRight = false
	goLeft = false 
	print("para")
	
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

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
