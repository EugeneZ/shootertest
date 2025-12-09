class_name Ui extends CanvasLayer

var game_state: GameState
var has_moved := false
var has_shot := false

@onready
var inst_power_bar := $ColorRect

@onready
var inst_wasd_hint := $SpriteWasdHint

@onready
var inst_mouse_hint := $SpriteMouseHint

func _ready() -> void:
	inst_wasd_hint.modulate = Color(0,0,0,1)


func _process(_delta: float) -> void:
	_process_power_bar()
	_process_wasd_hint()
	_process_mouse_hint()


func _process_power_bar() -> void:
	inst_power_bar.scale.x = game_state.get_power() / 100


func _process_wasd_hint() -> void:
	if !is_instance_valid(inst_wasd_hint):
		return
	
	if Input.is_action_pressed("move up") \
	|| Input.is_action_pressed("move down") \
	|| Input.is_action_pressed("move left") \
	|| Input.is_action_pressed("move right") \
	:
		has_moved = true
	
	if has_moved:
		var prev_modulate: Color = inst_wasd_hint.modulate
		var next_modulate := Color(0,0,0, prev_modulate.a - 0.05)
		if next_modulate.a <= 0:
			inst_wasd_hint.queue_free()
		inst_wasd_hint.modulate = next_modulate


func _process_mouse_hint() -> void:
	if !is_instance_valid(inst_mouse_hint):
		return
	
	if Input.is_action_pressed("shoot") \
	|| Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) \
	:
		has_shot = true
	
	if has_shot:
		var prev_modulate: Color = inst_mouse_hint.modulate
		var next_modulate := Color(0,0,0, prev_modulate.a - 0.05)
		if next_modulate.a <= 0:
			inst_mouse_hint.queue_free()
		inst_mouse_hint.modulate = next_modulate
