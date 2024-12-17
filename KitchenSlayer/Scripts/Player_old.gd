extends CharacterBody2D

#Ho Hoang My

var bullet = preload("res://Scene/Object/TomatoBullet.tscn")
var die_effect = preload("res://Scene/Object/Effect/DieEffect.tscn")

@onready var ap = $AnimationPlayer
@onready var sprite = $Sprite2D
@onready var bullet_root = $BulletRoot
@onready var musicBus = AudioServer.get_bus_index("Music")
@onready var sfxBus = AudioServer.get_bus_index("SFX")
@onready var jump_sound = $JumpFX
@onready var attack_sound = $AttackFX
@onready var hurt_sound = $HurtFX

const SPEED = 100
const JUMP_FORCE = -280
const GRAVITY = 900
const PUSH_FORCE := 15.0
const MIN_PUSH_FORCE := 30.0

var stop_effect = false
var vertical_velocity = 0.0
var attackAction = false
var delayAction = false
var face_dir : String
var delayAttackTimer: Timer

var points_label: Label
var winLose_panel: Panel
var winLose_label: Label

func _ready():
	points_label = get_node("../CanvasLayer/UI/PointsLabel")
	winLose_panel = get_node("../CanvasLayer/UI/WinLosePanel")
	winLose_label = get_node("../CanvasLayer/UI/WinLosePanel/WinLoseLabel")
	delayAttackTimer = get_node("DelayAttackTimer")
	
	face_dir = "right"

func _process(delta):
	if (Global.stopGame == true && Global.health > 0):
		pass
	elif (Global.health <= 0):
		Global.stopGame = true
		winLose_label.text = "YOU LOSE"
		winLose_panel.visible = true
		Global.stopGame = true
		if stop_effect == false:
			stop_effect = true
			$Sprite2D.visible = false
			var ins = die_effect.instantiate()
			get_parent().add_child(ins)
			ins.global_position = self.global_position
			#queue_free()
	elif (Global.stopGame == false && Global.health > 0):
		if Global.getHurt == true:
			AudioServer.set_bus_mute(sfxBus, false)
			hurt_sound.play()
		handle_movement(delta)
		handle_gravity_and_jump(delta)
		_interact_rigidbody()
		update_pickup_info()

# Function to handle player movement (horizontal)
func handle_movement(delta):
	var direction = Vector2.ZERO
	
	if Global.player_buff_speed == true:
		Global.player_buff_speed_value = 30
	
	# Left and Right Movement
	if Input.is_action_pressed("ui_right"):
		face_dir = "right"
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		face_dir = "left"
		direction.x -= 1

	if Input.is_action_just_pressed("shoot"):
		#attackAction = true
		var ins = bullet.instantiate()
		if face_dir == "right":
			ins.dir = 1
		elif face_dir == "left":
			ins.dir = -1
		AudioServer.set_bus_mute(sfxBus, false)
		attack_sound.play()
		get_parent().add_child(ins)
		ins.global_position = $BulletRoot.global_position
	
	# Set the horizontal movement velocity
	velocity.x = direction.x * (SPEED + Global.player_buff_speed_value)
	
	if direction.x != 0:
		switch_direction(direction.x)
	
	if attackAction == false && delayAction == false:
		update_animations(direction.x)
	elif attackAction == true && delayAction == false:
		#ap.play("attack")
		#delayAction = true
		#delayAttackTimer.start()
		pass

func switch_direction(horizontal_direction):
	sprite.flip_h = (horizontal_direction == -1)
	#sprite.position.x = horizontal_direction * 4

func update_animations(horizontal_direction):
	if is_on_floor():
		if horizontal_direction == 0:
			ap.play("idle")
		else:
			ap.play("run")
	else:
		pass

func handle_gravity_and_jump(delta):
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			AudioServer.set_bus_mute(sfxBus, false)
			jump_sound.play()
			vertical_velocity = JUMP_FORCE
		else:
			vertical_velocity = 0
	else:
		vertical_velocity += GRAVITY * delta

	velocity.y = vertical_velocity

	move_and_slide()

func _interact_rigidbody():
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			var push_force = (PUSH_FORCE * velocity.length() / SPEED) + MIN_PUSH_FORCE
			c.get_collider().apply_central_impulse(-c.get_normal() * push_force)

func update_pickup_info():
	if Global.pick_cooking_item == true:
		AudioServer.set_bus_mute(sfxBus, false)
		$PickUpCookingMaterialFX.play()
		Global.pick_cooking_item = false
		$PickUpItemLabel.visible = true
		$PickUpItemLabel.text = Global.pick_item_info_text
		$DelayPickUpInfoTimer.start()

func _on_delay_attack_timer_timeout() -> void:
	attackAction = false
	delayAction = false


func _on_player_damage_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemyBullet"):
		Global.health -= 1
		Global.get_shot = true
		Global.getHurt = true


func _on_delay_pick_up_info_timer_timeout() -> void:
	$PickUpItemLabel.visible = false
	$PickUpItemLabel.text = "You got "
