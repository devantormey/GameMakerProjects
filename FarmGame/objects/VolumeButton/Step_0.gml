/// @description Insert description here
// You can write your code in this editor


we_pressed_volume = false;


if(mouse_check_button_pressed(mb_left)){
	//if the click on me
	if(point_in_rectangle(mouse_x,mouse_y, x, y,x + 64,y + 64)){
		show_debug_message("you clicked in me!")
		//toggle image_index
		if(current_index = 0){
			show_debug_message("toggle off")
			current_index = 1;
			oControl.VolumeLevel = 0;
			we_pressed_volume = true;
			
		}else{
			current_index = 0;
			oControl.VolumeLevel = 1;
			we_pressed_volume = true;
			show_debug_message("toggle on")
		}
	}
}



//image_index = current_index;
if(timer > 0){
	timer--;
}

if(!point_in_rectangle(mouse_x,mouse_y, x, y,x + 128,y + 128) && timer == 0){
	//timer = 20;
	if(image_alpha > 0){
		image_alpha -=.01;
	}
	image_index = current_index

}else{
	image_index = current_index
	image_alpha = 1;
	
	//timer = 100;
	
}