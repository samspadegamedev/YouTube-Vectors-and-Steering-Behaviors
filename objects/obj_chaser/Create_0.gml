/// @description Chaser


//initialize variables
position = new vector(x, y);
velocity = new vector_zero();
steering_forces = new vector_zero();

max_speed = 4;
max_force = 0.1;

wander_angle = random(360);
wander_distance = 60;
wander_power = 5;
wander_change = 20;

target = instance_find(obj_wander_seek, irandom(instance_number(obj_wander_seek) - 1));
alarm[0] = room_speed * 3;