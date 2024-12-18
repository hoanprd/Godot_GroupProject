extends CharacterBody2D

#Nam Chang Hyeon

@export var id : int
@export var hp : int
@export var damageDeal : int
@export var enemySpeed : float
@export var rangeLeft : float
@export var rangeRight : float
@export var range_top : float
@export var range_down : float
@export var chase_limit : float

@onready var enemy_ap : AnimationPlayer
#@onready var hp_ui = $HPBar
var can_shoot = false
var enemy_bullet = preload("res://Scene/Object/EnemyBullet.tscn")
var die_effect = preload("res://Scene/Object/Effect/DieEffect.tscn")

var timer : Timer
var hurtTimer : Timer
var delay_attack_timer : Timer
var teleport_cast_timer : Timer
var teleport_cooldown_timer : Timer
var sprite : Sprite2D
var hp_ui : ProgressBar

var _id
var _hp
var _speed
var move_direction : Vector2
var left_limit
var right_limit
var _range_top
var _range_down
var _chase_limit
var _damageDeal
var start_position: Vector2
var player
var go_back = false
var move_rng = RandomNumberGenerator.new()
var move_number : int
var random_move_is_on = false
var skill_cooldown = false
var teleport = false
var target_player : Vector2

func _ready():
	enemy_ap = get_node("AnimationPlayer")
	hurtTimer = get_node("HurtTimer")
	timer = get_node("Timer")
	delay_attack_timer = get_node("DelayAttackTimer")
	teleport_cast_timer = get_node("TeleportCastTimer")
	teleport_cooldown_timer = get_node("TeleportCoolDownTimer")
	sprite = get_node("Sprite2D")
	hp_ui = get_node("HPBar")
	
	# Store the initial position of the goblin
	start_position = position
	
	_id = id
	_hp = hp
	_damageDeal = damageDeal
	_speed = enemySpeed
	left_limit = rangeLeft
	right_limit = rangeRight
	_range_top = range_top
	_range_down = range_down
	_chase_limit = chase_limit
	if _id == 0:
		move_direction = Vector2(1, 0)
	elif _id == 1:
		move_direction = Vector2(0, 1)
	elif _id == 2:
		move_direction = Vector2(0, 1)
	elif _id == 3:
		move_direction = Vector2(1, 0)
	elif _id == 4:
		move_direction = Vector2(0, 0)

func _process(delta):
	velocity = Vector2.ZERO
	if player:
		if (self.position.x <= start_position.x + chase_limit and self.position.x >= start_position.x - chase_limit) and go_back == false:
			#velocity.x = position.direction_to(player.position).x * _speed
			action_logic(_id)
		else:
			go_back = true
			if roundf(self.position.x) != start_position.x and go_back == true:
				velocity = position.direction_to(Vector2(start_position.x, start_position.y)) * _speed
				if start_position.x == roundf(self.position.x) or start_position.x == roundf(self.position.x) + 1 or start_position.x == roundf(self.position.x) - 1:
					go_back = false
					position = start_position
			else:
				move_enemy(delta)
		move_and_slide()
	else:
		if roundf(self.position.x) != start_position.x and go_back == true:
			velocity = position.direction_to(Vector2(start_position.x, start_position.y)) * _speed
			move_and_slide()
			if start_position.x == roundf(self.position.x):
				go_back = false
		else:
			move_enemy(delta)

func action_logic(index):
	if index == 0:
		velocity.x = position.direction_to(player.position).x * _speed
	elif index == 1:
		velocity = position.direction_to(player.position) * _speed
	elif index == 2:
		velocity = position.direction_to(player.position) * _speed
		if can_shoot == true:
			can_shoot = false
			var ins = enemy_bullet.instantiate()
			get_parent().add_child(ins)
			var player_aim_position = Vector2(player.position.x, player.position.y)
			ins.body_target = player_aim_position
			ins.global_position = $BulletRoot.global_position
			delay_attack_timer.start()
	elif index == 3:
		velocity.x = position.direction_to(player.position).x * _speed
	elif index == 4:
		if skill_cooldown == true:
			enemy_ap.play("EnemyE_idle")
			velocity.x = position.direction_to(player.position).x * _speed
			#if start_position.x == roundf(self.position.x) or start_position.x == roundf(self.position.x) + 1 or start_position.x == roundf(self.position.x) - 1:
				#skill_cooldown = false
		elif skill_cooldown == false and teleport == false:
			teleport = true
			enemy_ap.play("EnemyE_attack")
			teleport_cast_timer.start()
			teleport_cooldown_timer.start()

