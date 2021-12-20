/// @description Array Flocker 


//steering forces
vector_array_apply_force(vector_array_align_force(object_index, 300));
vector_array_apply_force(vector_array_cohesion_force(object_index, 200));
vector_array_apply_force(vector_array_separation_force(object_index, 100), 2);


//update vectors
vector_array_limit_magnitude(steering_forces, max_force);
vector_array_add(velocity, steering_forces);
vector_array_limit_magnitude(velocity, max_speed);
vector_array_add(position, velocity);
steering_forces = [0, 0];



//update built in variables
x = position[0];
y = position[1];
image_angle = vector_array_get_direction(velocity);


if (x > room_width) {
	x = 0;
	position[0] = x;
}

if (x < 0) {
	x = room_width;
	position[0] = x;
}

if (y > room_height) {
	y = 0;
	position[1] = y;
}

if (y < 0) {
	y = room_height;
	position[1] = y;
}