extends KinematicBody2D

const speed = 700
var motion = Vector2(0,0)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	#var start = $Transform.position 
	
	
	
	pass # Replace with function body.

func _process(delta):
	Shoot(90, 650.851, 334.256)


func Shoot(var angle, var xstartingPoint, var ystartingPoint):
	
	var startingPoint = Vector2(xstartingPoint, ystartingPoint)
	
	var xDirection = startingPoint.x + sin(angle * PI/180) * 1
	var yDirection = startingPoint.y + cos(angle * PI/180) * 1
	
	var tempDirection = Vector2(xDirection, yDirection)
	var moveDirection = (startingPoint - tempDirection).normalized()*speed
	
	motion = Vector2(-moveDirection.x, moveDirection.y)
	
	motion = move_and_slide(motion)

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
