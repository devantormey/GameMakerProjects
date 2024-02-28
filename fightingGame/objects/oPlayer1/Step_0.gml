/// @description Insert description here
// You can write your code in this editor


if (gamepad_button_check_pressed(gamepadIndex, gp_face4) && !rangedAttacking ){
	rangedAttacking = true;
	if(onGround){
		sprite_index = spellCastSprite;
		var _spell_effect = instance_create_layer(x, y, "Instances", oSpellEffect);
		_spell_effect.depth = depth - 5;
		_spell_effect.owner = id;
	}else{
		sprite_index = spellCastSprite_falling;
		var _spell_effect = instance_create_layer(x, y, "Instances", oSpellEffect);
		_spell_effect.depth = depth - 5;
		_spell_effect.owner = id;
	}
	//velocity = 0;
	//xspeed = 0;
	//yspeed = 0;
}


	//handle collisions during ranged attack
	if(rangedAttacking){
	
		if (place_meeting(x, y, oPunchCollider)) {
		if(oPunchCollider.owner != id){
		   show_debug_message("we got hit  -from player1")
		   if(oPunchCollider.owner.x < x){
				velocity += oPunchCollider.impact;
			}
			if(oPunchCollider.owner.x  > x){
				velocity -= oPunchCollider.impact;
			}
			rangedAttacking = false;
		}
	}	

	if (place_meeting(x, y, oMagicBall)) {	
			if(oMagicBall.owner != id && oMagicBall.firstHit_id != id){
				//xspeed = 0;
				oMagicBall.firstHit_id = id;
			   show_debug_message("we got hit  -from player1")
			   if(oMagicBall.x < x){
					velocity += oMagicBall.xImpact;
					fallSpeed -= oMagicBall.yImpact
				}
				if(oMagicBall.x  > x){
					velocity += oMagicBall.xImpact;
					fallSpeed -= oMagicBall.yImpact
				}
				rangedAttacking = false;
			}
	}

}


if(rangedAttacking){
	// do ranged attack stuff
	if(image_index > 2 && !spellCast){
		var _attack_ball = instance_create_layer(x + face*12, y - 20, "Instances", oMagicBall);
		_attack_ball.owner = id;
		//_attack_ball.image_xscale = face;
		spellCast = true;
	}
	if(spellCast){
		image_index = 3;
	}
	
	return;
}




// Check for gamepad connection
if (gamepad_is_connected(gamepadIndex) && !rangedAttacking) {
    // Horizontal Movement
    var move = gamepad_axis_value(gamepadIndex, gp_axislh);
    if (abs(move) > 0.5) { // Deadzone adjustment
		if(abs(velocity) <= movSpd){
			velocity += sign(move) * accel;
			if(move > .5 ){
				movRight = true;
				movLeft = false;
				face = 1;
			}
			if(move < -0.5){
				movLeft = true;
				movRight = false;
				face = -1;
			}
			
			if(velocity = -.3 && movLeft && onGround){//play a puff animation because we are beginning movement
				var _run_poof = instance_create_layer(x + 3, y, "Instances", oRunPoof);
				_run_poof.image_xscale = -1;
				_run_poof.depth = depth - 5;
			}
			if(velocity = .3 && movRight && onGround){//play a puff animation because we are beginning movement
				var _run_poof = instance_create_layer(x - 3, y, "Instances", oRunPoof);
				_run_poof.image_xscale = 1;
				_run_poof.depth = depth - 5;
			}
			
		}else{
			movRight = false;
			movLeft = false;
		}
    }else{
		if(velocity != 0){
			if(velocity > 0){
				velocity -= decel;
			}
			if(velocity < 0){
				velocity += decel;
			}
		}
	}

    // Jumping
	if (gamepad_button_check_pressed(gamepadIndex, gp_face1)  && !isJumping && jumpCount <= maxJumpCount ) { // 'A' button on most gamepads
		
	    isJumping = true;
		fallSpeed = -jumpSpeed; // Negative for upward movement
	    jumpStartY = y; // Record the starting Y position
	    sprite_index = jumpingSprite;
		image_index = 0;
		var _jump_poof = instance_create_layer(x, y - 2, "Instances", oJumpPoof);
		_jump_poof.depth = depth - 5;
		jumpCount++;
	

        // Jump code here
    }
}else{

	sprintKey = keyboard_check_pressed(vk_shift)

	jumpKey = keyboard_check_pressed(vk_space);
	leftKey = keyboard_check(ord("A"));
	downKey = keyboard_check(ord("S"));
	rightKey = keyboard_check(ord("D"));

	// player movement
	// get direction
	var _horizKey = rightKey - leftKey;
	//var _vertKey = downKey - upKey;
	movDir = point_direction(0,0,_horizKey,0);

	// handle horizontal movement input
	if(leftKey == 1){
		if(velocity >= -movSpd){
		
			if(velocity = -.3){//play a puff animation because we are beginning movement
				var _run_poof = instance_create_layer(x + 3, y, "Instances", oRunPoof);
				_run_poof.image_xscale = -1;
				_run_poof.depth = depth - 5;
			}
			//increase the velocity to the left
			velocity -= accel;
		}
	
	}
	if(rightKey == 1){
		if(velocity <= movSpd){
			if(velocity = .3){//play a puff animation because we are beginning movement
				var _run_poof = instance_create_layer(x - 3, y, "Instances", oRunPoof);
				_run_poof.image_xscale = 1;
				_run_poof.depth = depth - 5;
			}
			//increase the velocity to the right
			velocity += accel;
		}
	}
	if(rightKey == 0 && leftKey == 0){
		if(velocity != 0){
			if(velocity > 0){
				velocity -= decel;
			}
			if(velocity < 0){
				velocity += decel;
			}
		}
	}
}

