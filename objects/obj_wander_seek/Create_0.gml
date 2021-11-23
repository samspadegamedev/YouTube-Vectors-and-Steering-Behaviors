/// @description Wander Seek


//initialize variables
position = new vector(x, y);
velocity = new vector_random(2);
steering_forces = new vector_zero();

max_speed = 4;
max_force = 0.2;

wander_angle = random(360);
wander_distance = 100;
wander_power = 20;
wander_change = 20;