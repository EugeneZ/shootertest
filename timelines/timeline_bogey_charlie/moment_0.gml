move_near_player(irandom_range(300,500))
when_done_moving(function(){
	call_later(0.5, time_source_units_seconds, shoot, false);
})
