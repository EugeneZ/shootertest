var _m = 50

var _upgrade_count = array_length(three_random_upgrades)

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

// Selection text
if (_selected_upgrade) {
	draw_set_halign(fa_center)
	draw_text_color(
		room_width / 2,
		room_height - 300,
		_selected_upgrade.description,
		c_orange, c_orange, c_yellow, c_yellow,1
	)
}

// upgrade sprites
var _upgrade_p = 10
var _upgrade_b = 10
for (var i = 0; i < _upgrade_count ; i++) {
	var _upgrade = three_random_upgrades[i]
	var _sprite = _upgrade.sprite
	
	var _scale = 5
	var _x1 = _m + (i * 450)
	var _y1 = 100
	var _x2 = _x1 + (sprite_get_width(_sprite)  * _scale)
	var _y2 = _y1 + (sprite_get_height(_sprite) * _scale)
	
	// If selected, draw border bg
	if (_upgrade == _selected_upgrade) {
		draw_rectangle_color(
			_x1 - _upgrade_p - _upgrade_b,
			_y1 - _upgrade_p - _upgrade_b,
			_x2 + _upgrade_p + _upgrade_b,
			_y2 + _upgrade_p + _upgrade_b,
			c_orange, c_orange, c_red, c_red,
			false
		)
	}
	
	// padding (and creates border effect if selection is active)
	draw_rectangle_color(
		_x1-_upgrade_p,
		_y1-_upgrade_p,
		_x2+_upgrade_p,
		_y2+_upgrade_p,
		c_black, c_black, c_black, c_black,
		false
	)
	
	// Actual sprite
	draw_sprite_ext(_sprite,0, _x1, _y1, _scale, _scale, 0, c_white, 1)
}

// Go button
var _btn_x1 = (room_width / 2) - 200
var _btn_x2 = (room_width / 2) + 200
var _btn_y1 = room_height - 200
var _btn_y2 = room_height - 100

if (cursor == "bottom") {
	draw_rectangle_color(
			_btn_x1 - _upgrade_p - _upgrade_b,
			_btn_y1 - _upgrade_p - _upgrade_b,
			_btn_x2 + _upgrade_p + _upgrade_b,
			_btn_y2 + _upgrade_p + _upgrade_b,
			c_orange, c_orange, c_red, c_red,
			false
		)
}

draw_rectangle_color(
	_btn_x1-_upgrade_p,
	_btn_y1-_upgrade_p,
	_btn_x2+_upgrade_p,
	_btn_y2+_upgrade_p,
	c_black, c_black, c_black, c_black,
	false
)

draw_rectangle_color(
	_btn_x1,
	_btn_y1,
	_btn_x2,
	_btn_y2,
	c_yellow, c_yellow, c_orange, c_orange,
	false
)

draw_set_halign(fa_center)
draw_text_color(
	_btn_x1 + ((_btn_x2 - _btn_x1) / 2),
	_btn_y1 + ((_btn_y2 - _btn_y1) / 2),
	"Next Wave",
	c_black, c_black, c_black, c_black,
	1
)