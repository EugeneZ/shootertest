class_name Enemy extends Area2D

@export var speed: float

const BulletScene = preload("res://components/bullet/bullet.tscn")


func _process(_delta: float) -> void:
	position += Vector2.DOWN * speed
	if position.y > 1000:
		queue_free()


func shoot() -> void:
	var bullet: Bullet = BulletScene.instantiate()
	bullet.speed = 8
	bullet.position = $BulletOrigin.global_position
	bullet.velocity = Vector2.DOWN
	bullet.set_collision_layer_value(1, true)
	bullet.set_collision_mask_value(1, true)
	add_sibling(bullet)


func die() -> void:
	queue_free()


func _on_timer_timeout() -> void:
	shoot()


func _on_area_entered(_area: Area2D) -> void:
	die()
