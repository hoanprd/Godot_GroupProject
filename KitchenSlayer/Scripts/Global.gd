extends Node

var health = 3
var points = 0
var stopGame = false
var getHurt = false
var getHealth
var loseKill = false
var loseArea = false
var win = false
var get_shot = false
var player_bullet_speed_buff = false
var player_bullet_speed_buff_value = 0
var player_bullet_size_buff = false
var player_bullet_size_buff_value = 0
var player_bullet_quanity_buff = false
var player_bullet_quanity_buff_value = 0
var player_tomato_damage = 1
var player_buff_speed = false
var player_buff_speed_value = 0
var level = 9
var reset_level = false
var missing_material = false

#Material
var bean_sprout_rice_soup = 0
var bean_sprout = 0
var egg = 0
var garlic = 0
var green_onion = 0
var rice = 0
var tofu = 0
var kimchi = 0
var pork = 0
var red_pepper_powder = 0
var beef = 0
var carrot = 0
var mushroom = 0
var gochujang = 0
var sesame_oil = 0
var doenjang = 0
var potato = 0
var onion = 0
var soy_sauce = 0
var dialog_trigger = false
var end_game = false

func reset_game():
	health = 3
	points = 0
	stopGame = false
	getHurt = false
	getHealth
	loseKill = false
	loseArea = false
	win = false
	get_shot = false
	player_bullet_speed_buff = false
	player_bullet_speed_buff_value = 0
	player_bullet_size_buff = false
	player_bullet_size_buff_value = 0
	player_bullet_quanity_buff = false
	player_bullet_quanity_buff_value = 0
	player_tomato_damage = 1
	player_buff_speed = false
	missing_material = false
	player_buff_speed_value = 0
	bean_sprout_rice_soup = 0
	bean_sprout = 0
	egg = 0
	garlic = 0
	green_onion = 0
	rice = 0
	tofu = 0
	kimchi = 0
	pork = 0
	red_pepper_powder = 0
	beef = 0
	carrot = 0
	mushroom = 0
	gochujang = 0
	sesame_oil = 0
	doenjang = 0
	potato = 0
	onion = 0
	soy_sauce = 0
