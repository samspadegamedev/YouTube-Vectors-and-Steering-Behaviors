/// @description Dithering Flocker


////steering forces
var _behavior = choose(1, 2, 3);

if (_behavior == 1) {
	apply_force(align_force(object_index, 300));
} else if (_behavior == 2) {
	apply_force(cohesion_force(object_index, 200));
} else if (_behavior == 3) {
	apply_force(separation_force(object_index, 100), 2);
}



//update vectors
steering_forces.limit_magnitude(max_force);
velocity.add(steering_forces);
velocity.limit_magnitude(max_speed);
position.add(velocity);
steering_forces.set(0, 0);


//update built in variables
x = position.x;
y = position.y;
image_angle = velocity.get_direction();


edge_wrap();
