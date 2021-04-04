extends Node2D

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var dx = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	if dx != 0:
		#print(dx)
		$Fighter.position.x += dx * 4
	pass
