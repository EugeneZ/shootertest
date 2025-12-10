class_name Enemy extends Area2D

@export var speed: float

const BulletScene = preload("res://components/bullet/bullet.tscn")

const MIN_UNTIL_MOVE = 3
const MAX_UNTIL_MOVE = 6

@onready
var inst_bullet_origin := $BulletOrigin

@onready
var inst_shoot_timer := $ShootTimer

@onready
var inst_move_timer := $MoveTimer

# Enabled once it fully enters screen for the first time
# Then it can move/shoot
var enabled := false

# How many pixels to bank left or right
var x_to_bank: float = 0


func _process(_delta: float) -> void:
	var direction := Vector2.DOWN
	if x_to_bank < 0:
		direction += Vector2.LEFT
	elif x_to_bank > 0:
		direction += Vector2.RIGHT
	elif enabled and inst_move_timer.is_stopped():
		inst_move_timer.start(randf_range(MIN_UNTIL_MOVE, MAX_UNTIL_MOVE))
	
	var prev_x := position.x
	position += direction.normalized() * speed
	x_to_bank -= position.x - prev_x
	
	if x_to_bank < 1 and x_to_bank > -1:
		x_to_bank = 0
	
	# Enable when far down enough
	if !enabled and position.y > 20:
		enabled = true
		inst_shoot_timer.start()
		inst_move_timer.start(randf_range(MIN_UNTIL_MOVE, MAX_UNTIL_MOVE))
	
	# Clean up
	if position.y > 1000:
		queue_free()


func shoot() -> void:
	var bullet: Bullet = BulletScene.instantiate()
	bullet.speed = 8
	bullet.position = inst_bullet_origin.global_position
	bullet.velocity = Vector2.DOWN
	bullet.set_collision_layer_value(1, true)
	bullet.set_collision_mask_value(1, true)
	add_sibling(bullet)


func start_banking() -> void:
	if x_to_bank != 0:
		return
	var direction: float = [-1,1].pick_random()
	if position.x < 100:
		direction = 1
	elif position.x > 540:
		direction = -1
	x_to_bank = randi_range(30, 150) * direction


func die() -> void:
	queue_free()


func _on_area_entered(_area: Area2D) -> void:
	die()


func _on_shoot_timer_timeout() -> void:
	shoot()


func _on_move_timer_timeout() -> void:
	start_banking()
