var _upgrades = [ 
	{ 
		sprite: spr_better_money, 
		name: "Scrap Refining",
		description: "Earn more money per kill",
		cost: 1,
		onBuy: function() {
			global.p_money_lvl++
		},
	}, 
	{ 
		sprite: spr_fire_rate, 
		name: "Barrel Cooling",
		description: "Guns shoot bullets faster",
		cost: 1.1,
		onBuy: function() { 
			global.p_fire_rate_lvl++ 
		}, 
	}, 
	{ 
		sprite: spr_gun_upgrade,
		name: "Additional Gun",
		description: "You fire an additional bullet", 
		cost: 3,
		onBuy: function() { 
			global.p_gun_lvl++ 
		}, 
	}, 
	{ 
		sprite: spr_heal, 
		name: "Repair",
		description: "Gain health", 
		cost: 0.75,
		onBuy: function() { 
			global.p_health++ 
		}, 
	}, 
	{ 
		sprite: spr_thrust_upgrade,
		name: "Thruster Upgrade",
		description: "Better ship control", 
		cost: 1,
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