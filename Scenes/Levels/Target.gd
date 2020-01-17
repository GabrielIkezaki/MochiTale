extends StaticBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_getHit():
	print("SHOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOT")

func _on_EnemyCollisionArea_area_entered(area):
	if "Shot" in area.name:
		print("Im hit")
	
	if "Player" in area.name:
		print("Touch player")
	pass # Replace with function body.


func _on_EnemyCollisionArea_body_entered(body):
	if "Shot" in body.name:
		print("Im hit")
	
	if "Player" in body.name:
		print("Touch player")
	pass # Replace with function body.
