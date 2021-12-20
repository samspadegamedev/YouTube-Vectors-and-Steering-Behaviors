///Array Vector Script Functions


//various ways to create an vector array
function vector_array_create(_x, _y) {
	return [_x, _y];
}
	
function vector_array_create_zero() {
	return [0, 0];
}

function vector_array_create_random(_length = 1) {
	var _dir = random(360);
	return [lengthdir_x(_length, _dir), lengthdir_y(_length, _dir)];
}

function vector_array_create_lengthdir(_length, _dir) {
	return [lengthdir_x(_length, _dir), lengthdir_y(_length, _dir)];
}


//vector array manipulation
function vector_array_add(_array_vector_a, _array_vector_b) {
	gml_pragma("forceinline");
	_array_vector_a[@ 0] = _array_vector_a[ 0] + _array_vector_b[0];
	_array_vector_a[@ 1] = _array_vector_a[ 1] + _array_vector_b[1];
}

function vector_array_subtract(_array_vector_a, _array_vector_b) {
	gml_pragma("forceinline");
	_array_vector_a[@ 0] = _array_vector_a[ 0] - _array_vector_b[0];
	_array_vector_a[@ 1] = _array_vector_a[ 1] - _array_vector_b[1];
}

function vector_array_negate(_array_vector) {
	gml_pragma("forceinline");
	_array_vector[@ 0] = -_array_vector[0];
	_array_vector[@ 1] = -_array_vector[1];
}

function vector_array_multiply(_array_vector_a, _scalar) {
	gml_pragma("forceinline");
	_array_vector_a[@ 0] = _array_vector_a[ 0] * _scalar;
	_array_vector_a[@ 1] = _array_vector_a[ 1] * _scalar;
}

function vector_array_divide(_array_vector_a, _scalar) {
	gml_pragma("forceinline");
	_array_vector_a[@ 0] = _array_vector_a[ 0] / _scalar;
	_array_vector_a[@ 1] = _array_vector_a[ 1] / _scalar;
}

function vector_array_get_magnitude(_array_vector) {
	gml_pragma("forceinline");
	return point_distance(0, 0, _array_vector[0], _array_vector[1]);
}

function vector_array_get_direction(_array_vector) {
	gml_pragma("forceinline");
	return point_direction(0, 0, _array_vector[0], _array_vector[1]);
}

function vector_array_normalize(_array_vector) {
	gml_pragma("forceinline");
		if ((_array_vector[0] != 0) || (_array_vector[1] != 0)) {
			var _factor = 1/sqrt((_array_vector[0] * _array_vector[0]) + (_array_vector[1] * _array_vector[1]));
			_array_vector[@ 0] = _factor * _array_vector[0];
			_array_vector[@ 1] = _factor * _array_vector[1];	
		}
}

function vector_array_set_magnitude(_array_vector, _scalar) {
	gml_pragma("forceinline");
	vector_array_normalize(_array_vector);
	vector_array_multiply(_array_vector, _scalar);
}

function vector_array_limit_magnitude(_array_vector, _limit) {
	gml_pragma("forceinline");
	if (vector_array_get_magnitude(_array_vector) > _limit) {
		vector_array_set_magnitude(_array_vector, _limit);
	}
}
	
	
//overwrite and copy
function vector_array_overwrite(_array_vector_a, _array_vector_b) {
	_array_vector_a[@ 0] = _array_vector_b[0];
	_array_vector_a[@ 1] = _array_vector_b[1];
}

function vector_array_copy(_array_vector) {
	return [_array_vector[0], _array_vector[1]];
}




