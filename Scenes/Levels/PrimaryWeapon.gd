extends AnimatedSprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var playerSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	playerSprite = get_node("../").get_child(0)
	pass # Replace with function body.

func _process(delta):
		
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

 

