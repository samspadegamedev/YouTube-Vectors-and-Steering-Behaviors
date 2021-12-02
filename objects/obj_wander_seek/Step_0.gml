/// @description Wander Seek


//steering forces
if (point_distance(x, y, obj_chaser.x, obj_chaser.y) < 150) {
	apply_force(evade_force(obj_chaser));
} else {
	apply_force(cohesion_force());
	apply_force(wander_force(), 0.7);
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


//an edge wrap script for use specifically with vectors
edge_wrap();

