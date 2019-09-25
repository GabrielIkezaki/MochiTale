extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	var Joystick = get_node("/root/Test World/Interface/CanvasLayer/VBoxContainer/OuterJoystickSprite/InnerJoystick")
	#Joystick.connect("walkRight", self, "_on_walk_Right")
	pass # Replace with function body.

	

func _on_walk_Right():
	print("frente")
	
func _on_walk_Left():
	print("tras")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
