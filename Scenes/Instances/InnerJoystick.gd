extends TouchScreenButton

#Will be used to centralize the joystick aroung the cursos/finger
var radius = Vector2(34, 38)
var bound = 32 
var initialPos = Vector2(0,0)

var keepDrag = -1

func _process(delta):
	if keepDrag == -1:
		var pos_difference = (Vector2(0,0) - radius) - position
		position += pos_difference
		
func _read():
	initialPos = get_parent().position

#Returns Joystick position + the radius, which will be used to cetnralize 
func get_button_pos():
	return position + radius

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