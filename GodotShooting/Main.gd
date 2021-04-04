extends Node2D

const SCREEN_WIDTH = 500
const SCREEN_HEIGHT = 800
const LR_LIMIT = 32
const FIGHTER_LEFT = LR_LIMIT
const FIGHTER_RIGHT = SCREEN_WIDTH - LR_LIMIT

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var dx = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	if dx != 0:
		#print(dx)
		$Fighter.position.x += dx * 4
		$Fighter.position.x = max(FIGHTER_LEFT, $Fighter.position.x)
		$Fighter.position.x = min(FIGHTER_RIGHT, $Fighter.position.x)
	if Input.is_action_pressed("ui_accept"):
		$Fighter/Line2D.show()
	else:
		$Fighter/Line2D.hide()
	pass
