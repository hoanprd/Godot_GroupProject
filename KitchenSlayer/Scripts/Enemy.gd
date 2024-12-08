extends CharacterBody2D

@export var id : int
@export var hp : int
@export var damageDeal : int
@export var enemySpeed : float
@export var rangeLeft : float
@export var rangeRight : float
@export var range_top : float
@export var range_down : float
@export var chase_limit : float

#@onready var hp_ui = $HPBar

var enemy_bullet = preload("res://Scene/Object/EnemyBullet.tscn")

var timer : Timer
var hurtTimer : Timer
var move_random_timer : Timer
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
var reset_move_rng = false

func _ready():
	hurtTimer = get_node("HurtTimer")
	timer = get_node("Timer")
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
		#velocity = position.direction_to(player.position) * _speed
		var ins = enemy_bullet.instantiate()
		get_parent().add_child(ins)
		ins.body_target = player.position
		ins.global_position = $BulletRoot.global_position
	elif index == 3:
		velocity.x = position.direction_to(player.position).x * _speed

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
		_hp -= 1
		hp_ui.value = _hp
		if _hp <= 0:
			queue_free()


func _on_chase_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body


func _on_chase_area_body_exited(body: Node2D) -> void:
	player = null
	go_back = true
