extends TouchScreenButton

#Will be used to centralize the joystick aroung the cursos/finger
var radius = Vector2(32, 32)

#Returns Joystick position + the radius, which will be used to cetnralize 
func get_button_pos():
	return position + radius

#The event defines the input
func _input(event):
	
	#InputEventScreenDrag checks if the button is  being dragged, while InputEventScreenTouch checks is the button is pressed. The last event checks what type of Input it is (just pressed, hold, etc.)
	if event is InputEventScreenDrag or (event is InputEventScreenTouch and event.is_pressed()): 
		
		#centralizing. The global_scale make sure that the radius changes relative to the size of the joystick 
		set_global_position(event.position - radius * global_scale)
	pass