class_name Bullet extends Area2D

var speed: float
var velocity: Vector2


func _process(_delta: float) -> void:
	position += velocity.normalized() * speed


func destroy() -> void:
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	destroy()


func _on_area_entered(_area: Area2D) -> void:
	destroy()
