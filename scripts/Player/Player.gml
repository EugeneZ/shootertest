function player_dimensions(){
	var _x = room_width / 2
	var _y = room_height / 2
	var _center_x = _x
	var _center_y = _y
	
	var _ship_count = instance_number(obj_ship)
	
	if (_ship_count > 1) {
		show_error("More than one obj_ship unsupported", true)
	}
	
	if (_ship_count == 1) {
		_x = obj_ship.x
		_y = obj_ship.y
		
		_center_x = _x + (obj_ship.sprite_width / 2)
		_center_y = _y + (obj_ship.sprite_height / 2)
	}
	
	return {
		x: _x,
		y: _y,
		center: {
			x: _center_x,
			y: _center_y,
		}
	}
}