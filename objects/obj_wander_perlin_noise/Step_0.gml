/// @description Wander Perlin Noise


//perlin noise
perlin_position += increment;


//steering forces
var _angle = (perlin_noise(perlin_position) * wander_power) + image_angle;
steering_forces.add(new vector_lengthdir(max_force, _angle));

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

