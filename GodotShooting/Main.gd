extends Node2D

const SCREEN_WIDTH = 500
const SCREEN_HEIGHT = 800
const LR_LIMIT = 32
const FIGHTER_LEFT = LR_LIMIT
const FIGHTER_RIGHT = SCREEN_WIDTH - LR_LIMIT
const ENEMY_Y0 = 100
const ENEMY_DY = 64
const ENEMY_X0 = 64
const ENEMY_DX = 64

var Enemy = load("res://Enemy.tscn")

func _ready():
	for i in range(5):
		var py = ENEMY_Y0 + ENEMY_DY*i
		for k in range(7):
			var px = ENEMY_X0 + ENEMY_DX*k
			var en = Enemy.instance()
			add_child(en)
			en.position = Vector2(px, py)
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
		$AudioBeamGun.play()
		#var b = $Fighter/RayCast2D.is_colliding()
		#print("is_colliding = ", b)
		var obj = $Fighter/RayCast2D.get_collider()
		if obj != null:
			remove_child(obj)
			obj.queue_free()
	else:
		$Fighter/Line2D.hide()
	pass
