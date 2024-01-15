/// @description Movement
if (is_instanceof(movement_destination, RemainStill)) {
	return
}

if (x < movement_destination.x) {
	x += min(x_velocity, movement_destination.x - x)
} else if (x > movement_destination.x) {
	x -= min(x_velocity, x - movement_destination.x)
}

if (y < movement_destination.y) {
	y += min(y_velocity, movement_destination.y - y)
} else if (y > movement_destination.y) {
	y -= min(y_velocity, y - movement_destination.y)
}

if (x == movement_destination.x && y == movement_destination.y) {
	var _length = array_length(when_done_moving_cbs)
	for (var _i = 0; _i < _length; _i++) {
		method_call(when_done_moving_cbs[_i],[])
	}
	array_delete(when_done_moving_cbs, 0, _length)
}