var _upgrades = [ 
	{ 
		sprite: spr_better_money, 
		description: "Earn more per kill", 
		onBuy: function() { 
			global.p_money_lvl++ 
		}, 
	}, 
	{ 
		sprite: spr_fire_rate, 
		description: "Guns shoot faster", 
		onBuy: function() { 
			global.p_fire_rate_lvl++ 
		}, 
	}, 
	{ 
		sprite: spr_gun_upgrade, 
		description: "Improved guns", 
		onBuy: function() { 
			global.p_gun_lvl++ 
		}, 
	}, 
	{ 
		sprite: spr_heal, 
		description: "Gain health", 
		onBuy: function() { 
			global.p_health++ 
		}, 
	}, 
	{ 
		sprite: spr_thrust_upgrade, 
		description: "Better ship control", 
		onBuy: function() { 
			global.p_thurst_lvl++ 
		}, 
	}, 
] 

var _upgrade_count = array_length(_upgrades)
var _three_random_upgrades = [] 
while (array_length(_three_random_upgrades) < 3) { 
	 var _candidate = irandom(_upgrade_count-1)
	 if (!array_contains(_three_random_upgrades, _candidate)) {
		 array_push(_three_random_upgrades, _candidate)
	 }
}

three_random_upgrades = [
	_upgrades[_three_random_upgrades[0]],
	_upgrades[_three_random_upgrades[1]],
	_upgrades[_three_random_upgrades[2]],
]

cursor = "center"
steps_since_created = 0