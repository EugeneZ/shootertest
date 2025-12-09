class_name Ui extends CanvasLayer

var game_state: GameState
var has_moved := false
var has_shot := false


func _ready() -> void:
	$SpriteWasdHint.modulate = Color(0,0,0,1)


func _process(_delta: float) -> void:
	_process_power_bar()
	_process_wasd_hint()
	_process_mouse_hint()


func _process_power_bar() -> void:
	$ColorRect.scale.x = game_state.get_power() / 100


func _process_wasd_hint() -> void:
	if !is_instance_valid($SpriteWasdHint):
		return
	
	if Input.is_action_pressed("move up") \
	|| Input.is_action_pressed("move down") \
	|| Input.is_action_pressed("move left") \
	|| Input.is_action_pressed("move right") \
	:
		has_moved = true
	
	if has_moved:
		var prev_modulate: Color = $SpriteWasdHint.modulate
		var next_modulate := Color(0,0,0, prev_modulate.a - 0.05)
		if next_modulate.a <= 0:
			$SpriteWasdHint.queue_free()
		$SpriteWasdHint.modulate = next_modulate


func _process_mouse_hint() -> void:
	if !is_instance_valid($SpriteMouseHint):
		return
	
	if Input.is_action_pressed("shoot") \
	|| Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) \
	:
		has_shot = true
	
	if has_shot:
		var prev_modulate: Color = $SpriteMouseHint.modulate
		var next_modulate := Color(0,0,0, prev_modulate.a - 0.05)
		if next_modulate.a <= 0:
			$SpriteMouseHint.queue_free()
		$SpriteMouseHint.modulate = next_modulate
