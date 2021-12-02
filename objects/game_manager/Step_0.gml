/// @description Game Manager


if (keyboard_check_pressed(ord("R"))) {
	game_restart();
}


if (keyboard_check_pressed(ord("Q"))) {
	game_end();
}


if (mouse_check_button(mb_right)) {
	instance_create_layer(mouse_x, mouse_y, "Ships", obj_flocker);
}