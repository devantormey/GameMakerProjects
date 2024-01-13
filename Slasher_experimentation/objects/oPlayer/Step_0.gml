/// @description Insert description here
// You can write your code in this editor
//get inputs
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
	percentRate = 1/30;
	walkTiming = .25;
	//bobRate = bobRate*.5
}else{
	movSpd = 1;
	bobRate = .6;
	percentRate = 1/60;
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
//var centerY = y;
aimDir = point_direction(x,y, cursor.x, cursor.y);

if (aimDir < 90 || aimDir > 270){
	face =  1;
}else{
	face = -1;
}
//var _aimSide = point_distance(0,0,mouse_x, mouse_y)
if((abs(xspeed) + abs(yspeed)) != 0)
{
	sprite_index = walkSprite;
	image_xscale = face;
	if (!footstep_sound_is_playing) {
	    play_footstep_sound();
	    footstep_sound_is_playing = true;
	    alarm[2] = room_speed * walkTiming; // Adjust the timing as necessary
	}
		
}
else
{
	sprite_index = bodySprite;	
	image_xscale = face;
	footstep_sound_is_playing = false;
	bobRate = 1;
}
	
if (currentWeapon != noone){
	// Get the mouse position
	var mx = mouse_x;
	var my = mouse_y;

	// Calculate the angle from the character to the mouse
	var angle_to_mouse = point_direction(x, y, mx, my);


	// Assuming you have a reference to your sword instance stored in a variable 'sword'
	//var sword = instance_nearest(x, y, oBladeWeapon_Complex);
	//currentSword.depth = sword_depth[face];
	


	var startOffset = 45;
	var endOffset = -200;
	

	if (mouse_check_button_pressed(mb_left)) {
	    if (!attacking) {
	        attacking = true;
			primaryAttack = true;
			
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


