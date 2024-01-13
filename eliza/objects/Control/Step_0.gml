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
