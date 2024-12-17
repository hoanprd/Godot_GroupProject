extends Control

#Nam Chang Hyeon

func _on_end_splash_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Scene/Game/Menu.tscn")
