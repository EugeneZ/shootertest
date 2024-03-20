var _accel = 0.25 * global.p_thurst_lvl
var _accel_limit = 15 * global.p_thurst_lvl
var _decel = max(0, 0.5 - (global.p_thurst_lvl * 0.1))

var _up = keyboard_check(ord("W"))
var _down = keyboard_check(ord("S"))
var _left = keyboard_check(ord("A"))
var _right = keyboard_check(ord("D"))
var _space = keyboard_check(ord(" "))







if (_up) {
	v_y -= _accel
} else if (v_y < 0) {
	v_y = min(v_y + _decel, 0)
}

if (_down) {
	v_y += _accel
} else if (v_y > 0) {
	v_y = max(v_y - _decel, 0)
}

if (_left) {
	v_x -= _accel
} else if (v_x < 0) {
	v_x = min(v_x + _decel, 0)
}

if (_right) {
	v_x += _accel
} else if (v_x > 0) {
	v_x = max(v_x - _decel, 0)
}

// LIMITS
if (v_y > _accel_limit) {
	v_y = _accel_limit
}
if (v_y < -_accel_limit) {
	v_y = -_accel_limit
}
if (v_x > _accel_limit) {
	v_x = _accel_limit
}
if (v_x < -_accel_limit) {
	v_x = -_accel_limit
}

// Actual move
x += v_x
y += v_y

// bounds
if (x < 0) {
	x = 0
}
if (x + sprite_width > room_width) {
	x = room_width - sprite_width
}
if (y < 0) {
	y = 0
}
if (y + sprite_height > room_height) {
	y = room_height - sprite_height
}

// SHOOT
var _shot_interval = 0.3 - (global.p_fire_rate_lvl * 0.05)
since_last_shot += delta_time / 1000000

if (_space && since_last_shot > _shot_interval) {
	since_last_shot = 0
	audio_play_sound(snd_shoot, 0, false, 1, 0, random_range(1,1.2))
	
	if (global.p_gun_lvl == 1) {
		instance_create_layer(
			x + (sprite_width/2),
			y,
			"Instances",
			obj_bullet
		)
	}
	
	if (global.p_gun_lvl == 2) {
		instance_create_layer(
			x + 5,
			y,
			"Instances",
			obj_bullet
		)
		
		instance_create_layer(
			x + sprite_width - 5,
			y,
			"Instances",
			obj_bullet
		)
	}
	
	if (global.p_gun_lvl >= 3) {
		instance_create_layer(
			x + (sprite_width/2),
			y,
			"Instances",
			obj_bullet
		)
		
		var _b1 = instance_create_layer(
			x + sprite_width - 5,
			y,
			"Instances",
			obj_bullet
		)
		
		_b1.move_direction = 60
		
		var _b2 = instance_create_layer(
			x + sprite_width - 5,
			y,
			"Instances",
			obj_bullet
		)
		
		_b2.move_direction = 120
	}
	
}