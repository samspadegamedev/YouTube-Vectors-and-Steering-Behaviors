/// @description Seeker 


//steering forces
if (keyboard_check(vk_space)) {
	steering_force.add(flee_force(mouse_x, mouse_y));
} else {
	steering_force.add(seek_force(mouse_x, mouse_y));
}

//update vectors
velocity.add(steering_force);
velocity.limit_magnitude(max_speed);
position.add(velocity);

steering_force.set(0, 0);


//update built in variables
x = position.x;
y = position.y;
image_angle = velocity.get_direction();

