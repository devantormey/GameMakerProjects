/// @description Insert description here
// You can write your code in this editor
if( point_in_rectangle(mouse_x,mouse_y,x,y,x+sprite_width,y + sprite_height) ){
	hover = true;
}else{
	hover = false;
}


if(!hover){
	image_index = 0;
}else{
	image_index = 1;
}

