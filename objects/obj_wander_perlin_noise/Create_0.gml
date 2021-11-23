/// @description Wander Perlin Noise


//initialize variables
position = new vector(x, y);
velocity = new vector_random(3);
steering_forces = new vector_zero();

max_speed = 3;
max_force = 0.1;


perlin_position = random(10000);
increment = 0.02;
wander_power = 200;

