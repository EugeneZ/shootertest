class_name Cloud extends Node2D

const MIN_SPEED := 0.2
const MAX_SPEED := 1.5

const CloudBitScene := preload("res://components/cloud/cloud_bit.tscn")

var game_state: GameState
var player: Player
var speed: float


func _ready() -> void:
	speed = randf_range(MIN_SPEED, MAX_SPEED)
	generate()


func _process(_delta: float) -> void:
	position += Vector2.DOWN * speed
	if position.y > 1000:
		queue_free()


func generate() -> void:
	rotation = randi_range(0,359)
	generate_puffball(Vector2.ZERO)
	
	if randf() < 0.1:
		return
	
	var left_distance := Vector2.LEFT * randi_range(15, 22)
	generate_puffball(left_distance)
	if randf() < 0.3:
		generate_puffball(left_distance + Vector2.LEFT * randi_range(15, 22))
	
	if randf() < 0.2:
		return
	
	generate_puffball(Vector2.RIGHT * randi_range(15, 22))
	
	if randf() < 0.7:
		return
	
	generate_puffball(Vector2.UP * randi_range(15, 22))
	
	if randf() < 0.5:
		return
	
	generate_puffball(Vector2.DOWN * randi_range(15, 22))


func add_bit(bit_position: Vector2) -> void:
	var cloud_bit: CloudBit = CloudBitScene.instantiate()
	cloud_bit.player = player
	cloud_bit.game_state = game_state
	cloud_bit.position = bit_position
	add_child(cloud_bit)


func generate_puffball(ball_position: Vector2) -> void:
	add_bit(ball_position)
	
	var orbital_distance := randf_range(5.0, 8.0)
	var orbital_count := randi_range(5,12)
	var orbital_interval := 360.0 / orbital_count
	
	var current_orbital_angle := randf_range(0,359)
	
	for i in orbital_count:
		var fuzzed_orbital_angle := current_orbital_angle + randf_range(-10.0, 10.0)
		var fuzzed_orbital_distance := orbital_distance + randf_range(-2.0, 2.0)
		var direction_vector: Vector2 = Vector2.from_angle(fuzzed_orbital_angle) * fuzzed_orbital_distance
		var bit_vector := ball_position + direction_vector
		add_bit(bit_vector)
		current_orbital_angle += orbital_interval
