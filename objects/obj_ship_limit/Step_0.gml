/// @description Ship 


//get direction and convert it to x and y force
var _dir, _accel_x, _accel_y; 
_dir = point_direction(x, y, mouse_x, mouse_y);
_accel_x = lengthdir_x(accel_force, _dir);
_accel_y = lengthdir_y(accel_force, _dir);

//update vectors
acceleration.set(_accel_x, _accel_y);
velocity.add(acceleration);
velocity.limit_magnitude(max_speed);

//update built in variables
x += velocity.x;
y += velocity.y;
image_angle = point_direction(0, 0, velocity.x, velocity.y);

