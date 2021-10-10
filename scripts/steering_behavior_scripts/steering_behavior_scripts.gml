/// Script Functions


function seek_force(_x, _y) {	
	var _vec = new vector(_x, _y);
	_vec.subtract(position);
	_vec.set_magnitude(max_speed);
	_vec.subtract(velocity);
	_vec.limit_magnitude(max_force);
	return _vec;
}



function flee_force(_x, _y) {	
	var _vec = new vector(_x, _y);
	_vec.subtract(position);
	_vec.set_magnitude(max_speed);
	_vec.negate();
	_vec.subtract(velocity);
	_vec.limit_magnitude(max_force);
	return _vec;
}




