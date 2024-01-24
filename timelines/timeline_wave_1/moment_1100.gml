for (var _x = 400; _x < 1000; _x += 400) {
	instance_create_layer(_x, -100, "Instances", obj_charlie)
}

for (var _i = 0; _i < global.wave - 1; _i++) {
	instance_create_layer(irandom_range(0,1000), -100, "Instances", obj_charlie)
}