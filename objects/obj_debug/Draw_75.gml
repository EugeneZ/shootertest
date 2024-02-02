if (!console_showing) {
	return
}

draw_set_color(c_black)
draw_set_alpha(0.75)
draw_rectangle(0,0, room_width, room_height, false)

draw_set_color(c_white)
draw_text_ext(100,100,
@"
s - goto store
m - get 100 money
",
20, room_width - 20)

draw_set_alpha(1)