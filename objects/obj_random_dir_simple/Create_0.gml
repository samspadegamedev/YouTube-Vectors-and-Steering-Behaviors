/// @description Random Dir Simple


//initialize variables
position = new vector(x, y);
velocity = new vector_random(3);
steering_forces = new vector_zero();

max_speed = 3;
max_force = 0.1;

image_angle = velocity.get_direction();

