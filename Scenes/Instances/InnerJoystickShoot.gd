extends TouchScreenButton

#Will be used to centralize the joystick aroung the cursos/finger
var radius = Vector2(34, 38)
var bound = 32 
var initialPos = Vector2(0,0)

var gun

signal walkRight
signal walkLeft
signal stopWalk
signal crouch
signal stand
signal jump

var parentPos = Vector2(0,0)

var return_accel = 20
var keepDrag = -1

func _ready():
	#initialPos = get_parent().global_position()
	
	#In this line, we'll be specifying what the player is, by giving the directory to the Player game object
	var player = get_node("/root/Test World/Player")
	gun = get_node("/root/Interface/Gun") 
	
func _process(delta):
	
	converttoAnlge()
	#print(get_button_pos())
	
	if keepDrag == -1:
		var pos_difference = (Vector2(0,0) - radius) - position
		position += pos_difference 
	
	
#
#	if get_button_pos().x > initialPos.x + 7:
#		emit_signal("walkRight")
#		#print("right")
#	elif get_button_pos().x < initialPos.x - 7 :
#		#print("left")
#		emit_signal("walkLeft")
#	elif get_button_pos().x < initialPos.x + 7 && get_button_pos().x > initialPos.x - 7 :
#		emit_signal("stopWalk")
#
#	if get_button_pos().y < initialPos.y -20:
#		emit_signal("jump")
#		print("PULO")
#
#	if get_button_pos().y > initialPos.y + 20:
#		emit_signal("crouch")
#	elif get_button_pos().y > initialPos.y -20 && get_button_pos().y < initialPos.y + 20:
#		emit_signal("stand")
#


#Returns Joystick position + the radius, which will be used to cetnralize 
func get_button_pos():
	return position + radius

func converttoAnlge():
	var tempangle = atan2(get_button_pos().y, get_button_pos().x)
	var angle = rad2deg(tempangle)
	
	#print(angle)
	#gun.setRotation(angle)
	return angle

#The event defines the input
func _input(event):
	
	#InputEventScreenDrag checks if the button is  being dragged, while InputEventScreenTouch checks is the button is pressed. The last event checks what type of Input it is (just pressed, hold, etc.)
	if event is InputEventScreenDrag or (event is InputEventScreenTouch and event.is_pressed()): 
		var event_dist_from_center = (event.position - get_parent().global_position).length()
		
		if event_dist_from_center <= bound * global_scale.x or event.get_index() == keepDrag:
			#centralizing. The global_scale make sure that the radius changes relative to the size of the joystick 
			set_global_position(event.position - radius * global_scale)
		
			if get_button_pos().length() > bound:
				set_position(get_button_pos().normalized()*bound - radius)
			
			keepDrag = event.get_index()
		pass
	
	if event is InputEventScreenTouch and !event.is_pressed() and event.get_index() == keepDrag:
		keepDrag = -1 
		#set_global_position(initialPos)


