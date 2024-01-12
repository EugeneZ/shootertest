#macro min_time_between_cluster 3
#macro max_time_between_cluster 15
#macro min_clouds 5
#macro max_clouds 25
#macro y_spread 50
#macro v_y_min 0.1
#macro v_y_spread 1
#macro v_x_min 0
#macro v_x_spread 0.1

// TODO: put in create for perf/maint
var _clouds = tag_get_asset_ids("cloud", asset_sprite);

time_since_last_cluster += delta_time / 1000000

var _should_spawn_cluster = false

var _chance = (time_since_last_cluster - min_time_between_cluster) / (max_time_between_cluster - min_time_between_cluster)

if (_chance > random(1)) {
	_should_spawn_cluster = true
}

if (!_should_spawn_cluster) {
	return
}

time_since_last_cluster = 0

var _n = irandom_range(min_clouds,max_clouds)
for (var _i = 0; _i < _n; _i++) {
	var _x = irandom(room_width - sprite_get_width(spr_cloud1))
	var _y = 0 - y_spread - irandom(y_spread) - sprite_get_height(spr_cloud1)
	var _cloud = instance_create_layer(_x, _y, "Clouds", obj_cloud)
	_cloud.v_y = random_range(v_y_min, v_y_min + v_y_spread)
	_cloud.v_x = random_range(v_x_min, v_x_min + v_x_spread)
	_cloud.sprite_index = _clouds[irandom_range(0,array_length(_clouds)-1)]
}