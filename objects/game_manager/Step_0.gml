/// @description Game Manager


if (keyboard_check_pressed(ord("R"))) {
	game_restart();
}


if (keyboard_check_pressed(ord("Q"))) {
	game_end();
}



if (keyboard_check_pressed(ord("F"))) {
	window_set_position(0, 0);
}

