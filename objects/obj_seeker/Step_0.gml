/// @description Seeker 


//steering forces
steering_forces.add(arrive_force(mouse_x, mouse_y, 100));

//update vectors
velocity.add(steering_forces);
velocity.limit_magnitude(max_speed);
position.add(velocity);

steering_forces.set(0, 0);


//update built in variables
x = position.x;
y = position.y;
image_angle = velocity.get_direction();

