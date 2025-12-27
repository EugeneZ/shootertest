class_name GameState extends Node

var _power_percent: float = 100.0
var _score: int = 0


func get_power() -> float:
	return _power_percent


func use_power(amount: float) -> void:
	_adjust_power(-amount)


func absorb_cloud_power(amount: float) -> void:
	_adjust_power(amount)


func get_score() -> int:
	return _score


func put_score(points: int) -> void:
	_score += points


func _adjust_power(amount: float) -> void:
	_power_percent += amount
	_power_percent = clampf(_power_percent, 0.0, 100.0)
