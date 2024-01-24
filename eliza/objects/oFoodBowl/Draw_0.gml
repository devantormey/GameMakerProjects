/// @description Insert description here
// You can write your code in this editor

draw_self();


if(distance_to_object(oCursor) <= 4 && oCursor.handMode){
	isInteractable = true;
	draw_set_color(c_black);
	draw_set_font(fnt_small);
	draw_text(x - 8, y + 17,"Feed Moo [lmb]");	
	//isPettable = true;
}else{
	isInteractable = false;	
}
