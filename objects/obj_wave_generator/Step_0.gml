if (cluster_index == array_length(clusters) && instance_number(obj_bogey) == 0) {
	end_frames++
}

if (end_frames >= game_get_speed(gamespeed_fps) * 2) {
	room_goto(store)
	timeline_delete(timeline)
	instance_destroy(self)
}