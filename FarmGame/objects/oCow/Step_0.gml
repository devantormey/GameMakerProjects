/// @description Insert description here
// You can write your code in this editor

//set our sprite index to walking if we are walking
if(speed > 0){
	sprite_index = sCowWalk;
}else{
	sprite_index = sCowIdle;
}

//we have 4 things we can be doing,



//Find friends, go towards our friends
var _friends = [];
var _friends_count = 0;
var _enemies = [];
var _enemies_count = 0;

with(oCow){
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

//check for nearby food
var _food_search_array = []
//look for food
show_debug_message("looking for food")
_food_search_array = goFindFood(id,oGrassTuft,hunger_dist);
//show_debug_message("Food output: [" + string(_food_search_array[0]) + ", " + string(_food_search_array[1]) + "]");

if(_food_search_array[0] = -1){ // if we didnt find food
	show_debug_message("didnt find food, looking for friends")
	//look for friends
	var _friend_search_result = goFindFriends(id,_friends,_friends_count,_enemies_count,_enemies);
	
	if(_friend_search_result == -1){ //we didnt find friends
		//show_debug_message("didnt find friends, wandering")
		//wander
		wanderTimer--;
		if(wanderTimer <= 0){
			//direction = irandom(359)
			var _whip_around = choose(0,1,2,3,4,5);
		
	
			if(_whip_around > 3){
				speed = walkSpeed;
				direction = irandom(359);
			}else{
				speed = 0;
			}
		wanderTimer = 100;
		}
	}else{
		//goto your friends!
		show_debug_message("found friends going over");
		speed = runSpeed
		if(angle_difference(direction,_friend_search_result) > 0){
			direction -= angle_change_speed;
		}else{
			direction += angle_change_speed;
		}
		
	}
}else{
	//show_debug_message("found Food moving towards food!");
	var _food_dir = _food_search_array[0];
	//show_debug_message("food distance: ");
	if(_food_search_array[1] > 2){
		speed = walkSpeed
	}else{
		speed = 0;
	}
	if(angle_difference(direction,_food_dir) > 0){
		direction -= angle_change_speed;
	}else{
		direction += angle_change_speed;
	}
		
}





// Stay on the screen
if(!point_in_rectangle(x,y,0,0,room_width,room_height)){
	show_debug_message("wandered outside");
	var _goto_dir = point_direction(x,y,room_width/2, room_height/2);
	speed = runSpeed
	//move to average ange
	if(angle_difference(direction,_goto_dir) > 0){
		direction -= angle_change_speed;
	}else{
		direction += angle_change_speed;
	}
}


//if splash run away!!
//var splashHappen = noone;
//if(instance_exists(oRipple)){
//	splashHappen = instance_nearest(x,y,oRipple);
//	if(distance_to_object(splashHappen) < 100){
//		var _goto_dir = point_direction(splashHappen.x,splashHappen.y,x,y)
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

// Look for food!
//var foodPellet = noone;
//if(instance_exists(oGrassTuft)){
//	foodPellet = instance_nearest(x,y,oGrassTuft);
//	if(distance_to_object(foodPellet) < 200){
//		var _goto_dir = point_direction(x,y,foodPellet.x,foodPellet.y)
//		speed = runSpeed;
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


//move to average ange
//if(angle_difference(direction,current_dir) > 0){
//	direction -= angle_change_speed;
//}else{
//	direction += angle_change_speed;
//}

//set angle
show_debug_message("Direction: " + string(direction))
if(direction > 90 || direction < 270 ){
	image_xscale = 1;
}else{image_xscale = -1;}
//image_angle = direction - 90;
//set color
//if(_friends_count > 0){
//	image_index = 1;
//}else{
//	image_index = 0;
//}



