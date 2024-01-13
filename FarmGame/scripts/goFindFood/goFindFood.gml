// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function goFindFood(_animal,_food,_hunger_dist){
	
	var _max_index = 0;
	var _closest_dist = 1000;
	var _best_option = noone;
	
	//var _food_count = 0;
	if(object_exists(oGrassTuft)){
		
		with(oGrassTuft){
		    var _current_food_dist = point_distance(_animal.x, _animal.y, x, y);
		    if(_current_food_dist < _hunger_dist){
		        if(_current_food_dist < _closest_dist){
		            _best_option = id;  // Use 'id' to refer to the current oGrassTuft instance
		            _closest_dist = _current_food_dist;
		        }
		    }
		}
		if(_best_option != noone){
			show_debug_message("setting the best Option as output")
			show_debug_message("Best Option X: " + string(_best_option.x))
			show_debug_message("Animal X: " + string(_animal.x))
			var _food_dir = point_direction(_animal.x,_animal.y,_best_option.x,_best_option.y)
			
			show_debug_message("output Food Dist: " + string(_closest_dist))
			show_debug_message("output Food Direction: " + string(_food_dir))
			var _output = [_food_dir,_closest_dist];
			
			return _output;
		}else{
			//show_debug_message("didnt find anything better or we broke something")
			var _output = [-1,-1];
			return _output;
		}
	
	}
	
	else{
		show_debug_message("didnt find anything better or we broke something 2")
		var _output = [-1,-1];
		return _output;
	}
}

