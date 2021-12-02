/// @description Flocker


//initialize variables
position = new vector(x, y);
velocity = new vector_random(3);
steering_forces = new vector_zero();

max_speed = 3;
max_force = 0.05;

wander_angle = random(360);
wander_distance = 60;
wander_power = 5;
wander_change = 20;

