/// Array Steering Behavior Script Functions

function vector_array_apply_force(_force, _weight = 1) {
	vector_array_multiply(_force, _weight);
	vector_array_add(steering_forces, _force);
}

function vector_array_seek_force(_x, _y) {	
	var _vec = vector_array_create(_x, _y);
	vector_array_subtract(_vec, position);
	vector_array_set_magnitude(_vec, max_speed);
	vector_array_subtract(_vec, velocity);
	vector_array_limit_magnitude(_vec, max_force);
	return _vec;
}

function vector_array_flee_force(_x, _y) {	
	var _vec = vector_array_create(_x, _y);
	vector_array_subtract(_vec, position);
	vector_array_set_magnitude(_vec, max_speed);
	vector_array_negate(_vec);
	vector_array_subtract(_vec, velocity);
	vector_array_limit_magnitude(_vec, max_force);
	return _vec;
}


function vector_array_wander_force() {

	var _vec = vector_array_copy(velocity);
	vector_array_set_magnitude(_vec, wander_distance);
	vector_array_add(_vec, vector_array_create_lengthdir(wander_power, image_angle + wander_angle));
	vector_array_limit_magnitude(_vec, max_force);

	wander_angle +=  random_range(-wander_change, wander_change);

	return _vec;

}



function vector_array_align_force(_obj = object_index, _max_dist = 200) {
	
	var _vec, _count;
	_vec = vector_array_create_zero();
	_count = 0;
	
	with (_obj) {
		
		if (id == other.id) continue;
		if (point_distance(position[0], position[1], other.position[0], other.position[1]) > _max_dist) continue;
		
		vector_array_add(_vec, velocity);
		_count += 1;
	}
	
	if (_count > 0) {
		vector_array_set_magnitude(_vec, max_force);
	}
	
	return _vec;

}

function vector_array_cohesion_force(_obj = object_index, _max_dist = 200) {
	
	var _vec, _count;
	_vec = vector_array_create_zero();
	_count = 0;
	
	with (_obj) {
		
		if (id == other.id) continue;
		if (point_distance(position[0], position[1], other.position[0], other.position[1]) > _max_dist) continue;
		
		vector_array_add(_vec, position);
		_count += 1;
	}
	
	if (_count > 0) {
		vector_array_divide(_vec, _count);
		_vec = vector_array_seek_force(_vec[0], _vec[1]);
	}
	
	return _vec;

}

function vector_array_separation_force(_obj = object_index, _max_dist = 200) {
	
	var _vec, _count, _vec_to;
	_vec = vector_array_create_zero();
	_count = 0;
	
	with (_obj) {
		
		if (id == other.id) continue;
		if (point_distance(position[0], position[1], other.position[0], other.position[1]) > _max_dist) continue;
		
		_vec_to = vector_array_copy(other.position);
		vector_array_subtract(_vec_to, position);
		var _dist = min(vector_array_get_magnitude(_vec_to), 200);
		var _scale = (1 - (_dist/200));
		vector_array_multiply(_vec_to, _scale);
		vector_array_add(_vec, _vec_to);
		_count += 1;
	}
	
	if (_count > 0) {
		vector_array_set_magnitude(_vec, max_force);
	}
	
	return _vec;

}

