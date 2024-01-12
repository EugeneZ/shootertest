#macro MAX_HEALTH 100
#macro HEALTH_WIDTH 30
#macro HEALTH_HEIGHT 4

draw_set_color(c_green)

for (var i = 0; i < life; i++) {
	var _y = lerp( room_height - HEALTH_HEIGHT, 0 ,i / MAX_HEALTH)
	draw_rectangle(x, _y, x + HEALTH_WIDTH, _y + HEALTH_HEIGHT, false)
}