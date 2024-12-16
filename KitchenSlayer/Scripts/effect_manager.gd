extends Node2D

#Im Eun Seong

@export var id : int

var _id

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_id = id
	
	if _id == 0:
		$ExcuteTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_excute_timer_timeout() -> void:
	queue_free()
