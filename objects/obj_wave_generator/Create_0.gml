var _difficulty_budget = 10 + floor(5 * global.wave)

// Min: 3, 3, 4, 4, 5, 5, etc
var _min_waves = 2 + ceil(global.wave / 2)
// Max: 3, 4, 5, 6, 7, 8, etc
var _max_waves = 2 + global.wave

number_of_waves = irandom_range(_min_waves, _max_waves)
timeline = timeline_add();

var _spawns = function(){
	if (global.p_health <= 0) {
		return
	}
	if (next_wave == 0) {
		for (var _i = 0; _i < global.wave + 2; _i++) {
			var _x = lerp(0, room_width - 100, (_i + 1) / (global.wave + 2))
			instance_create_layer(_x, -100, "Instances", obj_alpha)
		}
	} else if (next_wave == 1) {
		for (var _x = 200; _x < 1000; _x += 400) {
			instance_create_layer(_x, -100, "Instances", obj_beta)
		}
		for (var _i = 0; _i < global.wave + 2; _i++) {
			instance_create_layer(200 + (_i * random_range(300, 500)), -100 - (_i * 200), "Instances", obj_beta)
		}
	} else if (next_wave == 2) {
		for (var _i = 0; _i < global.wave; _i++) {
			instance_create_layer(irandom_range(0,1000), -100, "Instances", obj_charlie)
		}
	} else if (next_wave == number_of_waves) {
		room_goto(store)
		timeline_delete(timeline)
	}
		
	next_wave++
}


for (var _i = 0; _i < number_of_waves + 1; _i++) {
	var _step = game_get_speed(gamespeed_fps) * 10 * _i;
    timeline_moment_add_script(timeline, _step, _spawns);
}

timeline_index = timeline
timeline_running = true