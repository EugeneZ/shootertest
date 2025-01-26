var _ships = [
	{
		name: "Extender",
		description: "2 hardpoints, 6 extensions, 5 hp",
		hardpoints: 2,
		extensions: 6,
		hp: 5,
		cost: 5,
	},
	{
		name: "Shooter",
		description: "5 hardpoints, 2 extensions, 3 hp",
		hardpoints: 5,
		extensions: 2,
		hp: 3,
		cost: 5,
	},
	{
		name: "Tank",
		description: "3 hardpoints, 3 extensions, 8 hp",
		hardpoints: 3,
		extensions: 3,
		hp: 8,
		cost: 5,
	}
]

var _guns = [
	{
		name: "Rocket",
		description: "Gun you start with. Shoots forward. 1dmg",
		cost: 2,
	},
	{
		name: "Laser",
		description: "Shoots at any angle of your choice. 1/second.",
		cost: 2,
	},
	{
		name: "Railgun",
		description: "Shoots forward. Low rate of fire. Very high dmg.",
		cost: 2,
	},
	{
		name: "EMP",
		description: "Radiates damage in an area. 3/second."
	}
]

var _mods = [
	{ 
		sprite: spr_better_money, 
		name: "Scrap Refiner",
		description: "Earn more money per kill",
		cost: 1,
		onBuy: function() {
			global.p_money_lvl++
		},
	}, 
	{ 
		sprite: spr_fire_rate, 
		name: "Coolant System",
		description: "Guns shoot bullets faster",
		cost: 1.1,
		onBuy: function() { 
			global.p_fire_rate_lvl++
		}, 
	},
	{ 
		sprite: spr_thrust_upgrade, 
		name: "Gas Jets",
		description: "When changing strafe direction, change almost instantly",
		cost: 1.1,
		onBuy: function() { 
			global.p_thurst_lvl++
		}, 
	},
	{ 
		name: "Reinforced Hull",
		description: "You can ram up to 1 enemy per wave without taking damage",
		cost: 1.1,
		onBuy: function() { 
			
		}, 
	},
	{
		
	}
]

var _reroll = function() {
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
}

_reroll()

steps_since_created = 0