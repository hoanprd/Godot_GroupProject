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
					Global.level += 1
				else:
					Global.missing_material = true
			elif Global.level == 3:
				if Global.rice >= 1 and Global.beef >= 1 and Global.carrot >= 1 and Global.mushroom >= 1 and Global.egg >= 1 and Global.gochujang >= 1 and Global.sesame_oil >= 1:
					Global.rice -= 1
					Global.beef -= 1
					Global.carrot -= 1
					Global.mushroom -= 1
					Global.egg -= 1
					Global.gochujang -= 1
					Global.sesame_oil -= 1
					Global.win = true
					Global.stopGame = true
					Global.level += 1
				else:
					Global.missing_material = true
			elif Global.level == 4:
				if Global.doenjang >= 1 and Global.tofu >= 1 and Global.potato >= 1 and Global.onion >= 1 and Global.green_onion >= 1 and Global.mushroom >= 1:
					print("hi")
					Global.doenjang -= 1
					Global.tofu -= 1
					Global.potato -= 1
					Global.onion -= 1
					Global.green_onion -= 1
					Global.mushroom -= 1
					Global.win = true
					Global.stopGame = true
					Global.level += 1
				else:
					Global.missing_material = true
			elif Global.level == 5:
				if Global.kimchi >= 1 and Global.pork >= 1 and Global.tofu >= 1 and Global.green_onion >= 1 and Global.red_pepper_powder >= 1:
					Global.kimchi -= 1
					Global.pork -= 1
					Global.tofu -= 1
					Global.green_onion -= 1
					Global.red_pepper_powder -= 1
					Global.win = true
					Global.stopGame = true
					Global.level += 1
				else:
					Global.missing_material = true
			elif Global.level == 6:
				if Global.doenjang >= 1 and Global.tofu >= 1 and Global.potato >= 1 and Global.onion >= 1 and Global.green_onion >= 1 and Global.mushroom >= 2 and Global.rice >= 1 and Global.beef >= 1 and Global.carrot >= 1 and Global.egg >= 1 and Global.gochujang >= 1 and Global.sesame_oil >= 1:
					Global.doenjang -= 1
					Global.tofu -= 1
					Global.potato -= 1
					Global.onion -= 1
					Global.green_onion -= 1
					Global.mushroom -= 1
					Global.rice -= 1
					Global.beef -= 1
					Global.carrot -= 1
					Global.egg -= 1
					Global.gochujang -= 1
					Global.sesame_oil -= 1
					Global.win = true
					Global.stopGame = true
					Global.level += 1
				else:
					Global.missing_material = true
			elif Global.level == 7:
				if Global.beef >= 1 and Global.onion >= 1 and Global.green_onion >= 1 and Global.soy_sauce >= 1 and Global.sesame_oil >= 1 and Global.garlic >= 1:
					Global.beef -= 1
					Global.onion -= 1
					Global.tofu -= 1
					Global.green_onion -= 1
					Global.soy_sauce -= 1
					Global.sesame_oil -= 1
					Global.garlic -= 1
					Global.win = true
					Global.stopGame = true
					Global.level += 1
				else:
					Global.missing_material = true
			elif Global.level == 8:
				if Global.pork >= 1 and Global.onion >= 1 and Global.green_onion >= 1 and Global.gochujang >= 1 and Global.red_pepper_powder >= 1 and Global.garlic >= 1:
					Global.pork -= 1
					Global.onion -= 1
					Global.green_onion -= 1
					Global.gochujang -= 1
					Global.red_pepper_powder -= 1
					Global.garlic -= 1
					Global.win = true
					Global.stopGame = true
					Global.level += 1
				else:
					Global.missing_material = true
			elif Global.level == 9:
				if Global.beef >= 2:
					Global.beef -= 2
					Global.onion -= 1
					Global.soy_sauce -= 1
					Global.green_onion -= 2
					Global.soy_sauce -= 1
					Global.sesame_oil -= 2
					Global.garlic -= 1
					Global.kimchi -= 1
					Global.pork -= 1
					Global.tofu -= 1
					Global.red_pepper_powder -= 1
					Global.rice -= 1
					Global.carrot -= 1
					Global.mushroom -= 1
					Global.egg -= 1
					Global.gochujang -= 1
					Global.win = true
					Global.stopGame = true
					Global.level += 1
				else:
					Global.missing_material = true
			elif Global.level == 10:
				#if Global.kimchi >= 2 and Global.pork >= 3 and Global.tofu >= 3 and Global.green_onion >= 6 and Global.red_pepper_powder >= 3 and Global.rice >= 2 and Global.beef >= 2 and Global.carrot >= 1 and Global.mushroom >= 2 and Global.egg >= 2 and Global.gochujang >= 2 and Global.sesame_oil >= 2 and Global.doenjang >= 1 and Global.potato >= 1 and Global.onion >= 3 and Global.soy_sauce >= 1 and Global.garlic >= 3 and Global.rice >= 1 and Global.bean_sprout >= 1:
					#Global.win = true
					#Global.stopGame = true
					#Global.level += 1
				#else:
					#Global.missing_material = true
				Global.win = true
				Global.stopGame = true
				Global.level += 1
		elif _id == 1:
			Global.loseArea = true
			Global.stopGame = true


func _on_body_exited(body: Node2D) -> void:
	Global.missing_material = false
