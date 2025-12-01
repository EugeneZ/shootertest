class_name CloudBit extends Node2D

const MIN_DISTANCE_TO_BE_SUCKED_UP: float = 60.0
const MAX_RADIUS_PER_SECOND: float = 25.0
const POWER_PERCENT_PER_RADIUS: float = 0.1

var player: Player
var game_state: GameState
var color: Color
var radius: float


func _ready() -> void:
	var possible_colors: Array[String] = [
		"#c8e4ff",
		"#f8e4ff",
		"#d8f4ff"
	]
	color = Color.from_string(possible_colors.pick_random(), Color.WHITE)
	update_radius(randf_range(5.0, 20.0))


func _process(delta: float) -> void:
	var distance_to_player := global_position.distance_to(player.global_position)
	if distance_to_player > MIN_DISTANCE_TO_BE_SUCKED_UP:
		return
	
	var sucking_power := inverse_lerp(MIN_DISTANCE_TO_BE_SUCKED_UP, 0, distance_to_player)
	var radius_consumed := MAX_RADIUS_PER_SECOND * delta * sucking_power
	game_state.absorb_cloud_power(radius_consumed * POWER_PERCENT_PER_RADIUS)
	update_radius(radius - radius_consumed)


func _draw() -> void:
	draw_circle(position, radius, color, true, -1.0, true)


func update_radius(new_radius: float) -> void:
	radius = new_radius
	queue_redraw()
	if radius < 1:
		radius = 0
		queue_free()
