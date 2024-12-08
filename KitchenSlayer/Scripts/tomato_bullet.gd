extends CharacterBody2D

const SPEED = 200.0

var dir : int
var spawnPos : Vector2

func _physics_process(delta: float) -> void:
	position.x += SPEED * dir * delta
