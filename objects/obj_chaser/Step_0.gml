/// @description Chaser


//steering forces
apply_force(pursue_force(target));
apply_force(wander_force(), 0.5);

//update vectors
velocity.add(steering_forces);
velocity.limit_magnitude(max_speed);
position.add(velocity);

steering_forces.set(0, 0);


//update built in variables
x = position.x;
y = position.y;
image_angle = velocity.get_direction();
