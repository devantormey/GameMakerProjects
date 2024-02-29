/// @description Insert description here
// You can write your code in this editor


var barDaddy = instance_nearest(x,y,innFurniture)
depth =  barDaddy.depth + 1;

if(isTalking){
	dialogue.displayText = true;
	if(keyboard_check_pressed( vk_escape ) ){
			//Quit Game
			isTalking = false;
			dialogue.displayText = false;
	}
	if(distance_to_object(oPlayer) >= talkDistance + 2){
		isTalking = false;
		dialogue.displayText = false;
	}
}