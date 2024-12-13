extends Node2D

var map_path
var map_ins = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if map_ins == false:
		map_ins = true
		if Global.level == 1:
			map_ins = true
			map_path = preload("res://Scene/Game/MapSeedLv1.tscn")
			var ins = map_path.instantiate()
			get_parent().add_child(ins)
		elif Global.level == 2:
			pass
