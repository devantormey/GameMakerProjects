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
	swing_frequency = .25
	walkTiming = .25;
	//bobRate = bobRate*.5
}else{
	movSpd = 1;
	bobRate = .6;
	swing_frequency = .2;
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
	// Step event of the player object
	swing_angle += swing_frequency; // Update the swing angle
	swing_offset_y = sin(swing_angle) * swing_amplitude;
	swing_offset_x = sin(swing_angle) * swing_amplitude;
	if(face == 2){
		swing_offset_x = -sin(swing_angle) *(swing_amplitude/2);
	}
	if(face == 6){
		swing_offset_x = (sin(swing_angle) *(swing_amplitude/2));
	}
		
}
else
{
	sprite_index = B_sprite[face];	
	footstep_sound_is_playing = false;
	bobRate = 1;
	swing_offset_y = 0;
	swing_offset_x = 0;
}
	




