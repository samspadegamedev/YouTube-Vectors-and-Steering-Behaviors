/// @description Flocker All


////steering forces
var _behavior = choose(1, 2, 3, 0, 0, 0, 0);

if (_behavior == 1) {
	apply_force(align_force_list(ship_align_array));
} else if (_behavior == 2) {
	apply_force(cohesion_force_list(ship_cohesion_array));
} else if (_behavior == 3) {
	apply_force(separation_force_list(ship_separation_array), 2);
}


//update vectors
if (_behavior != 0) {
	steering_forces.limit_magnitude(max_force);
	velocity.add(steering_forces);
	velocity.limit_magnitude(max_speed);
}
position.add(velocity);
steering_forces.set(0, 0);


//update built in variables
x = position.x;
y = position.y;
image_angle = velocity.get_direction();


edge_wrap();
