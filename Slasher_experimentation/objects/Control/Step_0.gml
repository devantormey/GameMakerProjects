/// @description Insert description here
// You can write your code in this editor

//if (keyboard_check_pressed(vk_f1)) {
//	instance_create_layer(oPlayer.x + random_range(40,200), oPlayer.y, "Instances", odummy);
//}

//if (keyboard_check_pressed(vk_f2)) {
//	var rand_angle = random_range(0,360)
//	var x_Dist = lengthdir_x(300,rand_angle);
//	var y_Dist = lengthdir_y(160,rand_angle);
	
//	var goblinEnemy = instance_create_layer(oPlayer.x + x_Dist, oPlayer.y + y_Dist, "Instances", oGoblin);
//	if (place_meeting(goblinEnemy.x, goblinEnemy.y, oWall)){
//		goblinEnemy.x += lengthdir_x(300,rand_angle);
//		goblinEnemy.y += lengthdir_y(160,rand_angle);
//	}
//}

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

//if(gamePaused || lootingChest ){window_set_cursor(cr_handpoint);}else{window_set_cursor(cr_none);}

//if(lootingChest){
//	oInventory.lootingInv = true;
//	window_set_cursor(cr_handpoint);
	
//}else{
//	oInventory.lootingInv = false;
//	//window_set_cursor(cr_none);
//}