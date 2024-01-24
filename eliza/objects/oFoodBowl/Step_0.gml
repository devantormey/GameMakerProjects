/// @description Insert description here
// You can write your code in this editor


if(distance_to_object(oCursor) <= 4 && oCursor.handMode){
	if(isInteractable && mouse_check_button_pressed(mb_left)){
		//
		noFood = false;
	}
}

if(noFood){
	image_index = 0;
}else{
	image_index = 1;
}

depth = oSam.depth + 5;