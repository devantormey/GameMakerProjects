/// @description Insert description here
// You can write your code in this editor




if(gameOver == true ){
	
	if(keyboard_check_pressed( ord("Y") ) ){
		//Restart Game
		room_restart();
	}
	if(keyboard_check_pressed( ord("N") ) ){
		//Quit Game
		game_end();
	}
}

if(gamePaused || lootingChest ){window_set_cursor(cr_handpoint);}else{window_set_cursor(cr_none);}


if(notHome && keyboard_check_pressed(vk_escape) ){
		room_goto(Room1)
		notHome = false;
		window_set_cursor(cr_none);
		cursorRoom = false;
		leftHouseCount ++;
		
		switch(leftHouseCount){
			case 1:
				show_debug_message("setting the string index for our second message")
				oNarrator.currentStringIndex = 1;
				oNarrator.alarm[0] = room_speed * 1;
		}
	}
	
if(!notHome && notTitle){
	//oNarrator.displayText = false;
	if(sound1 != noone){
		audio_stop_sound(sound1);
		sound1 = noone;
	}
	if(sound2 != noone){
		audio_stop_sound(sound2);
		sound2 = noone;
	}
}

if(cursorRoom){
	window_set_cursor(cr_handpoint);
}

if(!notTitle){
	window_set_cursor(cr_handpoint);
}