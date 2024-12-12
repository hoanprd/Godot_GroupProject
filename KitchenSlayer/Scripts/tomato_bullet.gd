extends CharacterBody2D

const SPEED = 150

var dir : int
var spawnPos : Vector2

func _physics_process(delta: float) -> void:
	if Global.player_bullet_speed_buff == true:
		Global.player_bullet_speed_buff_value = 100
	if Global.player_bullet_size_buff == true:
		pass
	if Global.player_bullet_quanity == true:
		pass
	position.x += (SPEED + Global.player_bullet_speed_buff_value) * dir * delta


func _on_hitbox_body_entered(body: Node2D) -> void:
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_hitbox_area_entered(area: Area2D) -> void:
	queue_free()
