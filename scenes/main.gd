extends Node2D

const EnemyScene = preload("res://components/enemy/enemy.tscn")
const CloudScene = preload("res://components/cloud/cloud.tscn")

var game_state: GameState
var viewport: Vector2


func _init() -> void:
	game_state = GameState.new()


func _ready() -> void:
	viewport = get_viewport_rect().size
	$Ui.game_state = game_state
	$Player.game_state = game_state


func spawn_enemy() -> void:
	var enemy: Enemy = EnemyScene.instantiate()
	enemy.position.x = randi_range(50, roundi(viewport.x) - 50)
	enemy.position.y = -50
	add_child(enemy)


func spawn_cloud() -> void:
	var cloud: Cloud = CloudScene.instantiate()
	cloud.game_state = game_state
	cloud.player = $Player
	cloud.position.x = randi_range(50, roundi(viewport.x) - 50)
	cloud.position.y = randi_range(-480, -1500)
	add_child(cloud)


func game_over() -> void:
	$GameOverTimer.start()


func game_quit() -> void:
	get_tree().quit()


func _on_spawn_timer_timeout() -> void:
	spawn_enemy()
	spawn_cloud()
	spawn_cloud()


func _on_player_died() -> void:
	game_over()


func _on_game_over_timer_timeout() -> void:
	game_quit()
