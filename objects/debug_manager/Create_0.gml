/// @description Debug Manager


ship_type_array = [
	obj_space_station,
	obj_wander_reynolds,
	obj_wander_perlin_noise,	
	obj_flocker,
	obj_flocker_single_behavior,
	obj_flocker_dithering,
	obj_flocker_dithering_skipping,
	obj_flocker_caching,
	obj_flocker_all,
	obj_random_dir,
	obj_random_dir_simple,
	obj_simple_ship,
	obj_array_flocker
]

position = 0;

ship_type = ship_type_array[position];
debug_on = true;
show_debug_overlay(debug_on);

