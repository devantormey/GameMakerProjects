/// @description Insert description here
// You can write your code in this editor

event_inherited();


draw_self();


if(distance_to_object(oCursor) <= 4 && oCursor.handMode){
	isInteractable = true;
	draw_set_color(c_white);
	draw_set_font(fnt_medium);
	draw_text(x - 8, y + 17,"Poke [lmb]");	
	//isPettable = true;
}else{
	isInteractable = false;	
}

if (displayText) {
	draw_set_color(c_white);
	draw_set_font(fnt_default);
    draw_text(x - 32, y + 76, currentText);
}

