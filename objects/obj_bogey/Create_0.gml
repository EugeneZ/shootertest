if (timeline != noone) {
	timeline_index = timeline
	timeline_running = true
	timeline_loop = true
}

if (path != noone) {
	path_start(path, 4, path_action_continue,false)
}

shoot = function() {
	event_perform(ev_other, ev_user0)
}