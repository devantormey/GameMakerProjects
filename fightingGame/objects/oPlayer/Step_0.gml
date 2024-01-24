/// @description Insert description here
// You can write your code in this editor

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

xspeed = velocity;
var _cur_grnd = instance_nearest(x,y,groundBlock);
// Check if the player is on the ground
onGround = place_meeting(x, y + 1, groundBlock); // Replace 'obj_ground' with your ground object

//show_debug_message("we checked for the ground and it was: " + string(onGround))

if(onGround){		
	y = _cur_grnd.y
	//show_debug_message("we are sitting on the ground")
};
	
// initiate jump
if (keyboard_check_pressed(vk_space) && !isJumping && jumpCount <= maxJumpCount) { // Example jump condition
    //sprite_index = sJumping; // Change to your jump animation sprite
    //image_index = 0; // Start from the first frame of the jump animation
    isJumping = true;
	fallSpeed = -jumpSpeed; // Negative for upward movement
    jumpStartY = y; // Record the starting Y position
    sprite_index = sJumping;
	
	jumpCount++;
	
}

// Apply gravity if not on ground and not jumping
if (!onGround && !isJumping) {
	//show_debug_message("we are not on the ground and not jumping so we fall")
    fallSpeed += _gravity; // Increase falling speed by gravity
    y += fallSpeed; // Apply the falling speed to the vertical position
} else if (onGround && !isJumping) {
    fallSpeed = 0; // Reset falling speed when on the ground
	jumpCount = 0;
	//show_debug_message("we are on the ground and not jumping")
}

// Handle Jump Movement
if (isJumping) {
    fallSpeed += _gravity; // Apply gravity
    y += fallSpeed; // Update the vertical position
	//show_debug_message("we are jumping")
    // Check if maximum jump height is reached or if falling down
    if (y <= jumpStartY - maxJumpHeight || fallSpeed > 0) {
        isJumping = false; // End the jump
		//show_debug_message("we are done jumping")
    }
}


// Handle all the sprite changing

if (onGround && !isJumping) {
    fallSpeed = 0; // Reset fall speed
	if(!punching){
		sprite_index = sIdle
	}
	jumpCount = 0;
    // Additional code for landing (e.g., change sprite to idle)
}

if(!isJumping){
	if(!punching){
		if(abs(xspeed) > 0){
			sprite_index = sRunning;
		}else{
			sprite_index = sIdle
		}

		if(leftKey == 1){
			image_xscale = -1;
		}
		if(rightKey == 1){
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
		sprite_index = sJumping;
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

// move the player
x += xspeed;
//y -= yspeed;


if (mouse_check_button_pressed(mb_left) && !punching){
	sprite_index = sPunch;
	var _punch = instance_create_layer(x, y - centerYOffset - 3, "Instances", oPunch);
	_punch.owner = id;
	image_index = 0;
	punching = true;
}

//if(punching){
//	if(image_index > 3){
//		image_index = 2	
//	}
//}