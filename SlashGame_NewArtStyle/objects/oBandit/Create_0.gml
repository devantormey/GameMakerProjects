// variables for movement
//devan tormey
//11/2/2023

// Character Stats
armor = 0;
charHealth = 100;
max_health = 100;

// Game Flags
gameOverFlag = false;
gameOver_counter = 20;
isLooting = false;

// Character Sprite offsets
headYoffset = -24



//~~~~~~~~~~~~~ inventory Variables
currentHelm = noone;
currentArmor = noone;

currentHelm_array = [];
currentArmor_array = [];


inventorySlots = 21;
currentItemCount = 1;

inventoryArray = [];


//movement controls ~~~~~~~~~~~~~~~~~~~~
movDir = 0;
movSpeed = 1;

xspeed = 0;
yspeed = 0;

// Arrow interaction Variables
arrowHit = false;

// Sprite Control ~~~~~~~~~~~~~~~~~~~~~~~~~~
face = 0;

idleAnim =  bB_IdleDown;

H_sprite[0] = bH_IdleRight;
H_sprite[1] = bH_IdleUpRight;
H_sprite[2] = bH_IdleUp;
H_sprite[3] = bH_IdleUpLeft;
H_sprite[4] = bH_IdleLeft;
H_sprite[5] = bH_IdleDownLeft;
H_sprite[6] = bH_IdleDown;
H_sprite[7] = bH_IdleDownRight;

B_sprite[0] = bB_IdleRight;
B_sprite[1] = bB_IdleUpRight;
B_sprite[2] = bB_IdleUp;
B_sprite[3] = bB_IdleUpLeft;
B_sprite[4] = bB_IdleLeft;
B_sprite[5] = bB_IdleDownLeft;
B_sprite[6] = bB_IdleDown;
B_sprite[7] = bB_IdleDownRight;

walkSprite[0] = bWalkRight;
walkSprite[1] = bWalkUpRight;
walkSprite[2] = bWalkUp;
walkSprite[3] = bWalkUpLeft;
walkSprite[4] = bWalkLeft;
walkSprite[5] = bWalkDownLeft;
walkSprite[6] = bWalkDown;
walkSprite[7] = bWalkDownRight;

// Offsets ~~~~~~~~~~~~~~~~~~~~~~~~~~~
centerYOffset = -18;
centerY = y + centerYOffset; //repeat in step event

aimDir = 0;
	
weaponXOffset = -6;
weaponYOffset = 2;

arrowOffsetx = 3;
arrowOffsety = 10;

sheathedWeapon = false;

distance_to_sword = 8;

// Create Event of oEnemy
first_shot = true;
shoot_timer = game_get_speed(gamespeed_fps) * 4; // Shoots every 2 seconds.
shoot_timer_max = shoot_timer;

aggro = false;
aggro_range = 250;
keepDistance = 120;

movDir = 0;

weaponDistance = 5;
weapon = instance_create_layer(x, y, "Instances", oCrossbow);

weapon.x = x + lengthdir_x(weaponDistance,movDir)
weapon.y = y + lengthdir_y(weaponDistance,movDir) + centerYOffset;

weapon.owner = id; // This ensures the sword knows who its owner is


// Head bobbing animation
// In the Create event
bobbingUp = true; // This indicates if the bob is going up or down
bobOffset = 0; // This will be either 1 or -1 pixel
bobRate = .4;
alarm[0] = game_get_speed(gamespeed_fps) * bobRate; // Set the alarm to go off after 2 seconds

