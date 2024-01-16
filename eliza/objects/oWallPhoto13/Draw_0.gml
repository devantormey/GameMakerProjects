/// @description Insert description here
// You can write your code in this editor
draw_self();

if(distance_to_object(oPlayer) <= 15){
	isInteractable = true;
	draw_set_color(c_white);
	draw_set_font(fnt_medium);
	draw_text(x, y,"Inspect [F]");	
	//isPettable = true;
}else{
	isInteractable = false;	
}





