extends Control

#Ho Hoang My

var UI_show_index

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	UI_show_index = 0
	menu_button_update()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/Game/GameMain.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_credit_button_pressed() -> void:
	$Panel/CreditPanel.visible = true


func _on_close_credit_panel_button_pressed() -> void:
	$Panel/CreditPanel.visible = false


func _on_setting_button_pressed() -> void:
	$Panel/SettingPanel.visible = true


func _on_close_setting_panel_button_pressed() -> void:
	$Panel/SettingPanel.visible = false


func _on_tutorial_button_pressed() -> void:
	$Panel/TutorialPanel.visible = true


func _on_close_tutorial_panel_button_pressed() -> void:
	$Panel/TutorialPanel.visible = false


func _on_left_texture_button_pressed() -> void:
	if UI_show_index > 0:
		UI_show_index -= 1
		menu_button_update()


func _on_right_texture_button_pressed() -> void:
	if UI_show_index <= 3:
		UI_show_index += 1
		menu_button_update()

func menu_button_update():
	if UI_show_index == 0:
		$Panel/PlayButton.visible = true
		$Panel/CreditButton.visible = false
		$Panel/SettingButton.visible = false
		$Panel/TutorialButton.visible = false
		$Panel/ExitButton.visible = false
	elif UI_show_index == 1:
		$Panel/PlayButton.visible = false
		$Panel/CreditButton.visible = true
		$Panel/SettingButton.visible = false
		$Panel/TutorialButton.visible = false
		$Panel/ExitButton.visible = false
	elif UI_show_index == 2:
		$Panel/PlayButton.visible = false
		$Panel/CreditButton.visible = false
		$Panel/SettingButton.visible = true
		$Panel/TutorialButton.visible = false
		$Panel/ExitButton.visible = false
	elif UI_show_index == 3:
		$Panel/PlayButton.visible = false
		$Panel/CreditButton.visible = false
		$Panel/SettingButton.visible = false
		$Panel/TutorialButton.visible = true
		$Panel/ExitButton.visible = false
	elif UI_show_index == 4:
		$Panel/PlayButton.visible = false
		$Panel/CreditButton.visible = false
		$Panel/SettingButton.visible = false
		$Panel/TutorialButton.visible = false
		$Panel/ExitButton.visible = true
