extends Control

#Ho Hoang My

@onready var healthBar = $HealthBar
@onready var pointsLabel = $PointsLabel

var heart_size : int = 14
var open_recipe_book = false

var hurtPanel: Panel
var delay_hurt_get_shot : Timer
var gameOver: bool
var health_label: Label
var points_label: Label
var winLose_panel: Panel
var winLose_label: Label
var dialog_index = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	healthBar.value = Global.health
	winLose_panel = get_node("WinLosePanel")
	winLose_label = get_node("WinLosePanel/WinLoseLabel")
	winLose_panel.visible = false
	hurtPanel = get_node("HurtPanel")
	delay_hurt_get_shot = get_node("DelayHurtGetShot")
	gameOver = false
	$Heart.size.x = Global.health * heart_size
	if Global.level == 1:
		$RecipeBookPanel/BeanSproutRiceSoupPanel.visible = true
	elif Global.level == 2:
		$RecipeBookPanel/DubuKimchiPanel.visible = true
	elif Global.level == 3:
		$RecipeBookPanel/BibimbapPanel.visible = true
	elif Global.level == 4:
		$RecipeBookPanel/DoenjangJjigaePanel.visible = true
	elif Global.level == 5:
		$RecipeBookPanel/KimchiJjigaePanel.visible = true
	elif Global.level == 6:
		$RecipeBookPanel/DoenjangJjigaePanel.visible = true
		$RecipeBookPanel/BibimbapPanel.visible = true
	elif Global.level == 7:
		$RecipeBookPanel/BulgogiPanel.visible = true
	elif Global.level == 8:
		$RecipeBookPanel/JeyukBokkeumPanel.visible = true
	elif Global.level == 9:
		$RecipeBookPanel/BulgogiPanel.visible = true
		$RecipeBookPanel/KimchiJjigaePanel.visible = true
		$RecipeBookPanel/BibimbapPanel.visible = true
	elif Global.level == 10:
		$RecipeBookPanel/BeanSproutRiceSoupPanel.visible = true
		$RecipeBookPanel/DubuKimchiPanel.visible = true
		$RecipeBookPanel/BibimbapPanel.visible = true
		$RecipeBookPanel/DoenjangJjigaePanel.visible = true
		$RecipeBookPanel/KimchiJjigaePanel.visible = true
		$RecipeBookPanel/BulgogiPanel.visible = true
		$RecipeBookPanel/JeyukBokkeumPanel.visible = true
	Global.dialog_trigger = true
	if Global.dialog_trigger == true:
		Global.stopGame = true
		$DialogPanel.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.getHurt:
		if Global.get_shot:
			Global.get_shot = false
			delay_hurt_get_shot.start()
		hurtPanel.visible = true
	else:
		hurtPanel.visible = false
	if Global.win == true:
		winLose_label.text = "YOU WIN"
		$WinLosePanel/KillLabel.text = "Total kill: " + str(Global.total_level_kill)
		$WinLosePanel/CoinLabel.text = "Total coin: " + str(Global.points)
	elif Global.loseArea == true or Global.loseKill == true:
		winLose_label.text = "YOU LOSE"
	
	if (Global.health <= 0 || Global.stopGame and Global.dialog_trigger == false):
		if (!gameOver):
			gameOver = true
			winLose_panel.visible = true
			#exitGameTimer.start()
	
	updateUI()
	HealthUpdate()
	update_dialog()

func HealthUpdate():
	if Global.getHurt == true or Global.getHealth == true:
		#healthBar.value = Global.health
		if Global.health > 0:
			$Heart.size.x = Global.health * heart_size
		elif Global.health <= 0:
			$Heart.visible = false
		Global.getHealth = false

