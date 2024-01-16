/// @description Insert description here
// You can write your code in this editor

if(distance_to_object(oPlayer) <= 15){
	if(isInteractable && keyboard_check_pressed(ord("F")) ){
		room_goto(bromoPhoto);
		Control.notHome = true;
	}
}




