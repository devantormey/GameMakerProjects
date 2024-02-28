/// @description Insert description here
// You can write your code in this editor

/// @description Insert description here
// You can write your code in this editor
var _hover = point_in_rectangle(mouse_x, mouse_y, x , y , x + sprite_width, y + sprite_height);
if(_hover){
	image_index = 1;
	if(mouse_check_button_pressed(mb_left)){
		room_goto(Room1);
		Control.notTitle = true;
		Control.notHome = false;
		Control.narattor_talking = true;
		show_debug_message("Setting the alarm because we pressed start button")
		oNarrator.alarm[0] = room_speed * 1;
		startClick = audio_play_sound(clickNoise, 1, false, 1);
	}
	
	
}else{
	image_index = 0;
}


