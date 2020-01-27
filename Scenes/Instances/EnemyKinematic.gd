extends KinematicBody2D

var teste = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Enemy_CollisionArea_area_entered(area):
	if "Bullet" in area.name:
		teste += 1
		print(teste)
	
	if "Player" in area.name:
		print("touching player")
	pass # Replace with function body.


func _on_Enemy_CollisionArea_body_entered(body):
	if "Player" in body.name:
		print("touching player")
	pass # Replace with function body.
