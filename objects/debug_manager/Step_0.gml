/// @description Debug Manager



if (mouse_check_button_pressed(mb_left)) {
	instance_create_layer(mouse_x, mouse_y, "Ships", ship_type);
}

if (mouse_check_button(mb_right)) {
	
	var _amount = mouse_check_button(mb_left) ? 10 : 1;
	_amount = keyboard_check(vk_control) ? 100 : _amount;

	repeat (_amount) {
		instance_create_layer(mouse_x, mouse_y, "Ships", ship_type);
	}
	
}

if (keyboard_check_pressed(vk_enter)) {
	debug_on = !debug_on;
	show_debug_overlay(debug_on);
}



if (keyboard_check_pressed(vk_space)) {
	instance_destroy(ship_type);
}


if (keyboard_check_pressed(vk_shift)) {
	
	instance_destroy(ship_type);
	position = (position + 1) mod (array_length(ship_type_array));
	ship_type = ship_type_array[position];

}

