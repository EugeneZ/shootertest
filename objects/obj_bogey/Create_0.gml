// scale health - +1 at lvl3,5,7,etc
life += floor((global.wave - 1) / 2)

shoot = function() {
	if (life <= 0) {
		return
	}
	event_perform(ev_other, ev_user0)
}

// By default, just move down
movement_destination = new Vector2(x, room_height)
move_near_player = function(_distance) {
	var _player   =  player_dimensions()
	var _player_x = _player.center.x
	var _player_y = _player.y
	
	var _random_x = irandom_range(
		max(_player_x - _distance, 0),
		min(_player_x + _distance, room_width - self.sprite_width)
	)
	
	var _x = _random_x
	var _y = max(_player_y - _distance, 0)
	movement_destination = new Vector2(floor(_x), floor(_y))
}

when_done_moving_cbs = []
when_done_moving = function(_cb) {
	array_push(when_done_moving_cbs, _cb)
}

if (timeline != noone) {
	timeline_index = timeline
	timeline_running = true
	timeline_loop = true
}

if (path != noone) {
	path_start(path, 4, path_action_continue,false)
}