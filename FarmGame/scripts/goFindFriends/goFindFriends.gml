// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function goFindFriends(_actor,_friends,_friends_count,_enemies_count,_enemies){
	var _goto_dir = -1;
//match direction of friends
	if(_friends_count>0){
	
		//loop through friends and find common angle
		var _running_angle = 0;
		var _running_x = 0;
		var _running_y = 0;
		for(var i = 0; i<_friends_count; i++){
			_running_angle += _friends[i].direction;
			_running_x += _friends[i].x;
			_running_y += _friends[i].y;
		}
	
		_running_angle /= _friends_count;
		_running_x /= _friends_count;
		_running_y /= _friends_count;
	
	
		//debug my ass
		_goto_dir = point_direction(_actor.x,_actor.y,_running_x, _running_y);
		
	
	}

//dont be too close
	if(_enemies_count > 0){
	
		//loop through friends and find common angle
		var _running_x = 0;
		var _running_y = 0;
		for(var i = 0; i<_enemies_count; i++){
			_running_x += _enemies[i].x;
			_running_y += _enemies[i].y;
		}
	
		_running_x /= _enemies_count;
		_running_y /= _enemies_count;
	
		_goto_dir = point_direction(_running_x,_running_y,_actor.x,_actor.y);
		
		
		
	}
	
	return _goto_dir;


}