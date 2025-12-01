class_name Ui extends CanvasLayer

var game_state: GameState


func _process(_delta: float) -> void:
	$ColorRect.scale.x = game_state.get_power() / 100
