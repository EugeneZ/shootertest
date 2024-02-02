// This is the tilde key
if (keyboard_check_pressed(192)) {
	if (console_showing) {
		console_showing = false
	} else {
		console_showing = true
	}
}

if (!console_showing) {
	return
}

if (keyboard_check_pressed(ord("S"))) {
	room_goto(store)
}

if (keyboard_check_pressed(ord("M"))) {
	global.p_money += 100
}