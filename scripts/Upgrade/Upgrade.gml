function upgrade_cost(_upgrade) {
	var _base = 300 + (200 * global.wave)
	return _base * _upgrade.cost
}