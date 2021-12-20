/// @description Array Flocker


//initialize variables
position = vector_array_create(x, y);
velocity = vector_array_create_random(3);
steering_forces = vector_array_create_zero();

max_speed = 3;
max_force = 0.1;


wander_angle = random(360);
wander_distance = 50;
wander_power = 40;
wander_change = 20;
