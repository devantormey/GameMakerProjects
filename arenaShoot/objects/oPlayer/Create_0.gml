// variables for movement
//devan tormey
//11/2/2023

// Character Stats
armor = 0;
charHealth = 200;
max_health = 200;

// Game Flags
gameOverFlag = false;
gameOver_counter = 20;
isLooting = false;


//controls:
//get inputs
upKey = keyboard_check(ord("W"));
leftKey = keyboard_check(ord("A"));
downKey = keyboard_check(ord("S"));
rightKey = keyboard_check(ord("D"));
sprintKey = keyboard_check_pressed(vk_shift)

shootKey = mb_left;
blockKey = mb_right;

//movement controls ~~~~~~~~~~~~~~~~~~~~
movDir = 0;
movSpd = 1;

velocity = 0;
accel = 0.1;
decel = .06;
maxSpeed = 4;

xspeed = 0;
yspeed = 0;

// weapon Variables

noShield = true;
// Sprite Control ~~~~~~~~~~~~~~~~~~~~~~~~~~
//face = 0;
//H_sprite[0] = pH_IdleRight;
//H_sprite[1] = pH_IdleUpRight;
//H_sprite[2] = pH_IdleUp;
//H_sprite[3] = pH_IdleUpLeft;
//H_sprite[4] = pH_IdleLeft;
//H_sprite[5] = pH_IdleDownLeft;
//H_sprite[6] = pH_IdleDown;
//H_sprite[7] = pH_IdleDownRight;

//B_sprite[0] = pB_IdleRight;
//B_sprite[1] = pB_IdleUpRight;
//B_sprite[2] = pB_IdleUp;
//B_sprite[3] = pB_IdleUpLeft;
//B_sprite[4] = pB_IdleLeft;
//B_sprite[5] = pB_IdleDownLeft;
//B_sprite[6] = pB_IdleDown;
//B_sprite[7] = pB_IdleDownRight;

//walkSprite[0] = pWalkRight;
//walkSprite[1] = pWalkUpRight;
//walkSprite[2] = pWalkUp;
//walkSprite[3] = pWalkUpLeft;
//walkSprite[4] = pWalkLeft;
//walkSprite[5] = pWalkDownLeft;
//walkSprite[6] = pWalkDown;
//walkSprite[7] = pWalkDownRight;

//// Offsets ~~~~~~~~~~~~~~~~~~~~~~~~~~~
//centerYOffset = -18;
//centerY = y + centerYOffset; //repeat in step event

//aimDir = 0;
	
//weaponXOffset = -6;
//weaponYOffset = 2;

//arrowOffsetx = 3;
//arrowOffsety = 10;

//sheathedWeapon = false;

//distance_to_sword = 8;


if (!instance_exists(oCursor)) {
    var cursor = instance_create_layer(mouse_x, mouse_y, "Instances", oCursor);
    cursor.owner = id; // This ensures the sword knows who its owner is
}


leftMouseWasPressed = false;

attacking = false;
primaryAttack = false;
secondaryAttack = false;

//where the blocking action began at
secondaryAngleStart = 0;

// Inventory creation ~~~~~~~~~~~~~~~~~~~~~~~



//// In the Player's Create event
//footstep_sound_is_playing = false;
//global.footstep_toggle = false; // Also ensure this global variable is initialized

//fontRed = make_color_rgb(178, 12, 16);
//fontGray = make_color_rgb(85, 85, 85);