func move_enemy(delta):
	if _id == 0:
		position += move_direction * _speed * delta
		
		if position.x <= start_position.x + left_limit:
			move_direction.x = 1
			#flip_sprite()
		elif position.x >= start_position.x + right_limit:
			move_direction.x = -1
			#flip_sprite()
	elif _id == 1:
		position += move_direction * _speed * delta
		
		if position.y <= start_position.y + _range_top:
			move_direction.y = 1
			flip_sprite()
		elif position.y >= start_position.y + _range_down:
			move_direction.y = -1
			flip_sprite()
	elif _id == 2:
		position += move_direction * _speed * delta
		
		if position.y <= start_position.y + _range_top:
			move_direction.y = 1
			#flip_sprite()
		elif position.y >= start_position.y + _range_down:
			move_direction.y = -1
			#flip_sprite()
	elif _id == 3:
		position += move_direction * _speed * delta
		
		if position.x <= start_position.x + left_limit:
			move_direction.x = 1
			#flip_sprite()
		elif position.x >= start_position.x + right_limit:
			move_direction.x = -1
			#flip_sprite()
	elif _id == 4:
		pass

func flip_sprite():
	if _id == 0:
		if move_direction.x == 1:
			sprite.scale.x = -abs(sprite.scale.x)
		else:
			sprite.scale.x = abs(sprite.scale.x)
	elif _id == 1:
		if move_direction.y == 1:
			sprite.scale.x = -abs(sprite.scale.x)
		else:
			sprite.scale.x = abs(sprite.scale.x)
	elif _id == 4:
		if move_direction.x == 1:
			sprite.scale.x = -abs(sprite.scale.x)
		else:
			sprite.scale.x = abs(sprite.scale.x)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" and Global.health <= 100 and Global.health > 0:
		Global.health -= _damageDeal
		Global.getHurt = true
		hurtTimer.start()
		timer.start()

func _on_timer_timeout() -> void:
	if Global.health <= 100 and Global.health > 0:
		Global.health -= _damageDeal
		Global.getHurt = true
		hurtTimer.start()
	else:
		timer.stop()

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player" and Global.health <= 100:
		Global.getHurt = false
		hurtTimer.stop()
		timer.stop()

func _on_hurt_timer_timeout() -> void:
	Global.getHurt = false

func get_hit(value):
	hp -= value


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		_hp -= Global.player_tomato_damage
		hp_ui.value = _hp
		if _hp <= 0:
			var ins = die_effect.instantiate()
			get_parent().add_child(ins)
			ins.global_position = $BulletRoot.global_position
			Global.total_level_kill += 1
			queue_free()


func _on_chase_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body
		target_player = Vector2(player.position.x, player.position.y)
		if _id == 2:
			can_shoot = true


func _on_chase_area_body_exited(body: Node2D) -> void:
	player = null
	go_back = true
	can_shoot = false


func _on_delay_attack_timer_timeout() -> void:
	can_shoot = true


func _on_teleport_cast_timer_timeout() -> void:
	if skill_cooldown == false:
		if start_position.x - target_player.x >= 0:
			self.position.x = start_position.x + left_limit
			skill_cooldown = true
		elif start_position.x - target_player.x < 0:
			self.position.x = start_position.x + right_limit
			skill_cooldown = true


func _on_teleport_cool_down_timer_timeout() -> void:
	skill_cooldown = false
	teleport = false
