// variables for movement
//devan tormey
//11/2/2023

// Character Stats
armor = 0;
charHealth = 100;
max_health = 100;
m_already_hit = false;
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
//first_shot = true;
//shoot_timer = game_get_speed(gamespeed_fps) * 4; // Shoots every 2 seconds.
//shoot_timer_max = shoot_timer;

aggro = false;
aggro_range = 250;
keepDistance = 20;

nearThePlayer = false;

movDir = 0;


// Head bobbing animation
// In the Create event
bobbingUp = true; // This indicates if the bob is going up or down
bobOffset = 0; // This will be either 1 or -1 pixel
bobRate = .4;
alarm[0] = game_get_speed(gamespeed_fps) * bobRate; // Set the alarm to go off after 2 seconds

//~~~~~~~~~~~~~~~~~~ SWORD CODE ~~~~~~~~~~~~~~~~~~~~~~~~~~~


target = oPlayer;

currentSword = instance_create_layer(x + 10, y, "Instances", oEnemyBladeWeapon);
currentSword.owner = id; // This ensures the sword knows who its owner is

currentSword.type = 0;
currentSword.isEquipped = true;
currentSword.visible = true;
currentSword.depth = depth - 2;

currentSword.distance_to_sword = 14; // Change this value to what fits your sprite sizes
currentSword.distance_from_player = 14;

//hand_sprite stuff
//hand_offset_x = [1,   0,  -7, -7,  -2,  2,  2,  2];
//hand_offset_y = [-17,-17,-17,-15,-14,-17,-17,-17];

sword_offset_x = [-2,   -2,  -2, -6,  -6,  -6,  -6,  -6];
sword_offset_y = [-12,-12,-12,-12,-12,-12,-12,-12];
//im gonna zero out these offsets
//hand_offset_x = hand_offset_x*0;
//hand_offset_y = hand_offset_y*0;

//var playerDepth = depth;
front = depth - 1;
back = depth + 1;
sword_depth = [front, front, front, front, front, front, front, front]
	
// Sword Variables ~~~~~~~~~~~~~~~~~~~~~~~~~
leftMouseWasPressed = false;

attacking = false;
primaryAttack = false;
secondaryAttack = false;
attackDelay = 0;
// aggression variables
attackRange = 40;
startAttack = false;
attackFinished = false;

attackAimDir = aimDir;
attackStartImageAngle = aimDir;

attackDelayTime = 100;
//where the blocking action began at
secondaryAngleStart = 0;