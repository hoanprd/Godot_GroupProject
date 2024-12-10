extends CharacterBody2D

const SPEED = 150

var body_target : Vector2
var spawnPos : Vector2

func _physics_process(delta: float) -> void:
	target_position_chase(body_target)

func target_position_chase(body: Vector2):
	velocity = position.direction_to(Vector2(body.x, body.y)) * SPEED
	if self.position.x == body.x or self.position.x == body.x + 1:
		pass
	move_and_slide()

func _on_hitbox_body_entered(body: Node2D) -> void:
	pass


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_hitbox_area_entered(area: Area2D) -> void:
	queue_free()
