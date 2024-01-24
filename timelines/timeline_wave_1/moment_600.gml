for (var _x = 200; _x < 1000; _x += 400) {
	instance_create_layer(_x, -100, "Instances", obj_beta)
}
for (var _i = 0; _i < global.wave + 2; _i++) {
	instance_create_layer(200 + (_i * random_range(300, 500)), -100 - (_i * 200), "Instances", obj_beta)
}