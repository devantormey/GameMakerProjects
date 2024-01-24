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

if(isLooting){return;}
upKey = keyboard_check(ord("W"));
leftKey = keyboard_check(ord("A"));
downKey = keyboard_check(ord("S"));
rightKey = keyboard_check(ord("D"));
sprintKey = keyboard_check_pressed(vk_shift)



//sheathedWeapon = keyboard_check(ord("x"));

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
	_spd = accel * _inputLevel;
	
	
	//if(_inputLevel == 0){
	//	_spd -= decel;		
		
	//	if(_spd <= 0){
	//		_spd = 0;
	//	}
	//}
	//xspeed = lengthdir_x(_spd,movDir);
	//yspeed = lengthdir_y(_spd,movDir);
	xspeed +=  lengthdir_x(_spd,movDir);
	yspeed +=  lengthdir_y(_spd,movDir);
	
	
	if(_inputLevel == 0){
		xspeed = xspeed/1.04;
		yspeed = yspeed/1.04;
		
		if(abs(xspeed) <= .001){
			xspeed = 0;
		}
		if(abs(yspeed) <= .001){
			yspeed = 0;
		}
	}
	if(xspeed >= maxSpeed){
		xspeed = maxSpeed;
	}
	if(yspeed >= maxSpeed){
		yspeed = maxSpeed;
	}
	
	
	
	//show_debug_message("movDir = " + string(movDir))
	// collision
	if place_meeting(x + xspeed, y, oWall)
	{
		xspeed = -xspeed;
	}
	if place_meeting(x, y + yspeed, oWall)
	{
		yspeed = -yspeed;
	}
	
	// move the player
	x += xspeed;
	y += yspeed;
	
	

		
// Player Aiming
	
aimDir = point_direction(x,y, oCursor.x, oCursor.y);
	//var _aimSide = point_distance(0,0,mouse_x, mouse_y)
	
// Set Movement direction according to mouse position	
image_angle = aimDir;
	
// Player shooting
if(mouse_check_button_pressed(shootKey) && noShield){
	//create bullet
	 var newProjectile = instance_create_layer(x, y, "Instances", oLaser);
    // Set direction and speed of the projectile
    newProjectile.direction = aimDir; // or any direction you want
	newProjectile.image_angle = aimDir;
    newProjectile.speed = 10; // or any speed you want
}
if(mouse_check_button_pressed(blockKey)){
	//create bullet
	if(noShield){
	 var newShield = instance_create_layer(x, y, "Instances", oShield);
	 noShield = false;
	 show_debug_message("created Shield")
	}
}


charHealth = clamp(charHealth, 0, max_health);	

armor = clamp(armor,0,100);