func updateUI():
	if Global.stopGame == false:
		$LevelLabel.text = "Level: " + str(Global.level)
	pointsLabel.text = str(Global.points)
	$RecipeBookPanel/BeanSproutRiceSoupPanel/BeanSprout/BeanSproutLabel.text = str(Global.bean_sprout)
	$RecipeBookPanel/BeanSproutRiceSoupPanel/Egg/EggLabel.text = str(Global.egg)
	$RecipeBookPanel/BeanSproutRiceSoupPanel/Garlic/GarlicLabel.text = str(Global.garlic)
	$RecipeBookPanel/BeanSproutRiceSoupPanel/GreenOnion/GreenOnionLabel.text = str(Global.green_onion)
	$RecipeBookPanel/BeanSproutRiceSoupPanel/Rice/RiceLabel.text = str(Global.rice)
	
	$RecipeBookPanel/DubuKimchiPanel/Tofu/TofuLabel.text = str(Global.tofu)
	$RecipeBookPanel/DubuKimchiPanel/Kimchi/KimchiLabel.text = str(Global.kimchi)
	$RecipeBookPanel/DubuKimchiPanel/Pork/PorkLabel.text = str(Global.pork)
	$RecipeBookPanel/DubuKimchiPanel/GreenOnion/GreenOnionLabel.text = str(Global.green_onion)
	$RecipeBookPanel/DubuKimchiPanel/RedPepperPowder/RedPepperPowderLabel.text = str(Global.red_pepper_powder)
	
	$RecipeBookPanel/BibimbapPanel/Rice/RiceLabel.text = str(Global.rice)
	$RecipeBookPanel/BibimbapPanel/Beef/BeefLabel.text = str(Global.beef)
	$RecipeBookPanel/BibimbapPanel/Carrot/CarrotLabel.text = str(Global.carrot)
	$RecipeBookPanel/BibimbapPanel/Mushroom/MushroomLabel.text = str(Global.mushroom)
	$RecipeBookPanel/BibimbapPanel/Egg/EggLabel.text = str(Global.egg)
	$RecipeBookPanel/BibimbapPanel/Gochujang/GochujangLabel.text = str(Global.gochujang)
	$RecipeBookPanel/BibimbapPanel/SesameOil/SesameOilLabel.text = str(Global.sesame_oil)
	
	$RecipeBookPanel/DoenjangJjigaePanel/Doenjang/DoenjangLabel.text = str(Global.doenjang)
	$RecipeBookPanel/DoenjangJjigaePanel/Tofu/TofuLabel.text = str(Global.tofu)
	$RecipeBookPanel/DoenjangJjigaePanel/Potato/PotatoLabel.text = str(Global.potato)
	$RecipeBookPanel/DoenjangJjigaePanel/Onion/OnionLabel.text = str(Global.onion)
	$RecipeBookPanel/DoenjangJjigaePanel/GreenOnion/GreenOnionLabel.text = str(Global.green_onion)
	$RecipeBookPanel/DoenjangJjigaePanel/Mushroom/MushroomLabel.text = str(Global.mushroom)
	
	$RecipeBookPanel/KimchiJjigaePanel/Kimchi/KimchiLabel.text = str(Global.kimchi)
	$RecipeBookPanel/KimchiJjigaePanel/Pork/PorkLabel.text = str(Global.pork)
	$RecipeBookPanel/KimchiJjigaePanel/Tofu/TofuLabel.text = str(Global.tofu)
	$RecipeBookPanel/KimchiJjigaePanel/GreenOnion/GreenOnionLabel.text = str(Global.green_onion)
	$RecipeBookPanel/KimchiJjigaePanel/RedPepperPowder/RedPepperPowderLabel.text = str(Global.red_pepper_powder)
	
	$RecipeBookPanel/BulgogiPanel/Beef/BeefLabel.text = str(Global.beef)
	$RecipeBookPanel/BulgogiPanel/Onion/OnionLabel.text = str(Global.onion)
	$RecipeBookPanel/BulgogiPanel/GreenOnion/GreenOnionLabel.text = str(Global.green_onion)
	$RecipeBookPanel/BulgogiPanel/SoySauce/SoySauceLabel.text = str(Global.soy_sauce)
	$RecipeBookPanel/BulgogiPanel/SesameOil/SesameOilLabel.text = str(Global.sesame_oil)
	$RecipeBookPanel/BulgogiPanel/Garlic/GarlicLabel.text = str(Global.garlic)
	
	$RecipeBookPanel/JeyukBokkeumPanel/Pork/PorkLabel.text = str(Global.pork)
	$RecipeBookPanel/JeyukBokkeumPanel/Onion/OnionLabel.text = str(Global.onion)
	$RecipeBookPanel/JeyukBokkeumPanel/GreenOnion/GreenOnionLabel.text = str(Global.green_onion)
	$RecipeBookPanel/JeyukBokkeumPanel/Gochujang/GochujangLabel.text = str(Global.gochujang)
	$RecipeBookPanel/JeyukBokkeumPanel/RedPepperPowder/RedPepperPowderLabel.text = str(Global.red_pepper_powder)
	$RecipeBookPanel/JeyukBokkeumPanel/Garlic/GarlicLabel.text = str(Global.garlic)
	if Global.missing_material == true:
		$AnouLabel.text = "Material is missing!"
		$AnouLabel.visible = true
	else:
		$AnouLabel.text = "Material is missing!"
		$AnouLabel.visible = false
	if Input.is_action_just_pressed("open_recipe_book"):
		if open_recipe_book == false:
			open_recipe_book = true
			$RecipeBookPanel.visible = true
		else:
			open_recipe_book = false
			$RecipeBookPanel.visible = false

