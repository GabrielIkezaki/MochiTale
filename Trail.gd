extends Line2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func addPoints(var xinit, var yinit, var xfinal, var yfinal):
	
	var initPoint = Vector2(xinit, yinit)
	var finalPoint = Vector2(xfinal, yfinal)
	
	add_point(initPoint)
	add_point(finalPoint)	
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
