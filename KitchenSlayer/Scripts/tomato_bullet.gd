extends CharacterBody2D

const SPEED = 150

var dir : int
var spawnPos : Vector2

func _physics_process(delta: float) -> void:
	position.x += SPEED * dir * delta


func _on_hitbox_body_entered(body: Node2D) -> void:
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_hitbox_area_entered(area: Area2D) -> void:
	queue_free()
