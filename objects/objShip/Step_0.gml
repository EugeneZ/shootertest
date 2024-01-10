/// @description Movement
#macro ACCEL 0.2
#macro ACCEL_LIMIT 10

var _up = keyboard_check(ord("W"))
var _down = keyboard_check(ord("S"))
var _left = keyboard_check(ord("A"))
var _right = keyboard_check(ord("D"))

if (_up) {
	accel_y -= ACCEL
} else if (accel_y < 0) {
	accel_y += ACCEL
}

if (_down) {
	accel_y += ACCEL
} else if (accel_y > 0) {
	accel_y -= ACCEL
}

if (_left) {
	accel_x -= ACCEL
} else if (accel_x < 0) {
	accel_x += ACCEL
}

if (_right) {
	accel_x += ACCEL
} else if (accel_x > 0) {
	accel_x -= ACCEL
}

// LIMITS
if (accel_y > ACCEL_LIMIT) {
	accel_y = ACCEL_LIMIT
}
if (accel_y < -ACCEL_LIMIT) {
	accel_y = -ACCEL_LIMIT
}
if (accel_x > ACCEL_LIMIT) {
	accel_x = ACCEL_LIMIT
}
if (accel_x < -ACCEL_LIMIT) {
	accel_x = -ACCEL_LIMIT
}

// Actual move
x += accel_x
y += accel_y

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