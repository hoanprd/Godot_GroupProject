extends Control

#Nam Chang Hyeon

var dialog_index = 0

func _process(delta: float) -> void:
	update_dialog()

func _on_exit_timer_timeout() -> void:
	get_tree().quit()

func update_dialog():
	if dialog_index == 0:
		$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/Demon King.png")
		$DialogPanel/DialogSprite2D/DialogLabel.text = "You are the first person to pass my demon king's cooking test."
	elif dialog_index == 1:
		$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/PlayerIcon.png")
		$DialogPanel/DialogSprite2D/DialogLabel.text = "I am glad to have pleased you."
	if dialog_index == 2:
		$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/Demon King.png")
		$DialogPanel/DialogSprite2D/DialogLabel.text = "That's why I title you Kitchen Slayer."
	if dialog_index == 3:
		$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/Demon King.png")
		$DialogPanel/DialogSprite2D/DialogLabel.text = "I will send you back with the rewards of this world's cooking ingredients."
	elif dialog_index == 4:
		$DialogPanel/DialogSprite2D/AvatarSprite2D/AvatarIconSprite2D.texture = preload("res://Texture/PlayerIcon.png")
		$DialogPanel/DialogSprite2D/DialogLabel.text = "If so, I would be the best chef in the world."
	if Input.is_action_just_pressed("shoot"):
		dialog_index += 1
		if dialog_index >= 5:
			$DialogPanel.visible = false
			$Panel.visible = true
			$ExitTimer.start()
