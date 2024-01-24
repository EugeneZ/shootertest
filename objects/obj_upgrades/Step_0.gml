var _up = keyboard_check_pressed(ord("W"))
var _down = keyboard_check_pressed(ord("S"))
var _left = keyboard_check_pressed(ord("A"))
var _right = keyboard_check_pressed(ord("D"))
var _space = keyboard_check_released(ord(" "))

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

if (_space && cursor != "bottom") {
	var _price = 300 + (global.wave * 200)
	if (_price <= global.p_money) {
		
		
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
		
		if (_selected_upgrade) {
			global.p_money -= _price
			_selected_upgrade.onBuy()
		}
	}
}