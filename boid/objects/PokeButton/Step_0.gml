/// @description Insert description here
// You can write your code in this editor


//we_pressed_food = false;


if(mouse_check_button_pressed(mb_left)){
	//if the click on me
	if(point_in_rectangle(mouse_x,mouse_y, x, y,x + 64,y + 64)){
		show_debug_message("you clicked in me!")
		//toggle image_index
		if(current_index = 1){
			show_debug_message("toggle off")
			current_index = 0;
			we_pressed_poke = false;
			
		}else{
			//current_index = 1;
			we_pressed_poke = true;
			FoodButton.we_pressed_food = false;
			AddFish.we_pressed_fish = false;
			show_debug_message("toggle on")
		}
	}
}

if(we_pressed_poke){
	current_index = 1;
}else{
	current_index = 0;
}



//image_index = current_index;
if(timer > 0){
	timer--;
}

if(!point_in_rectangle(mouse_x,mouse_y, x, y,x + 128,y + 128) && timer == 0){
	//timer = 20;
	if(image_alpha > .4){
		image_alpha -=.01;
	}
	image_index = current_index

}else{
	image_index = current_index
	image_alpha = 1;
	
	//timer = 100;
	
}