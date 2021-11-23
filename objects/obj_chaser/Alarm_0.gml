/// @description Chaser


target = instance_find(obj_wander_seek, irandom(instance_number(obj_wander_seek) - 1));
alarm[0] = room_speed * 3;