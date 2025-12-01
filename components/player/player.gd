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
	if Input.is_action_pressed("shoot"):
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
	
	position += velocity.normalized() * speed
	
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
