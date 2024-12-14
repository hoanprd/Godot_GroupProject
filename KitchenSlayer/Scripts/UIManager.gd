extends Control

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
		$RecipeBookPanel/BibimbapPanel.visible = true
	elif Global.level == 5:
		$RecipeBookPanel/BibimbapPanel.visible = true
	elif Global.level == 6:
		$RecipeBookPanel/BibimbapPanel.visible = true
	elif Global.level == 7:
		$RecipeBookPanel/BibimbapPanel.visible = true
	elif Global.level == 8:
		$RecipeBookPanel/BibimbapPanel.visible = true
	elif Global.level == 9:
		$RecipeBookPanel/BibimbapPanel.visible = true
	elif Global.level == 10:
		$RecipeBookPanel/BibimbapPanel.visible = true
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
		if dialog_index == 0:
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/Demon King.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "haha"
		elif dialog_index == 1:
			$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/PlayerIcon.png")
			$DialogPanel/DialogSprite2D/DialogLabel.text = "hoho"
		if Input.is_action_just_pressed("shoot"):
			dialog_index += 1
			if dialog_index >= 2:
				Global.dialog_trigger = false
				Global.stopGame = false
				$DialogPanel.visible = false

func _on_delay_hurt_get_shot_timeout() -> void:
	Global.getHurt = false


func _on_try_again_button_pressed() -> void:
	if Global.level < 10:
		Global.reset_level = true
	else:
		get_tree().change_scene_to_file("res://Scene/Game/CreditScene.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit()
