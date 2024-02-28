/// @description Insert description here
// You can write your code in this editor

//Find Friends
var _friends = [];
var _friends_count = 0;
var _enemies = [];
var _enemies_count = 0;

with(oBoid){
	if(id != other.id){
		if(point_distance(x,y,other.x,other.y) < friends_dists){
			_friends[_friends_count] = id;
			_friends_count++;
		}
		if(point_distance(x,y,other.x,other.y) < enemy_dist){
			//found an enemy!
			_enemies[_enemies_count] = id;
			_enemies_count++;
		}
	}
}


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
	
	//move to average ange
	if(angle_difference(direction,_running_angle) > 0){
		direction -= angle_change_speed;
	}else{
		direction += angle_change_speed;
	}
	
	var _goto_dir = point_direction(x,y,_running_x, _running_y);
	//move to average ange
	if(angle_difference(direction,_goto_dir) > 0){
		direction -= angle_change_speed;
	}else{
		direction += angle_change_speed;
	}
	
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
	
	var _goto_dir = point_direction(x,y,_running_x, _running_y);
	//move to average ange
	if(angle_difference(direction,_goto_dir) > 0){
		direction += angle_change_speed;
	}else{
		direction -= angle_change_speed;
	}
	
}

// Stay on the screen
if(!point_in_rectangle(x,y,0,0,room_width,room_height)){
	var _goto_dir = point_direction(x,y,room_width/2, room_height/2);
	//move to average ange
	if(angle_difference(direction,_goto_dir) > 0){
		direction -= angle_change_speed;
	}else{
		direction += angle_change_speed;
	}
}

// if you friends list gets too big go faster
if(_friends_count > 5){
	var _goto_dir = point_direction(x,y,room_width/2, room_height/2);
	speed = 2;
	//move to average ange
	if(angle_difference(direction,_goto_dir) > 0){
		direction -= angle_change_speed;
	}else{
		direction += angle_change_speed;
	}
}else{
	speed = 1;
}

//if splash run away!!
var splashHappen = noone;
if(instance_exists(oRipple)){
	splashHappen = instance_nearest(x,y,oRipple);
	if(distance_to_object(splashHappen) < 10){
		var _goto_dir = point_direction(splashHappen.x,splashHappen.y,x,y)
		speed = 2;
		//move to average ange
		if(angle_difference(direction,_goto_dir) > 0){
			direction -= angle_change_speed*3;
		}else{
			direction += angle_change_speed*3;
		}
	}else{
		speed = 1;
	}
}

////if food run towards!!
//var foodPellet = noone;
//if(instance_exists(oFood)){
//	foodPellet = instance_nearest(x,y,oFood);
//	if(distance_to_object(foodPellet) < 200){
//		var _goto_dir = point_direction(x,y,foodPellet.x,foodPellet.y)
//		speed = 2;
//		//move to average ange
//		if(angle_difference(direction,_goto_dir) > 0){
//			direction -= angle_change_speed*3;
//		}else{
//			direction += angle_change_speed*3;
//		}
//	}else{
//		speed = 1;
//	}
//}

//set angle
image_angle = direction - 90;



