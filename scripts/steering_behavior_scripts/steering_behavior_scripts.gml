/// Steering Behavior Script Functions

function apply_force(_force, _weight = 1) {
	_force.multiply(_weight);
	steering_forces.add(_force);
}

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

function pursue_force(_inst) {
	var _vec = vector_copy(_inst.velocity);
	_vec.multiply(30);
	_vec.add(_inst.position);
	return seek_force(_vec.x, _vec.y);
}

function evade_force(_inst) {
	var _vec = vector_copy(_inst.velocity);
	_vec.multiply(30);
	_vec.add(_inst.position);
	return flee_force(_vec.x, _vec.y);
}

function arrive_force(_x, _y, _slowing_radius) {	
	var _vec = new vector(_x, _y);
	_vec.subtract(position);
	
	var _dist = _vec.get_magnitude();
	if (_dist > _slowing_radius) {
		_vec.set_magnitude(max_speed);	
	} else {
		_vec.set_magnitude(max_speed * (_dist/_slowing_radius));
	}

	_vec.subtract(velocity);
	_vec.limit_magnitude(max_force);
	return _vec;
}

function wander_force() {

	var _vec = vector_copy(velocity);
	_vec.set_magnitude(wander_distance);
	_vec.add(new vector_lengthdir(wander_power, image_angle + wander_angle));
	_vec.limit_magnitude(max_force);

	wander_angle +=  random_range(-wander_change, wander_change);

	return _vec;

}

function align_force(_obj = object_index, _max_dist = 200) {
	
	var _vec, _count;
	_vec = new vector_zero();
	_count = 0;
	
	with (_obj) {
		
		if (id == other.id) continue;
		if (point_distance(position.x, position.y, other.position.x, other.position.y) > _max_dist) continue;
		
		_vec.add(velocity);
		_count += 1;
	}
	
	if (_count > 0) {
		_vec.set_magnitude(max_force);
	}
	
	return _vec;

}

function cohesion_force(_obj = object_index, _max_dist = 200) {
	
	var _vec, _count;
	_vec = new vector_zero();
	_count = 0;
	
	with (_obj) {
		
		if (id == other.id) continue;
		if (point_distance(position.x, position.y, other.position.x, other.position.y) > _max_dist) continue;
		
		_vec.add(position);
		_count += 1;
	}
	
	if (_count > 0) {
		_vec.divide(_count);
		_vec = seek_force(_vec.x, _vec.y);
	}
	
	return _vec;

}

function separation_force(_obj = object_index, _max_dist = 200) {
	
	var _vec, _count, _vec_to;
	_vec = new vector_zero();
	_count = 0;
	
	with (_obj) {
		
		if (id == other.id) continue;
		if (point_distance(position.x, position.y, other.position.x, other.position.y) > _max_dist) continue;
		
		_vec_to = vector_subtract(other.position, position);
		var _dist = min(_vec_to.get_magnitude(), 200);
		var _scale = (1 - (_dist/200));
		_vec_to.multiply(_scale);
		_vec.add(_vec_to);
		_count += 1;
	}
	
	if (_count > 0) {
		_vec.set_magnitude(max_force);
	}
	
	return _vec;

}