xspeed = velocity;
var _cur_grnd = instance_nearest(x,y,groundBlock);
// Check if the player is on the ground
onGround = place_meeting(x, y + 1, groundBlock); // Replace 'obj_ground' with your ground object

//show_debug_message("we checked for the ground and it was: " + string(onGround))

if(onGround){
	if(abs(_cur_grnd.y - y ) <= 25 ){
		y = _cur_grnd.y
	}else{
		onGround = false;
	}
	//show_debug_message("we are sitting on the ground")
};
	
// initiate jump
if (keyboard_check_pressed(vk_space) && !isJumping && jumpCount <= maxJumpCount && !rangedAttacking) { // Example jump condition
    //sprite_index = sJumping; // Change to your jump animation sprite
    //image_index = 0; // Start from the first frame of the jump animation
    isJumping = true;
	fallSpeed = -jumpSpeed; // Negative for upward movement
    jumpStartY = y; // Record the starting Y position
    sprite_index = jumpingSprite;
	
	jumpCount++;
	
}

// Apply gravity if not on ground and not jumping
if (!onGround && !isJumping) {
	//show_debug_message("we are not on the ground and not jumping so we fall")
    fallSpeed += _gravity; // Increase falling speed by gravity
    
} else if (onGround && !isJumping) {
    fallSpeed = 0; // Reset falling speed when on the ground
	jumpCount = 0;
	//show_debug_message("we are on the ground and not jumping")
}


// Handle Jump Movement
if (isJumping) {
    fallSpeed += _gravity; // Apply gravity
    y += fallSpeed; // Update the vertical position
	image_index = 1;
	//show_debug_message("we are jumping")
    // Check if maximum jump height is reached or if falling down
    if (y <= jumpStartY - maxJumpHeight || fallSpeed > 0) {
        isJumping = false; // End the jump
		image_index = 2;
		//show_debug_message("we are done jumping")
    }
}


// Handle all the sprite changing

if (onGround && !isJumping) {
    fallSpeed = 0; // Reset fall speed
	if(!punching){
		sprite_index = idleSprite
	}
	jumpCount = 0;
    // Additional code for landing (e.g., change sprite to idle)
}

if(!isJumping){
	if(!punching){
		if(abs(xspeed) > 0){
			sprite_index = runningSprite;
		}else{
			sprite_index = idleSprite
		}

		if(leftKey == 1 || movLeft ){
			image_xscale = -1;
		}
		if(rightKey == 1 || movRight ){
			image_xscale = 1;
		}
	}
}

if(isJumping){
	
	if(leftKey == 1){
		image_xscale = -1;
	}
	if(rightKey == 1){
		image_xscale = 1;
	}
	
}

if(!onGround && !isJumping){
	if(!punching){
		sprite_index = jumpingSprite;
		image_index = 1;
	}
}
if(punching){
	if( velocity != 0 && onGround ){
			if(velocity > 0){
				velocity -= decel*2;
			}
			if(velocity < 0){
				velocity += decel*2;
			}	
	}
}


if (place_meeting(x, y, oPunchCollider)) {
	if(oPunchCollider.owner != id){
	   show_debug_message("we got hit  -from player1")
	   if(oPunchCollider.owner.x < x){
			velocity += oPunchCollider.impact;
		}
		if(oPunchCollider.owner.x  > x){
			velocity -= oPunchCollider.impact;
		}
	}
}	

if (place_meeting(x, y, oMagicBall)) {	
		if(oMagicBall.owner != id && oMagicBall.firstHit_id != id){
			//xspeed = 0;
			oMagicBall.firstHit_id = id;
		   show_debug_message("we got hit  -from player1")
		   if(oMagicBall.x < x){
				velocity += oMagicBall.xImpact;
				fallSpeed -= oMagicBall.yImpact
			}
			if(oMagicBall.x  > x){
				velocity += oMagicBall.xImpact;
				fallSpeed -= oMagicBall.yImpact
			}
			
		}
}




if (place_meeting(x + xspeed, y, oWall) ) {
	
	velocity = 0;
	x = x - 10;
	xspeed = -xspeed;
	velocity = -velocity
}

if (place_meeting(x - xspeed - 64 , y, oWall)) {
	velocity = 0;
	x = x + 10;
	xspeed = -xspeed;
	velocity = -velocity
}

// move the player
x += xspeed;
y += fallSpeed; // Apply the falling speed to the vertical position
//y -= yspeed;


if ( (mouse_check_button_pressed(mb_left) && !punching)   || (gamepad_button_check_pressed(gamepadIndex, gp_face3) && !punching) ){
	sprite_index = punchingSprite;
	var _punch = instance_create_layer(x, y - centerYOffset - 3, "Instances", oPunch);
	_punch.owner = id;
	image_index = 0;
	punching = true;
}

if( (isJumping && !onGround) || !onGround){
	if(fallSpeed < 0 ){
		image_index = 1;
	}else{
		image_index = 2;
	}
}


if(abs(velocity) < .1){velocity = 0;}
//show_debug_message("Velocity= " + string(velocity))
//if(punching){
//	if(image_index > 3){
//		image_index = 2	
//	}
//}