// Step event of oSword
if(owner.charHealth <=0){
	instance_destroy();
}
if(Control.gameOver == true){
	visible = false;
	return;
}

//if we are paused dont do nothin!
if(Control.gamePaused == true){return;}


if(oPlayer.isLooting){return;}

if (isEquipped == false) {
	visible = false;
	//instance_destroy();
    solid = false;
	return;
}

// Mouse angle for drawing the weapon
var current_mouse_angle = point_direction(x, y + swordYOffset, owner.target.x, owner.target.y);

var angular_change = current_mouse_angle - prev_mouse_angle;

wpn_speed = angular_change;
// Ensure that angular_change is between -180 and 180 degrees

angular_change = (angular_change + 180) mod 360 - 180;
//show_debug_message("Angular Change: " + string(angular_change))

//clamp the angular change so the swing doesn't get crazy
angular_change = clamp(angular_change,-45,45);



// if we aren't attacking don't swing the sword.
if(!owner.attacking && owner.attackDelay <= 10){
	image_angle = current_mouse_angle;
	
}


if (gotBlocked) {
	damage = 0;
	
	percent += 1/30;
	//var positionInCurve = ;
    // Update the arc angle
    arc_angle = animcurve_channel_evaluate(blockAnimCurve,percent);
	
    // Calculate the new position
	var player_direction = point_direction(x,y,owner.x,owner.y)
    x = original_x //- lengthdir_x(distance_to_sword, arc_angle);
    y = original_y //- lengthdir_y(distance_to_sword, arc_angle);

    // Update rotation
    image_angle += arc_angle;

    // Condition to end the blocked state, e.g., when the angle reaches a certain point
    if (percent >= 1) { // Adjust as needed
		//end blocking
        gotBlocked = false;
		percent = 0;
		arc_angle = 0;
		//stop the attacking
		owner.attacking = false;
		owner.primaryAttack = false;
		owner.attackFinished = true;
		owner.attackFinished = true;
		
        // Reset position, angle, etc., as necessary
    }
	return;
}else{
	// Set the sword's position
	 //+ lengthdir_x(distance_to_sword, current_mouse_angle)
	 //+ lengthdir_y(distance_to_sword, current_mouse_angle)
	x = owner.x + sword_offset_x[owner.face];
	y = owner.y + sword_offset_y[owner.face];
	

}

//if(gotBlocked){
//	gotBlockedCounter--;
//	//image_angle += primaryBlockSpeed;
//	var slide_x = lengthdir_x(1, current_mouse_angle + 90);
//    var slide_y = lengthdir_y(1, current_mouse_angle + 90);
//	x = x- lengthdir_x(2, current_mouse_angle) + slide_x;
//	y = y - lengthdir_y(2, current_mouse_angle) + slide_y;
//	if(gotBlockedCounter <= 0){
//		gotBlocked = false;
//		owner.attacking = false;
//		owner.primaryAttack = false;
//		owner.attackFinished = true;
//	}
//	return;

// Check if this sword has an owner and if that owner is using primary attack
if (owner != noone && owner.attacking && owner.primaryAttack && primaryAttack_counter > 0 && !gotBlocked) {
	
	swingingFlag = true;
	
	// Swing the sword
	
	
	var _swing_multiplier = animcurve_channel_evaluate(swingAnimCurve,arcSwingPercent);
	image_angle -= primaryAttack_speed*_swing_multiplier;
	arcSwingPercent += arcSwingPercentChange;
	// add how much the mouse has moved so the sword "follows" the mouse
    image_angle += angular_change;
	wpn_speed = angular_change + primaryAttack_speed*_swing_multiplier;
	// Decrement the counter
	if(abs(wpn_speed) > critSpeed){
		damage = primaryDamage*2;	
		show_debug_message("Crit Speed Achieved: " + string(wpn_speed))
		if(!critAcheivedFlag){
			play_swing_sound();
			critAcheivedFlag = true;
		}
	}else{
		damage = primaryDamage;	
	}
	
	
    primaryAttack_counter--;
	if(arcSwingPercent == 1){
		arcSwingPercent = 0;
		primaryAttack_counter  = 0;
	}
	// Check if the attack is finished
    if (primaryAttack_counter <= 0) {
		//stop the attack flag
        owner.attacking = false;
		//stop the primary attack flag (left click)
		owner.primaryAttack = false;	
		//reset the attack timer/counter
		primaryAttack_counter = totalAttackTimer;
		
		//set the damage to 0 in case of accidental collision.
		damage = 0;
		
		//stop the attack flag (this actually might not be necessary as we can just use owner.attacking or oSword.attacking.
		swingingFlag = false;
		ds_list_clear(line_points);
		critAcheivedFlag = false;
		owner.attackFinished = true;
		returnSwordFlag = true;
		arcSwingPercent = 0;
		critAcheivedFlag = false;
        // Optional other clean up (set angle, trigger "reload" animation etc)
    }	
}


// Check if we have an owner and if that owner is secondary attacking
if (owner != noone && owner.attacking && owner.secondaryAttack && secondaryAttack_counter > 0 && !gotBlocked) {	
	//show_debug_message("Triggering Swing Animations")
	damage = 0;
	swingingFlag = true;
	// Swing the sword
	if(firstIterationFlag){
		//image_angle += 20;
		
		// Set the distance for the sword to be from the player
		 // This is the distance you want the sword to be from the player

		// Set the sword's position
		x = x + lengthdir_x(distance_from_player, current_mouse_angle);
		y = y + lengthdir_y(distance_from_player, current_mouse_angle);

		firstIterationFlag = false;
	}
	// Decrement the counter
    secondaryAttack_counter--;
	x = x + lengthdir_x(distance_from_player, current_mouse_angle);
	y = y + lengthdir_y(distance_from_player, current_mouse_angle);
	image_angle = current_mouse_angle;
	// Check if the attack is finished
    if (secondaryAttack_counter <= 0) {
        owner.attacking = false;
		owner.secondaryAttack = false;		
        // optionally reset the sword angle or perform any other cleanup here
		secondaryAttack_counter = 180/secondaryAttack_speed;
		damage = 0;
		swingingFlag = false;
		firstIterationFlag = true;
		ds_list_clear(line_points);
    }
	
}
// If not attacking, the sword can be hidden or follow the player without swinging
visible = true; // or handle idle position/state

//Weapon Effects code
if(owner != noone && owner.attacking && owner.primaryAttack){
	// we need a rotated angle for the tip
	var tipAngle = image_angle + 90;
	if (tipAngle >= 360){
	    tipAngle -= 360;
	}

	if (tipAngle < 0){
	    tipAngle += 360;
	}

	var tip_x = x + lengthdir_x(weapon_length, tipAngle); // Adjust weapon_length as needed
	var tip_y = y + lengthdir_y(weapon_length, tipAngle);

	//create the variable for drawing the effect
	var line_point = {x: tip_x, y: tip_y, alpha: 1};
	ds_list_add(line_points, line_point);
}

//if we were just swung return angle to origional
if(owner.attackDelay > 10 && !owner.attacking){
	if(abs(angle_difference(owner.attackAimDir,image_angle)) > 10  && returnSwordFlag ){
		if(owner.attackAimDir > image_angle){
			image_angle += returnSpeed;
		}else{
			image_angle -= returnSpeed;
		}
	}else{
		returnSwordFlag = false;
	}
	if(!returnSwordFlag){
		image_angle = current_mouse_angle;
	}
}

// Store the current mouse angle for the next step
prev_mouse_angle = current_mouse_angle;