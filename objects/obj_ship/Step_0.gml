#macro ACCEL 0.25
#macro ACCEL_LIMIT 15
#macro DECEL 0.4

var _up = keyboard_check(ord("W"))
var _down = keyboard_check(ord("S"))
var _left = keyboard_check(ord("A"))
var _right = keyboard_check(ord("D"))
var _space = keyboard_check(ord(" "))

if (_up) {
	v_y -= ACCEL
} else if (v_y < 0) {
	v_y = min(v_y + DECEL, 0)
}

if (_down) {
	v_y += ACCEL
} else if (v_y > 0) {
	v_y = max(v_y - DECEL, 0)
}

if (_left) {
	v_x -= ACCEL
} else if (v_x < 0) {
	v_x = min(v_x + DECEL, 0)
}

if (_right) {
	v_x += ACCEL
} else if (v_x > 0) {
	v_x = max(v_x - DECEL, 0)
}

// LIMITS
if (v_y > ACCEL_LIMIT) {
	v_y = ACCEL_LIMIT
}
if (v_y < -ACCEL_LIMIT) {
	v_y = -ACCEL_LIMIT
}
if (v_x > ACCEL_LIMIT) {
	v_x = ACCEL_LIMIT
}
if (v_x < -ACCEL_LIMIT) {
	v_x = -ACCEL_LIMIT
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
#macro SHOT_INTERVAL 0.25
since_last_shot += delta_time / 1000000

if (_space && since_last_shot > SHOT_INTERVAL) {
	since_last_shot = 0
	var _bullet = instance_create_layer(
		x + (sprite_width/2),
		y,
		"Instances",
		obj_bullet
	)
	
	_bullet.v = -20
	_bullet.friendly = true
}