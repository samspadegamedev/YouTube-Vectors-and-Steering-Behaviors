/// @description Simple Ship


var _dir = random(360);
hsp = lengthdir_x(3, _dir);
vsp = lengthdir_y(3, _dir);

image_angle = point_direction(0, 0, hsp, vsp);

