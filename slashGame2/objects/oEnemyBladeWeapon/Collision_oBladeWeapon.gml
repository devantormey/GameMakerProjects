/// @description Insert description here
// You can write your code in this editor
if (owner.attacking && owner.primaryAttack && other.blocking && !gotBlocked){
	//if we collide with the players weapon while they are blocking what happens?
	//stop the attack
	//owner.attacking = false;
	//owner.primaryAttack = false;
	//owner.attackFinished = true;
	
	gotBlocked = true;
	gotBlockedCounter = 15;
	original_x = x;
	original_y = y;
	
	play_block_sound();
	
	var tipAngle = image_angle + 90;
	if (tipAngle >= 360){
	    tipAngle -= 360;
	}

	if (tipAngle < 0){
	    tipAngle += 360;
	}

	var tip_x = x + lengthdir_x(weapon_length - 4, tipAngle); // Adjust weapon_length as needed
	var tip_y = y + lengthdir_y(weapon_length - 4, tipAngle);
	
	instance_create_depth(tip_x, tip_y, oPlayer.depth - 5, oSpark);
	
	other.secondaryAttack_counter = 3;
	
}



