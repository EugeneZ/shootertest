// Comment this out to get more predictable random numbers
randomize()

var _difficulty_budget = 3 + floor(9 * global.wave)

// Min: 3, 3, 4, 4, 5, 5, etc
var _min_clusters = 2 + ceil(global.wave / 2)
// Max: 3, 4, 5, 6, 7, 8, etc
var _max_clusters = 2 + global.wave

var _costs = {
	obj_alpha: 1,
	obj_beta: 2,
	obj_charlie: 3,
}

var _number_of_clusters = irandom_range(_min_clusters, _max_clusters)
timeline = timeline_add();
clusters = []

var _spawn_next_cluster = function(){
	if (global.p_health <= 0) {
		return
	}
	
	// Wave over?
	if (cluster_index == array_length(clusters)) {
		room_goto(store)
		timeline_delete(timeline)
		return
	}
	
	// Wave not over, spawn cluster
	var _cluster = clusters[cluster_index]
	for (var _i = 0; _i < array_length(_cluster); _i++) {
		var _event = _cluster[_i]
		var _obj = _event.obj
		instance_create_layer(_event.x, _event.y, "Instances", _obj)
	}
	
	cluster_index++
}

for (var _i = 0; _i < _number_of_clusters + 1; _i++) {
	var _cluster = []
	array_push(clusters, _cluster)
	
	var _cluster_budget = _difficulty_budget / (_number_of_clusters - _i)
	_cluster_budget = random_range(_cluster_budget * 0.8, _cluster_budget * 1.2)
	_cluster_budget = floor(_cluster_budget)
	_cluster_budget = min(_cluster_budget, _difficulty_budget)
	
	_difficulty_budget -= _cluster_budget
	
	// final cluster? Spend the rest of the budget
	if (_i + 1 == _number_of_clusters) {
		_cluster_budget += _difficulty_budget
		_difficulty_budget = 0
	}
	
	var _enemies_in_cluster = []
	while (_cluster_budget > 0) {
		var _r = random_range(0,1)
		for (var _k = 0; _k < _i * 4; _k++) {
			var _new_r = random_range(0,1)
			if (_new_r > _r) {
				_r = _new_r
			}
		}
		
		var _obj
		
		if (_cluster_budget >= _costs.obj_charlie && _r > 0.9) {
			_obj = obj_charlie
			_cluster_budget -= _costs.obj_charlie
		} else if (_cluster_budget >= _costs.obj_beta && _r > 0.7) {
			_obj = obj_beta
			_cluster_budget -= _costs.obj_beta
		} else {
			_obj = obj_alpha
			_cluster_budget -= _costs.obj_alpha
		}
		
		array_push(_enemies_in_cluster, _obj)
	}
	
	var _number_of_enemies_in_cluster = array_length(_enemies_in_cluster)
	for (var _j = 0; _j < _number_of_enemies_in_cluster; _j++) {
		var _obj = _enemies_in_cluster[_j]
		var _x = lerp(0, room_width, (_j + 1) / (_number_of_enemies_in_cluster + 1))
		var _event = {
			x: _x,
			y: irandom_range(-50, -150),
			obj: _obj,
		}
		array_push(_cluster, _event)
	}
	
	var _step = (game_get_speed(gamespeed_fps) * 10 * _i) + (game_get_speed(gamespeed_fps) * 3);
    timeline_moment_add_script(timeline, _step, _spawn_next_cluster);
}

timeline_index = timeline
timeline_running = true