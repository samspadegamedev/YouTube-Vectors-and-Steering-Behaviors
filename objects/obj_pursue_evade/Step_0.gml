/// @description Pursue Evade 


//steering forces
if (keyboard_check(vk_space)) {
	steering_forces.add(evade_force(obj_seeker));
} else {
	steering_forces.add(pursue_force(obj_seeker));
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

