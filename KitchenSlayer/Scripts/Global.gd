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
var level = 1
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
