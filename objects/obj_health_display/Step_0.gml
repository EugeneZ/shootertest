if (life <= 0 && !game_over) {
	instance_destroy(obj_ship)
	game_over = true
}