var _bullet = instance_create_layer(x + (sprite_width/2), y+sprite_height, "Instances", obj_bullet)

_bullet.v = 10

// TODO consider doing these calculations once per step
var _my_x = x + (sprite_width / 2) 
var _my_y = y + (sprite_height / 2)
var _p_x  = obj_ship.x + (obj_ship.sprite_width / 2)
var _p_y  = obj_ship.y + (obj_ship.sprite_height / 2)

_bullet.move_direction = point_direction(_my_x, _my_y, _p_x, _p_y)