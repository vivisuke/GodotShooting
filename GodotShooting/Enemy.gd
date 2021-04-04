extends KinematicBody2D

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	$Sprite.rotation += 2.0 * delta
