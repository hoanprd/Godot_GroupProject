extends Area2D

@export var id : int

var _id

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_id = id


func _on_body_entered(body: Node2D) -> void:
	if (body.name == "Player"):
		if _id == 0:
			if Global.level == 1:
				if Global.bean_sprout >= 1 and Global.egg >= 1 and Global.garlic >= 1 and Global.green_onion >= 1 and Global.rice >= 1:
					Global.bean_sprout -= 1
					Global.egg -= 1
					Global.garlic -= 1
					Global.green_onion -= 1
					Global.rice -= 1
					Global.win = true
					Global.stopGame = true
					if Global.level >= 10:
						pass
					else:
						Global.level += 1
				else:
					Global.missing_material = true
			elif Global.level == 2:
				if Global.tofu >= 1 and Global.kimchi >= 1 and Global.pork >= 1 and Global.green_onion >= 1 and Global.red_pepper_powder >= 1:
					Global.tofu -= 1
					Global.kimchi -= 1
					Global.pork -= 1
					Global.green_onion -= 1
					Global.red_pepper_powder -= 1
					Global.win = true
					Global.stopGame = true
					if Global.level >= 10:
						pass
					else:
						Global.level += 1
				else:
					Global.missing_material = true
			elif Global.level == 3:
				if Global.tofu >= 1 and Global.kimchi >= 1 and Global.pork >= 1 and Global.green_onion >= 1 and Global.red_pepper_powder >= 1:
					Global.tofu -= 1
					Global.kimchi -= 1
					Global.pork -= 1
					Global.green_onion -= 1
					Global.red_pepper_powder -= 1
					Global.win = true
					Global.stopGame = true
					if Global.level >= 10:
						pass
					else:
						Global.level += 1
			elif Global.level == 4:
				if Global.tofu >= 1 and Global.kimchi >= 1 and Global.pork >= 1 and Global.green_onion >= 1 and Global.red_pepper_powder >= 1:
					Global.tofu -= 1
					Global.kimchi -= 1
					Global.pork -= 1
					Global.green_onion -= 1
					Global.red_pepper_powder -= 1
					Global.win = true
					Global.stopGame = true
					if Global.level >= 10:
						pass
					else:
						Global.level += 1
			elif Global.level == 5:
				if Global.tofu >= 1 and Global.kimchi >= 1 and Global.pork >= 1 and Global.green_onion >= 1 and Global.red_pepper_powder >= 1:
					Global.tofu -= 1
					Global.kimchi -= 1
					Global.pork -= 1
					Global.green_onion -= 1
					Global.red_pepper_powder -= 1
					Global.win = true
					Global.stopGame = true
					if Global.level >= 10:
						pass
					else:
						Global.level += 1
			else:
				Global.missing_material = true
		elif _id == 1:
			Global.loseArea = true
			Global.stopGame = true


func _on_body_exited(body: Node2D) -> void:
	Global.missing_material = false
