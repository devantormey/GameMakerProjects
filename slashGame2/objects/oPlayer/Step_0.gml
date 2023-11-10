// step for moving the player



if gameOverFlag{
	
	if(gameOver_counter <= 0){
		Control.gameOver = true;	
	}
	
	gameOver_counter--;
	
}

if(Control.gameOver == true){
	visible = false;
	return;
}

//if we are paused dont do nothin!
if(Control.gamePaused == true){return;}

//get inputs
upKey = keyboard_check(ord("W"));
leftKey = keyboard_check(ord("A"));
downKey = keyboard_check(ord("S"));
rightKey = keyboard_check(ord("D"));
sprintKey = keyboard_check_pressed(vk_shift)

// player movement
	// get direction
	var _horizKey = rightKey - leftKey;
	var _vertKey = downKey - upKey;
	movDir = point_direction(0,0,_horizKey,_vertKey);
	
	var walkTiming = .4;
	//check sprinting
	bobRate = .4;
	if (keyboard_check(vk_shift)) {
		movSpd = 2;
		walkTiming = .25;
		//bobRate = bobRate*.5
	}else{
		movSpd = 1;
		bobRate = .6;
	}

	
	
	// get x and y speed
	var _spd = 0;
	var _inputLevel = point_distance(0,0,_horizKey,_vertKey);
	_inputLevel = clamp(_inputLevel,0,1)
	_spd = movSpd * _inputLevel;
	xspeed = lengthdir_x(_spd,movDir);
	yspeed = lengthdir_y(_spd,movDir);
	
	
	// collision
	if place_meeting(x + xspeed, y, oWall)
	{
		xspeed = 0;
	}
	if place_meeting(x, y + yspeed, oWall)
	{
		yspeed = 0;
	}
	
	// move the player
	x += xspeed;
	y += yspeed;
	
	

		
// Player Aiming
	centerY = y + centerYOffset;
	aimDir = point_direction(x,centerY, mouse_x, mouse_y);
	//var _aimSide = point_distance(0,0,mouse_x, mouse_y)
	
// Set Movement direction according to mouse position	
	face = round(aimDir/45);
	if(face == 8){face = 0;}
	//image_xscale = sign(x - mouse_x);
	if((abs(xspeed) + abs(yspeed)) != 0)
	{
		sprite_index = walkSprite[face];
		if (!footstep_sound_is_playing) {
	        play_footstep_sound();
	        footstep_sound_is_playing = true;
	        alarm[2] = room_speed * walkTiming; // Adjust the timing as necessary
		}
		
	}
	else
	{
		sprite_index = B_sprite[face];	
		footstep_sound_is_playing = false;
		bobRate = 1;
	}
	
	
// Sword Control Code ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if (currentSword != noone){
	// Get the mouse position
	var mx = mouse_x;
	var my = mouse_y;

	// Calculate the angle from the character to the mouse
	var angle_to_mouse = point_direction(x, y, mx, my);


	// Assuming you have a reference to your sword instance stored in a variable 'sword'
	var sword = instance_nearest(x, y, oBladeWeapon);
	if(face < 0 || face > 4){
		currentSword.depth = oPlayer.depth - 1;
	}else{
		currentSword.depth = oPlayer.depth + 1;
	}

	var startOffset = 45;
	var endOffset = -200;

	if (mouse_check_button_pressed(mb_left)) {
	    if (!attacking) {
	        attacking = true;
			primaryAttack = true;
			play_swing_sound();
			//attack_angle_start = point_direction(x, y, mouse_x, mouse_y) + startOffset; // Starting angle 45 degrees behind the mouse direction
			//attack_angle_end = attack_angle_start + endOffset; // Creates a 90-degree arc
	
			//show_debug_message("Attack started. Angle start: " + string(attack_angle_start) + ", Angle end: " + string(attack_angle_end));
	    }
		} else {
			//show_debug_message("Already attacking.");
		}
	if (mouse_check_button_pressed(mb_right)) {
	    if (!attacking) {
	        // Your code for what happens when the left mouse button is pressed goes here        
			attacking = true;
			secondaryAttack = true;
			secondaryAngleStart = point_direction(x, y, mouse_x, mouse_y)// + startOffset; // Starting angle 45 degrees behind the mouse direction
			//attack_angle_end = attack_angle_start + endOffset; // Creates a 90-degree arc
			//show_debug_message("Attack started. Angle start: " + string(attack_angle_start) + ", Angle end: " + string(attack_angle_end));
	    }
		} else {
			//show_debug_message("Already attacking.");
		}
}	
// clamp our stats for each step 
// note we also should modulate these numbers!

charHealth = clamp(charHealth, 0, max_health);	

armor = clamp(armor,0,100);

//show_debug_message("Current Armor: " + string(armor));
if(Control.currentItemPlayerIsTouching != noone){
	if(place_meeting(x,y,Control.currentItemPlayerIsTouching)){
		Control.standingOnItem = true;
	}else{
		Control.standingOnItem = false;
		Control.currentItemPlayerIsTouching = noone;
	}
}else{
	Control.standingOnItem = false;
}
