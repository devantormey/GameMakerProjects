// Step event of oSword
if(Control.gameOver == true){
	visible = false;
	return;
}

//if we are paused dont do nothin!
if(Control.gamePaused == true){return;}


//if(oPlayer.isLooting){return;}

if (isEquipped == false) {
	visible = false;
	//instance_destroy();
    //solid = false;
	return;
}

// Mouse angle for drawing the weapon
var current_mouse_angle = point_direction(x, y + swordYOffset, oCursor.x, oCursor.y);

var angular_change = current_mouse_angle - prev_mouse_angle;

wpn_speed = angular_change;
// Ensure that angular_change is between -180 and 180 degrees

angular_change = (angular_change + 180) mod 360 - 180;
//show_debug_message("Angular Change: " + string(angular_change))

//clamp the angular change so the swing doesn't get crazy
angular_change = clamp(angular_change,-45,45);

// set the draw distance for the sword/player
var distance_to_sword = 9; // Change this value to what fits your sprite sizes
var distance_from_player = 9;

// if we aren't attacking don't swing the sword.
if(!owner.attacking){
	image_angle = current_mouse_angle;
	
}

// Set the sword's position
x = oPlayer.x   + lengthdir_x(distance_to_sword, current_mouse_angle);
y = oPlayer.y  + lengthdir_y(distance_to_sword, current_mouse_angle);

// Check if this sword has an owner and if that owner is using primary attack
if (owner != noone && owner.attacking && owner.primaryAttack && primaryAttack_counter > 0) {
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
	swingingFlag = true;
	
	// Swing the sword
	image_angle -= primaryAttack_speed;
	
	// add how much the mouse has moved so the sword "follows" the mouse
    image_angle += angular_change;
	
	// Decrement the counter
    primaryAttack_counter--;

	// Check if the attack is finished
    if (primaryAttack_counter <= 0) {
		//stop the attack flag
        owner.attacking = false;
		//stop the primary attack flag (left click)
		owner.primaryAttack = false;	
		//reset the attack timer/counter
		primaryAttack_counter = 180/primaryAttack_speed;
		
		//set the damage to 0 in case of accidental collision.
		damage = 0;
		
		//stop the attack flag (this actually might not be necessary as we can just use oPlayer.attacking or oSword.attacking.
		swingingFlag = false;
		ds_list_clear(line_points);
		critAcheivedFlag = false;
        // Optional other clean up (set angle, trigger "reload" animation etc)
    }	
}


// Check if we have an owner and if that owner is secondary attacking
if (owner != noone && owner.attacking && owner.secondaryAttack && secondaryAttack_counter > 0) {	
	//show_debug_message("Triggering Swing Animations")
	damage = 0;
	blocking = true;
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
		blocking = false;
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
// Store the current mouse angle for the next step
prev_mouse_angle = current_mouse_angle;

//set the Depth
depth = owner.depth - owner.face;

