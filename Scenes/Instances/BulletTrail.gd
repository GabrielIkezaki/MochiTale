extends Line2D

var point
var target
var initialPos
var counter = 0
export(NodePath) var targetPath
export var trailLength = 0
export var minLength = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	#initialPos = get_parent().BulletPos.global_position
	target = get_node(targetPath)
	initialPos = target.global_position
	
	point = target.global_position
	global_rotation = 0
		
	add_point(Vector2(0,0))
	add_point(Vector2(50,-50))
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#global_position = Vector2(100,-50)

	
#	while get_point_count() > trailLength:
#		remove_point(0)
	pass
