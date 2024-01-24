/// @description Insert description here
// You can write your code in this editor
if(point_distance(x,y,mouse_x,mouse_y) < 25){
	image_index = 1;
	if(mouse_check_button_pressed(mb_left)){
		room_goto(boatGame);
		Control.notHome = true;			
	}
	
	
}else{
	image_index = 0;
}

