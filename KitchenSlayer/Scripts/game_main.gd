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
			map_path = preload("res://Scene/Game/MapSeedLv2.tscn")
			ins = map_path.instantiate()
			get_parent().add_child(ins)
		elif Global.level == 3:
			map_path = preload("res://Scene/Game/MapSeedLv3.tscn")
			ins = map_path.instantiate()
			get_parent().add_child(ins)
		elif Global.level == 4:
			map_path = preload("res://Scene/Game/MapSeedLv4.tscn")
			ins = map_path.instantiate()
			get_parent().add_child(ins)
		elif Global.level == 5:
			map_path = preload("res://Scene/Game/MapSeedLv5.tscn")
			ins = map_path.instantiate()
			get_parent().add_child(ins)
		elif Global.level == 6:
			map_path = preload("res://Scene/Game/MapSeedLv6.tscn")
			ins = map_path.instantiate()
			get_parent().add_child(ins)
		elif Global.level == 7:
			map_path = preload("res://Scene/Game/MapSeedLv7.tscn")
			ins = map_path.instantiate()
			get_parent().add_child(ins)
		elif Global.level == 8:
			map_path = preload("res://Scene/Game/MapSeedLv8.tscn")
			ins = map_path.instantiate()
			get_parent().add_child(ins)
		elif Global.level == 9:
			map_path = preload("res://Scene/Game/MapSeedLv9.tscn")
			ins = map_path.instantiate()
			get_parent().add_child(ins)
		elif Global.level == 10:
			map_path = preload("res://Scene/Game/MapSeedLv10.tscn")
			ins = map_path.instantiate()
			get_parent().add_child(ins)
	if Global.reset_level == true:
		if Global.level <= 10:
			Global.reset_level = false
			get_parent().remove_child(ins)
			get_tree().change_scene_to_file("res://Scene/Game/GameMain.tscn")
			Global.reset_game()
		else:
			Global.reset_level = false
			get_parent().remove_child(ins)
			for n in self.get_children():
				self.remove_child(n)
				n.queue_free()
			get_tree().change_scene_to_file("res://Scene/Game/CreditScene.tscn")
