extends Node2D

var map_path
var map_ins = false
var ins

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if map_ins == false and Global.stopGame == false:
		map_ins = true
		if Global.level == 1:
			map_path = preload("res://Scene/Game/MapSeedLv1.tscn")
			ins = map_path.instantiate()
			get_parent().add_child(ins)
		elif Global.level == 2:
			pass
	if Global.reset_level == true:
		Global.reset_level = false
		get_parent().remove_child(ins)
		get_tree().change_scene_to_file("res://Scene/Game/GameMain.tscn")
		Global.reset_game()
