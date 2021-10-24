/// @description Seek Flee 


//steering forces
if (keyboard_check(vk_space)) {
	steering_forces.add(flee_force(obj_seeker.x, obj_seeker.y));
} else {
	steering_forces.add(seek_force(obj_seeker.x, obj_seeker.y));
}


//update vectors
velocity.add(steering_forces);
velocity.limit_magnitude(max_speed);
position.add(velocity);

steering_forces.set(0, 0);


//update built in variables
x = position.x;
y = position.y;
image_angle = velocity.get_direction();

