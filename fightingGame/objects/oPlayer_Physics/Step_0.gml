/// @description Insert description here
// You can write your code in this editor


sprintKey = keyboard_check_pressed(vk_shift)


jumpKey = keyboard_check_pressed(vk_space);
leftKey = keyboard_check(ord("A"));
downKey = keyboard_check(ord("S"));
rightKey = keyboard_check(ord("D"));

//sheathedWeapon = keyboard_check(ord("x"));

// player movement
// Step Event - Horizontal Movement
var forceAmount = 50; // Adjust this based on your needs
if (leftKey == 1) {
    physics_apply_force(x, y, -forceAmount, 0);
}
if (rightKey == 1) {
    physics_apply_force(x, y, forceAmount, 0);
}

// Step Event - Jumping
var jumpForce = -50; // Negative for upward force, adjust as needed
if (jumpKey && isOnGround) { // Ensure 'isOnGround' is true when the player is touching the ground
    physics_apply_impulse(x, y, 0, jumpForce);
    isJumping = true;
}


//if (isOnGround) {
//    var vx = physics_get_speed_x(id);
//	physics_
//    physics_set_speed_x(id, vx); // Maintain horizontal speed
//    physics_set_speed_y(id, 0); // Stop vertical speed
//}
// Check for landing condition, e.g., collision with the ground
// Check for landing
if (isOnGround && isJumping) {
    isJumping = false;
    sprite_index = sIdle; // Change to idle or walk sprite
}

if(!isJumping){
	if(abs(xspeed) > 0){
		sprite_index = sRunning;
	}else{
		sprite_index = sIdle
	}

	if(leftKey == 1){
		sprite_index = sRunning;
		image_xscale = -1;
	}
	if(rightKey == 1){
		sprite_index = sRunning;
		image_xscale = 1;
	}
	if(leftKey == 0 && rightKey == 0){ sprite_index = sIdle;}
}

if(isJumping){
	if (image_index >= sprite_get_number(sprite_index) - 1) {
        image_speed = 0; // Stop the animation
        image_index = sprite_get_number(sprite_index) - 1; // Hold on the last frame
    }
	if(leftKey == 1){
		image_xscale = -1;
	}
	if(rightKey == 1){
		image_xscale = 1;
	}
	
}


//show_debug_message("right key: " + string(rightKey))
//show_debug_message("left key: " + string(leftKey))