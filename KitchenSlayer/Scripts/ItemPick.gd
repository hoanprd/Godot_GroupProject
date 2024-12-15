extends Area2D

@export var itemId : int

var _itemId
var valueIncrease
var targetPos
var label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_itemId = itemId
	targetPos = get_tree().current_scene.get_node("CanvasLayer/UI").global_position
	label = get_tree().current_scene.get_node("CanvasLayer/UI")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if _itemId == 0:
			var tween = get_tree().create_tween()
			tween.tween_property(self, "global_position", targetPos + Vector2(1200, 10), 0.5).set_ease(Tween.EASE_IN)
			tween.chain().tween_property(self, "visible", false, 0.0)
			tween.tween_property(label, "scale", Vector2(1.9,1.1), 0.05)
			tween.chain().tween_property(label, "scale", Vector2(1.0,1.0), 0.05)
			Global.points += 1
			tween.chain().tween_callback(queue_free)
		elif _itemId == 1:
			Global.health += 1
			if Global.health > 3:
				Global.health = 3
			Global.getHealth = true
			queue_free()
		elif _itemId == 2:
			Global.player_buff_speed = true
			queue_free()
		elif _itemId == 3:
			Global.player_bullet_speed_buff = true
			queue_free()
		elif _itemId == 4:
			Global.player_bullet_size_buff = true
			queue_free()
		elif _itemId == 5:
			Global.player_bullet_quanity_buff = true
			queue_free()
		elif _itemId == 6:
			Global.bean_sprout += 1
			queue_free()
		elif _itemId == 7:
			Global.egg += 1
			queue_free()
		elif _itemId == 8:
			Global.garlic += 1
			queue_free()
		elif _itemId == 9:
			Global.green_onion += 1
			queue_free()
		elif _itemId == 10:
			Global.rice += 1
			queue_free()
		elif _itemId == 11:
			Global.tofu += 1
			queue_free()
		elif _itemId == 12:
			Global.kimchi += 1
			queue_free()
		elif _itemId == 13:
			Global.pork += 1
			queue_free()
		elif _itemId == 14:
			Global.red_pepper_powder += 1
			queue_free()
		elif _itemId == 15:
			Global.beef += 1
			queue_free()
		elif _itemId == 16:
			Global.carrot += 1
			queue_free()
		elif _itemId == 17:
			Global.mushroom += 1
			queue_free()
		elif _itemId == 18:
			Global.gochujang += 1
			queue_free()
		elif _itemId == 19:
			Global.sesame_oil += 1
			queue_free()
		elif _itemId == 20:
			Global.doenjang += 1
			queue_free()
		elif _itemId == 21:
			Global.potato += 1
			queue_free()
		elif _itemId == 22:
			Global.onion += 1
			queue_free()
