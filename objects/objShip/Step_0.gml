#macro ACCEL 0.2
#macro ACCEL_LIMIT 10

var _up = keyboard_check(ord("W"))
var _down = keyboard_check(ord("S"))
var _left = keyboard_check(ord("A"))
var _right = keyboard_check(ord("D"))

if (_up) {
	v_y -= ACCEL
} else if (v_y < 0) {
	v_y += ACCEL
}

if (_down) {
	v_y += ACCEL
} else if (v_y > 0) {
	v_y -= ACCEL
}

if (_left) {
	v_x -= ACCEL
} else if (v_x < 0) {
	v_x += ACCEL
}

if (_right) {
	v_x += ACCEL
} else if (v_x > 0) {
	v_x -= ACCEL
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