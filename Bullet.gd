extends KinematicBody2D

var isFlying = false
const speed = 5000
var motion = Vector2(0,0)
var dirAngle
var xinitialPoint
var yinitialPoint
var movingTrack = Vector2(0,0)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	#var start = $Transform.position 
	
	
	
	pass # Replace with function body.

func _process(delta):
	
	$SD_Timer.start()
	
	if isFlying:
		Shoot(dirAngle, xinitialPoint, yinitialPoint)
	
	#Shoot(90, 90.693, 358.738)
	pass

func instantiatedBullet(var angle, var xstartingPoint, var ystartingPoint):
	dirAngle = angle 
	xinitialPoint = xstartingPoint
	yinitialPoint = ystartingPoint
	
	isFlying = true	
	


func Shoot(var angle, var xstartingPoint, var ystartingPoint):
	
	var startingPoint = Vector2(xstartingPoint, ystartingPoint)
	
	var xDirection = startingPoint.x + sin(angle * PI/180) * 1
	var yDirection = startingPoint.y + cos(angle * PI/180) * 1
	
	var tempDirection = Vector2(xDirection, yDirection)
	var moveDirection = (startingPoint - tempDirection).normalized()*speed
	
	motion = Vector2(-moveDirection.x, moveDirection.y)
	movingTrack = motion
	
	motion = move_and_slide(motion)


func returnDirection():
	return movingTrack
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_SD_Timer_timeout():
	print("ARROYO")
	queue_free()
	pass # Replace with function body.


func _on_BulletCollisionArea_area_entered(area):
	if area.is_in_group("Enemies"):
		print("HIT ENEMY")
	pass # Replace with function body.


func _on_BulletCollisionArea_body_entered(body):
	if body.is_in_group("Enemies"):
		print("HIT ENEMY")
	pass # Replace with function body.
