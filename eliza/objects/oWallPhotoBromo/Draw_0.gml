/// @description Insert description here
// You can write your code in this editor
draw_self();

if(distance_to_object(oCursor) <= 4 && oCursor.handMode){
	isInteractable = true;
	draw_set_color(c_white);
	draw_set_font(fnt_medium);
	draw_text(x, y + 5,"Inspect [lmb]");	
	//isPettable = true;
}else{
	isInteractable = false;	
}





