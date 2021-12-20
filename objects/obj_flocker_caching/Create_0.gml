/// @description Caching Flocker


//initialize variables
position = new vector(x, y);
velocity = new vector_random(3);
steering_forces = new vector_zero();

max_speed = 3;
max_force = 0.1;

populate_ship_array = function(_obj = object_index, _align_dist = 200, _cohesion_dist = 200, _separation_dist = 200) {

	ship_align_array = [];
	ship_cohesion_array = [];
	ship_separation_array = [];
	

	with (_obj) {
		
		if (id == other.id) continue;
		
		var _dist = point_distance(position.x, position.y, other.position.x, other.position.y);
		
		if (_dist < _align_dist) {
			array_push(other.ship_align_array, id);
		}
		if (_dist < _cohesion_dist) {
			array_push(other.ship_cohesion_array, id);
		}
		if (_dist < _separation_dist) {
			array_push(other.ship_separation_array, id);
		}
		
	}	
	
}

//start it randomly so that ships won't all run on the same step
alarm[0] = irandom(30); 
