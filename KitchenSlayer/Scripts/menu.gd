extends Control

#Ho Hoang My

var UI_show_index

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	UI_show_index = 0


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
		UI_show_index--
