/// @description Insert description here
// You can write your code in this editor


draw_self();
if(oPlayer.y < y){
	depth = oPlayer.depth - 5;
}else{
	depth = oPlayer.depth + 5;
}

if(distance_to_object(oPlayer) <= 10){
	draw_set_color(c_black);
	draw_set_font(fnt_default);
	draw_text(x - 5, y - 40,"Pet! [F]");	
	isPettable = true;
}