func update_dialog():
	if Global.level == 1 and Global.dialog_trigger == true:
		$DialogPanel/BGSprite2D.visible = true
		if dialog_index == 0:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Demon king"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/Demon King.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "You finally woke up."
		elif dialog_index == 1:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Player"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/PlayerIcon.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "Where am I?"
		if dialog_index == 2:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Demon king"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/Demon King.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "This is a place where great chefs are brought to."
		if dialog_index == 3:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Demon king"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/Demon King.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "If you want to survive, cook something delicious with the ingredients you get here."
		elif dialog_index == 4:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Player"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/PlayerIcon.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "Well that's fine."
		if Input.is_action_just_pressed("shoot"):
			dialog_index += 1
			if dialog_index >= 5:
				Global.dialog_trigger = false
				Global.stopGame = false
				$DialogPanel.visible = false
	elif Global.level == 2 and Global.dialog_trigger == true:
		$DialogPanel/BGSprite2D.visible = true
		if dialog_index == 0:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Demon king"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/Demon King.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "Bean Sprout Rice Soup is good too, you have passed a level."
		elif dialog_index == 1:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Player"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/PlayerIcon.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "Can I go home yet?"
		if dialog_index == 2:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Demon king"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/Demon King.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "Not yet because I'm still hungry."
		if dialog_index == 3:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Player"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/PlayerIcon.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "Then I will cook the next dish."
		if Input.is_action_just_pressed("shoot"):
			dialog_index += 1
			if dialog_index >= 4:
				Global.dialog_trigger = false
				Global.stopGame = false
				$DialogPanel.visible = false
	elif Global.level == 3 and Global.dialog_trigger == true:
		$DialogPanel/BGSprite2D2.visible = true
		if dialog_index == 0:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Demon king"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/Demon King.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "The last dish was also very interesting."
		elif dialog_index == 1:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Player"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/PlayerIcon.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "My Dubu Kimchi is the best."
		if dialog_index == 2:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Demon king"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/Demon King.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "Oh? So what else do you have?"
		if dialog_index == 3:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Player"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/PlayerIcon.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "Take a guess."
		if Input.is_action_just_pressed("shoot"):
			dialog_index += 1
			if dialog_index >= 4:
				Global.dialog_trigger = false
				Global.stopGame = false
				$DialogPanel.visible = false
	elif Global.level == 4 and Global.dialog_trigger == true:
		$DialogPanel/BGSprite2D3.visible = true
		if dialog_index == 0:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Player"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/PlayerIcon.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "How does my Bibimbap taste?"
		elif dialog_index == 1:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Demon king"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/Demon King.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "Also very interesting and delicious."
		if dialog_index == 2:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Demon king"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/Demon King.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "But this is still not enough for me."
		if dialog_index == 3:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Player"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/PlayerIcon.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "So I have to add more flavor."
		if Input.is_action_just_pressed("shoot"):
			dialog_index += 1
			if dialog_index >= 4:
				Global.dialog_trigger = false
				Global.stopGame = false
				$DialogPanel.visible = false
	elif Global.level == 5 and Global.dialog_trigger == true:
		$DialogPanel/BGSprite2D3.visible = true
		if dialog_index == 0:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Player"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/PlayerIcon.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "So what now?"
		elif dialog_index == 1:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Demon king"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/Demon King.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "Close to perfection."
		if dialog_index == 2:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Player"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/PlayerIcon.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "If you are not satisfied, the next dish will change you."
		if Input.is_action_just_pressed("shoot"):
			dialog_index += 1
			if dialog_index >= 3:
				Global.dialog_trigger = false
				Global.stopGame = false
				$DialogPanel.visible = false
	elif Global.level == 6 and Global.dialog_trigger == true:
		$DialogPanel/BGSprite2D3.visible = true
		if dialog_index == 0:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Player"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/PlayerIcon.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "Kimchi Jjigae definitely scored a perfect score."
		elif dialog_index == 1:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Demon king"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/Demon King.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "It seems so but we need more than one."
		if dialog_index == 2:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Player"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/PlayerIcon.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "Okay buy 1 get 1 free this time."
		if Input.is_action_just_pressed("shoot"):
			dialog_index += 1
			if dialog_index >= 3:
				Global.dialog_trigger = false
				Global.stopGame = false
				$DialogPanel.visible = false
	elif Global.level == 7 and Global.dialog_trigger == true:
		$DialogPanel/BGSprite2D4.visible = true
		if dialog_index == 0:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Demon king"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/Demon King.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "Great combination but quite boring."
		elif dialog_index == 1:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Player"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/PlayerIcon.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "Boring? I still have that trick up my sleeve."
		if dialog_index == 2:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Demon king"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/Demon King.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "I'm looking forward to it."
		if Input.is_action_just_pressed("shoot"):
			dialog_index += 1
			if dialog_index >= 3:
				Global.dialog_trigger = false
				Global.stopGame = false
				$DialogPanel.visible = false
	elif Global.level == 8 and Global.dialog_trigger == true:
		$DialogPanel/BGSprite2D4.visible = true
		if dialog_index == 0:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Demon king"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/Demon King.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "The new dish is delicious but I need more."
		elif dialog_index == 1:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Player"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/PlayerIcon.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "Okay let's see how my last dish turns out?"
		if dialog_index == 2:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Demon king"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/Demon King.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "Yes! I need more."
		if Input.is_action_just_pressed("shoot"):
			dialog_index += 1
			if dialog_index >= 3:
				Global.dialog_trigger = false
				Global.stopGame = false
				$DialogPanel.visible = false
	elif Global.level == 9 and Global.dialog_trigger == true:
		$DialogPanel/BGSprite2D4.visible = true
		if dialog_index == 0:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Demon king"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/Demon King.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "You have come a long way."
		elif dialog_index == 1:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Player"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/PlayerIcon.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "I hope to receive many rewards."
		elif dialog_index == 2:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Demon king"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/Demon King.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "Yes if you fill my stomach."
		if Input.is_action_just_pressed("shoot"):
			dialog_index += 1
			if dialog_index >= 3:
				Global.dialog_trigger = false
				Global.stopGame = false
				$DialogPanel.visible = false
	elif Global.level == 10 and Global.dialog_trigger == true:
		$DialogPanel/BGSprite2D3.visible = true
		if dialog_index == 0:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Demon king"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/Demon King.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "The final challenge has come!"
		elif dialog_index == 1:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Demon king"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/Demon King.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "You need to present the whole dish as best you can."
		elif dialog_index == 2:
			$DialogPanel/DialogSprite2D/NameLabel.text = "Player"
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/PlayerIcon.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "This will be the challenge that I will win."
		if Input.is_action_just_pressed("shoot"):
			dialog_index += 1
			if dialog_index >= 3:
				Global.dialog_trigger = false
				Global.stopGame = false
				$DialogPanel.visible = false

func _on_delay_hurt_get_shot_timeout() -> void:
	Global.getHurt = false


func _on_try_again_button_pressed() -> void:
	Global.reset_level = true


func _on_exit_button_pressed() -> void:
	get_tree().quit()
