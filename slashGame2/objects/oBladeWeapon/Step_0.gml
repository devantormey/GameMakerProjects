// Step event of oSword
if(Control.gameOver == true){
	visible = false;
	return;
}

//if we are paused dont do nothin!
if(Control.gamePaused == true){return;}


if(oPlayer.isLooting){return;}

if (isEquipped = false) {
	visible = false;
    solid = false;
	return;
}

var current_mouse_angle = point_direction(x, y + swordYOffset, oCursor.x, oCursor.y);

var angular_change = current_mouse_angle - prev_mouse_angle;

// Ensure that angular_change is between -180 and 180 degrees

angular_change = (angular_change + 180) mod 360 - 180;
//show_debug_message("Angular Change: " + string(angular_change))

//clamp the angular change so the swing doesn't get crazy
angular_change = clamp(angular_change,-5,5);

// set the draw distance for the sword/player
var distance_to_sword = 8; // Change this value to what fits your sprite sizes
var distance_from_player = 15;

// if we aren't attacking don't swing the sword.
if(!owner.attacking){
	image_angle = current_mouse_angle;
	//show_debug_message("notAttacking")
	
}else{
	//show_debug_message("attacking")
}

// Set the sword's position
x = oPlayer.x + lengthdir_x(distance_to_sword, current_mouse_angle);
y = oPlayer.y + swordYOffset + lengthdir_y(distance_to_sword, current_mouse_angle);

// Check if this sword has an owner and if that owner is using primary attack
if (owner != noone && owner.attacking && owner.primaryAttack && primaryAttack_counter <= maxCounter) {
	damage = primaryDamage;	
	swingingFlag = true;
	

	// Calculate target angle towards cursor
	var target_angle = point_direction(x, y + swordYOffset, oCursor.x, oCursor.y);
	// Calculate angular change needed from current angle to target angle
	
	//this accounts for the visual angle of the sprite.
	var sword_angle = image_angle;
	sword_angle = sword_angle - 90;
	if (sword_angle < 0){
		sword_angle = 360 - abs(sword_angle) ;
	}
	
	var angular_difference = angle_difference(sword_angle, target_angle);
	
	// Define base values for the parabolic function parameters
	var base_a = -2; // Base value for the 'a' coefficient
	var base_b = 0; // Base value for the 'b' coefficient
	var c = 2; // Starting value of the swing speed factor

	// Adjust 'a' and 'b' based on the mass
	// Here, the effect of mass is to make 'a' more negative (steeper parabola) as the mass increases
	var mass_effect_coefficient = .1;
	var a = base_a - mass_effect_coefficient * mass; 
	var b = base_b; // You can also make this dependent on mass if needed
	
	var normalized_time = (maxCounter - primaryAttack_counter) / maxCounter;
	
	
	// Calculate the swing speed factor using the mass-adjusted parabolic function
	var swing_speed_factor = a * normalized_time * normalized_time + b * normalized_time + c;
	
	
	// Clamp the swing_speed_factor to prevent negative values
	swing_speed_factor = max(swing_speed_factor, 0);

	
	// Apply the swing speed factor to the actual swing speed
	var actual_swing_speed = base_swing_speed * swing_speed_factor / (1 + mass * mass_effect_coefficient);
	
	//show_debug_message("actual_swing_speed: " + string(actual_swing_speed));
	
		// Swing the sword towards the target angle
	if (abs(angular_difference) < 165 && attackFinishedFlag == false) {
	    image_angle = image_angle + (sign(angular_difference) * actual_swing_speed)  + angular_change;
		
		show_debug_message("total swing speed: " + string( sign(angular_difference) * actual_swing_speed  + angular_change ) );
		
		damage = mass * actual_swing_speed  + angular_change ;
		damage = damage*damage/10;
		damage = min(damage,maxDamage);
		if(damage<=fastDammage){damage=fastDammage;}
		show_debug_message("damage : " + string(damage)) ;
		//show_debug_message("actual swing speed: "+ string(actual_swing_speed) );
		//show_debug_message("difference: " + string( abs(angular_difference) - abs(actual_swing_speed)  ) );
		
	} else {
	    //image_angle = target_angle; // Close enough to directly set the angle
		attackFinishedFlag = true;
		damage = 0;
	}


	//// Swing the sword
	//image_angle -= primaryAttack_speed;
	
	//// add how much the mouse has moved so the sword "follows" the mouse
    //image_angle += angular_change;
	
	// increase the counter
    primaryAttack_counter++;
	//show_debug_message("currentAttack Counter: "+ string(primaryAttack_counter));
	//show_debug_message("maxCounter: "+ string(maxCounter));

	if(attackFinishedFlag){
		//primaryAttack_counter = maxCounter;
		 image_angle += 1;
			returnCounter--;
		}
	if(returnCounter <= 0){
		primaryAttack_counter = maxCounter;
		returnCounter = 10;
	}
	// Check if the attack is finished
    if (primaryAttack_counter >= maxCounter) {
		//stop the attack flag
        owner.attacking = false;
		//stop the primary attack flag (left click)
		owner.primaryAttack = false;	
		//reset the attack timer/counter
		primaryAttack_counter = 0;
		
		//set the damage to 0 in case of accidental collision.
		damage = 0;
		
		//stop the attack flag (this actually might not be necessary as we can just use oPlayer.attacking or oSword.attacking.
		swingingFlag = false;
		attackFinishedFlag = false;
		
        // Optional other clean up (set angle, trigger "reload" animation etc)
    }	
}


// Check if we have an owner and if that owner is secondary attacking
if (owner != noone && owner.attacking && owner.secondaryAttack && secondaryAttack_counter > 0) {	
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
    }
	
}
// If not attacking, the sword can be hidden or follow the player without swinging
visible = true; // or handle idle position/state


// Store the current mouse angle for the next step
prev_mouse_angle = current_mouse_angle;