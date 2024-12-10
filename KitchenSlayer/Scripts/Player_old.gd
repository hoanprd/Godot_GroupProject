extends CharacterBody2D

var bullet = preload("res://Scene/Object/TomatoBullet.tscn")

@onready var ap = $AnimationPlayer
@onready var sprite = $Sprite2D
@onready var bullet_root = $BulletRoot

const SPEED = 100
const JUMP_FORCE = -280
const GRAVITY = 900

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
	elif (Global.stopGame == false && Global.health > 0):
		handle_movement(delta)
		handle_gravity_and_jump(delta)

# Function to handle player movement (horizontal)
func handle_movement(delta):
	var direction = Vector2.ZERO
	
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
		get_parent().add_child(ins)
		ins.global_position = $BulletRoot.global_position
	
	# Set the horizontal movement velocity
	velocity.x = direction.x * SPEED
	
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
			vertical_velocity = JUMP_FORCE
		else:
			vertical_velocity = 0
	else:
		vertical_velocity += GRAVITY * delta

	velocity.y = vertical_velocity

	move_and_slide()

func _on_delay_attack_timer_timeout() -> void:
	attackAction = false
	delayAction = false


func _on_player_damage_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemyBullet"):
		Global.health -= 1
		Global.get_shot = true
		Global.getHurt = true
