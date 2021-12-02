/// @description Flocker


////steering forces
apply_force(align_force(object_index, 300));
apply_force(cohesion_force(object_index, 200));
apply_force(separation_force(object_index, 100), 200);

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
