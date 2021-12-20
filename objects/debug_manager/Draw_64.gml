/// @description Debug Manager


if (debug_on) {
	draw_set_color(c_red);
	draw_text(20, 30, "Total Ships: " + string(instance_number(ship_type)));
	draw_text(20, 50, "Object Type: " + object_get_name(ship_type));
} 