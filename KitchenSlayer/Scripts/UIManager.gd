extends Control

@onready var healthBar = $HealthBar
@onready var pointsLabel = $PointsLabel

var heart_size : int = 14
var hurtPanel: Panel
var delay_hurt_get_shot : Timer
var gameOver: bool
var health_label: Label
var points_label: Label
var winLose_panel: Panel
var winLose_label: Label

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
		$BeanSproutRiceSoupPanel.visible = true
	elif Global.level == 2:
		$DubuKimchiPanel.visible = true
	elif Global.level == 3:
		$BibimbapPanel.visible = true
	elif Global.level == 4:
		$BibimbapPanel.visible = true
	elif Global.level == 5:
		$BibimbapPanel.visible = true
	elif Global.level == 6:
		$BibimbapPanel.visible = true
	elif Global.level == 7:
		$BibimbapPanel.visible = true
	elif Global.level == 8:
		$BibimbapPanel.visible = true
	elif Global.level == 9:
		$BibimbapPanel.visible = true
	elif Global.level == 10:
		$BibimbapPanel.visible = true


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
	
	if (Global.health <= 0 || Global.stopGame):
		if (!gameOver):
			gameOver = true
			winLose_panel.visible = true
			#exitGameTimer.start()
	
	updateUI()
	HealthUpdate()

func HealthUpdate():
	if Global.getHurt == true or Global.getHealth == true:
		#healthBar.value = Global.health
		if Global.health > 0:
			$Heart.size.x = Global.health * heart_size
		elif Global.health <= 0:
			$Heart.visible = false
		Global.getHealth = false

func updateUI():
	pointsLabel.text = str(Global.points)
	$BeanSproutRiceSoupPanel/BeanSprout/BeanSproutLabel.text = str(Global.bean_sprout)
	$BeanSproutRiceSoupPanel/Egg/EggLabel.text = str(Global.egg)
	$BeanSproutRiceSoupPanel/Garlic/GarlicLabel.text = str(Global.garlic)
	$BeanSproutRiceSoupPanel/GreenOnion/GreenOnionLabel.text = str(Global.green_onion)
	$BeanSproutRiceSoupPanel/Rice/RiceLabel.text = str(Global.rice)
	if Global.missing_material == true:
		$AnouLabel.text = "Material is missing!"
		$AnouLabel.visible = true
	else:
		$AnouLabel.text = "Material is missing!"
		$AnouLabel.visible = false


func _on_delay_hurt_get_shot_timeout() -> void:
	Global.getHurt = false


func _on_try_again_button_pressed() -> void:
	Global.reset_level = true


func _on_exit_button_pressed() -> void:
	get_tree().quit()
