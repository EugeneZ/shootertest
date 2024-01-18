var _heart_w = sprite_get_width(spr_health)
var _padding_x = -(_heart_w + _heart_w)
var _padding_y = 0

for (var i = 0; i < global.p_health; i++) {
	draw_sprite(spr_health, 0, x + (i * _padding_x), y + (i * _padding_y))
}

if (game_over) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed_colour(room_width / 2, room_height / 2, "GAME OVER", 8, 8, 0, c_red, c_red, c_yellow, c_yellow, 1);
}