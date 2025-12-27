class_name Player extends Area2D

@export var speed: float

signal died

const POWER_PER_SHOT = 20
const BulletScene = preload("res://components/bullet/bullet.tscn")

var viewport: Vector2
var game_state: GameState


func _ready() -> void:
	viewport = get_viewport_rect().size
	$ReloadTimer.stop()


func _process(_delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		shoot()
	
	var velocity := Vector2.ZERO
	
	if Input.is_action_pressed("move up"):
		velocity.y -= 1
	if Input.is_action_pressed("move down"):
		velocity.y += 1
	if Input.is_action_pressed("move left"):
		velocity.x -= 1
	if Input.is_action_pressed("move right"):
		velocity.x += 1
	
	# Avoids ending on a fraction of a pixel, which looks ugly
	var is_zero_velocity := false
	if velocity == Vector2.ZERO:
		is_zero_velocity = true
		position = position.round()
	
	var is_dashing := false
	if !is_zero_velocity and Input.is_action_just_pressed("dash") and game_state.get_power() > 10:
		game_state.use_power(10)
		is_dashing = true
	
	position += velocity.normalized() * speed * (20 if is_dashing else 1)
	
	position = position.clamp(Vector2.ZERO, viewport)


func shoot() -> void:
	if game_state.get_power() < POWER_PER_SHOT:
		return
	if $ReloadTimer.is_stopped() == false:
		return
	$ReloadTimer.start()
	game_state.use_power(POWER_PER_SHOT)
	var bullet: Bullet = BulletScene.instantiate()
	bullet.speed = 8
	bullet.position = $BulletOrigin.global_position
	bullet.velocity = get_local_mouse_position() - $BulletOrigin.position
	bullet.set_collision_layer_value(2, true)
	bullet.set_collision_mask_value(2, true)
	add_sibling(bullet)


func die() -> void:
	visible = false
	died.emit()


func _on_area_entered(area: Area2D) -> void:
	if area is Bullet:
		die()
	if area is Enemy:
		die()
