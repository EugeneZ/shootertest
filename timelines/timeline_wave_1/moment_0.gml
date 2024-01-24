for (var _i = 0; _i < global.wave + 2; _i++) {
	var _x = lerp(0, room_width - 100, (_i + 1) / (global.wave + 2))
	instance_create_layer(_x, -100, "Instances", obj_alpha)
}