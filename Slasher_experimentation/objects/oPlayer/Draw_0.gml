/// @description Insert description here
// You can write your code in this editor


percent += percentRate;
if(percent > 1){percent = 0;}

var hand_x = 0;
var hand_y = 0;
//behind body hand
if(face == 1){
	//left Hand Behind Body
	if( abs(xspeed) > 0 || abs(yspeed) > 0){
		hand_x = x + 3 + animcurve_channel_evaluate(handCurve_x,percent);
		hand_y = y + 3 +  animcurve_channel_evaluate(handCurve_y,percent);
	}else{
		hand_x = x + 3 
		hand_y = y + 3
	}
	draw_sprite(handSprite, image_index, hand_x, hand_y);
}else{
	//right Hand Behind Body
		if( abs(xspeed) > 0 || abs(yspeed) > 0){
		hand_x = x - 8 - animcurve_channel_evaluate(handCurve_x,percent);
		hand_y = y + 3 +  animcurve_channel_evaluate(handCurve_y,percent);
	}else{
		hand_x = x - 8
		hand_y = y + 3
	}
	if(currentWeapon == noone){
		draw_sprite(handSprite, image_index, hand_x, hand_y);
	}
}


draw_self();

//in front of body hand
if(face == 1){
	//Right Hand In front of body
	if( abs(xspeed) > 0 || abs(yspeed) > 0){
		hand_x = x - 10 - animcurve_channel_evaluate(handCurve_x,percent);
		hand_y = y + 4 +  animcurve_channel_evaluate(handCurve_y,percent);
	}else{
		hand_x = x - 10
		hand_y = y + 4
	}
	if(currentWeapon == noone){
		draw_sprite(handSprite, image_index, hand_x, hand_y);
	}
}else{
	//Left hand in front of body
		if( abs(xspeed) > 0 || abs(yspeed) > 0){
		hand_x = x + 4 + animcurve_channel_evaluate(handCurve_x,percent);
		hand_y = y + 3 +  animcurve_channel_evaluate(handCurve_y,percent);
	}else{
		hand_x = x + 4 
		hand_y = y + 4
	}
	draw_sprite(handSprite, image_index, hand_x, hand_y);
}



draw_sprite_ext(headSprite, 0, x, y + 2 + bobOffset,face,1,0,c_white,1);