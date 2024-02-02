steps_since_created++

var _up = keyboard_check_pressed(ord("W"))
var _down = keyboard_check_pressed(ord("S"))
var _left = keyboard_check_pressed(ord("A"))
var _right = keyboard_check_pressed(ord("D"))
var _space = keyboard_check_released(ord(" ")) && steps_since_created > 60

if (_down) {
	cursor = "bottom"
} else

if (cursor == "bottom" && _up) {
	cursor = "center"
} else

if (cursor == "left" && _right) {
	cursor = "center"
} else

if (cursor == "center" && _right) {
	cursor = "right"
} else

if (cursor == "right" && _left) {
	cursor = "center"
} else

if (cursor == "center" && _left) {
	cursor = "left"
} else

if (_space && cursor == "bottom") {
	global.wave++
	room_goto(combat)
	return
}

var _selected_upgrade = noone
if (cursor == "left") {
	_selected_upgrade = three_random_upgrades[0]
}
if (cursor == "center") {
	_selected_upgrade = three_random_upgrades[1]
}
if (cursor == "right") {
	_selected_upgrade = three_random_upgrades[2]
}

if (_space && cursor != "bottom" && _selected_upgrade) {
	var _cost = upgrade_cost(_selected_upgrade)
	if (_cost <= global.p_money) {
		global.p_money -= _cost
		_selected_upgrade.onBuy()
	}
}