/// @description Insert description here
// You can write your code in this editor

//movement controls ~~~~~~~~~~~~~~~~~~~~
movDir = 0;
movSpd = 1;

xspeed = 0;

//hand_sprite stuff
hand_offset_x = [-1,  4,  4,  3,  -4, -5, -5, -4];
hand_offset_y = [-12,-13,-14,-15,-14,-14,-14,-13];

// Offsets ~~~~~~~~~~~~~~~~~~~~~~~~~~~
centerYOffset = -18;
centerY = y + centerYOffset; //repeat in step event

// Create event of the player object
swing_amplitude = 1; // How far the hand swings (in pixels)
base_swing_frequency = 0.2
swing_frequency = base_swing_frequency; // How fast the hand swings
swing_offset_x = 0;
swing_offset_y = 0;
swing_angle = 0;

aimDir = 0;

// Sprite Control ~~~~~~~~~~~~~~~~~~~~~~~~~~
face = 0;
H_sprite[0] = pH_IdleRight;
H_sprite[1] = pH_IdleUpRight;
H_sprite[2] = pH_IdleUp;
H_sprite[3] = pH_IdleUpLeft;
H_sprite[4] = pH_IdleLeft;
H_sprite[5] = pH_IdleDownLeft;
H_sprite[6] = pH_IdleDown;
H_sprite[7] = pH_IdleDownRight;

B_sprite[0] = pB_IdleRight;
B_sprite[1] = pB_IdleUpRight;
B_sprite[2] = pB_IdleUp;
B_sprite[3] = pB_IdleUpLeft;
B_sprite[4] = pB_IdleLeft;
B_sprite[5] = pB_IdleDownLeft;
B_sprite[6] = pB_IdleDown;
B_sprite[7] = pB_IdleDownRight;

walkSprite[0] = pWalkRight;
walkSprite[1] = pWalkUpRight;
walkSprite[2] = pWalkUp;
walkSprite[3] = pWalkUpLeft;
walkSprite[4] = pWalkLeft;
walkSprite[5] = pWalkDownLeft;
walkSprite[6] = pWalkDown;
walkSprite[7] = pWalkDownRight;

clothingArray[0] = sSweatShirt_Right;
clothingArray[1] = sSweatShirt_UpRight;
clothingArray[2] = sSweatShirt_Up;
clothingArray[3] = sSweatShirt_UpLeft;
clothingArray[4] = sSweatShirt_Left;
clothingArray[5] = sSweatShirt_DownLeft;
clothingArray[6] = sSweatShirt_Down;
clothingArray[7] = sSweatShirt_DownRight;

hairArray[0] = pHair_IdleRight;
hairArray[1] = pHair_IdleUpRight;
hairArray[2] = pHair_IdleUp;
hairArray[3] = pHair_IdleUpLeft;
hairArray[4] = pHair_IdleLeft;
hairArray[5] = pHair_IdleDownLeft;
hairArray[6] = pHair_IdleDown;
hairArray[7] = pHair_IdleDownRight;

hatArray[0] = pHat_IdleRight;
hatArray[1] = pHat_IdleUpRight;
hatArray[2] = pHat_IdleUp;
hatArray[3] = pHat_IdleUpLeft;
hatArray[4] = pHat_IdleLeft;
hatArray[5] = pHat_IdleDownLeft;
hatArray[6] = pHat_IdleDown;
hatArray[7] = pHat_IdleDownRight;



headYoffset = -24;
clothingOffset = -8;

upKey = keyboard_check(ord("W"));
leftKey = keyboard_check(ord("A"));
downKey = keyboard_check(ord("S"));
rightKey = keyboard_check(ord("D"));
sprintKey = keyboard_check_pressed(vk_shift)

// In the Create event
bobbingUp = true; // This indicates if the bob is going up or down
bobOffset = 0; // This will be either 1 or -1 pixel
bobRate = .4;
alarm[0] = game_get_speed(gamespeed_fps) * bobRate; // Set the alarm to go off after 2 seconds

if (!instance_exists(oCursor)) {
    var cursor = instance_create_layer(mouse_x, mouse_y, "Instances", oCursor);
    cursor.owner = id; // This ensures the sword knows who its owner is
}

persistent = true;