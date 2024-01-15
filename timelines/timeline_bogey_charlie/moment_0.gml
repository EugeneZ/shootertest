move_near_player(300)
when_done_moving(function(){
	call_later(0.5, time_source_units_seconds, shoot, false);
})
