var _center_x = x + (sprite_width / 2)
var _center_y = y + (sprite_height / 2)

var _player = player_dimensions()
var _player_x = _player.x
var _player_y = _player.y

var _range = 7
var _direction = point_direction(_center_x, _center_y, _player_x, _player_y)
var _adjust_x = lengthdir_x(_range, _direction)
var _adjust_y = lengthdir_y(_range, _direction)
var _to_x = _center_x - (sprite_get_width(spr_charlie_eye) / 2) + _adjust_x
var _to_y = _center_y - (sprite_get_height(spr_charlie_eye) / 2) + _adjust_y

draw_sprite(spr_charlie_eye, 0, _to_x, _to_y)