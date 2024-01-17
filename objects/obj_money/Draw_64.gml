var _text = "$" + string_format(money, 10,0)

var _w = 130
var _h = 40
var _b = 3
var _p = 6

draw_rectangle_color(x, y, x + _w, y + _h, c_yellow, c_yellow, c_red, c_red, false)
draw_rectangle_color(x+_b, y+_b, x + _w - _b, y + _h - _b, c_black, c_black, c_black, c_black, false)

draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_text_color(x+_b +_p,y+_b+_p, _text, c_red, c_red, c_yellow, c_yellow, 1)