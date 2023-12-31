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
movSpd = 1;

xspeed = 0;
yspeed = 0;

// Arrow interaction Variables
arrowHit = false;

// Sprite Control ~~~~~~~~~~~~~~~~~~~~~~~~~~
face = 0;
H_sprite[0] = sPlayer_Head;
H_sprite[1] = sPlayer_Head;
H_sprite[2] = sPlayer_Head;
H_sprite[3] = sPlayer_Head;
H_sprite[4] = sPlayer_Head;
H_sprite[5] = sPlayer_Head;
H_sprite[6] = sPlayer_Head;
H_sprite[7] = sPlayer_Head;

B_sprite[0] = sPlayer_body;
B_sprite[1] = sPlayer_body;
B_sprite[2] = sPlayer_body;
B_sprite[3] = sPlayer_body;
B_sprite[4] = sPlayer_body;
B_sprite[5] = sPlayer_body;
B_sprite[6] = sPlayer_body;
B_sprite[7] = sPlayer_body;

walkSprite[0] = pWalkRight;
walkSprite[1] = pWalkUpRight;
walkSprite[2] = pWalkUp;
walkSprite[3] = pWalkUpLeft;
walkSprite[4] = pWalkLeft;
walkSprite[5] = pWalkDownLeft;
walkSprite[6] = pWalkDown;
walkSprite[7] = pWalkDownRight;

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


if (!instance_exists(oCursor)) {
    var cursor = instance_create_layer(mouse_x, mouse_y, "Instances", oCursor);
    cursor.owner = id; // This ensures the sword knows who its owner is
}

// Sword creation ~~~~~~~~~~~~~~~~~~~~~~~
if (!instance_exists(oSword)) {
    var sword = instance_create_layer(x, y, "Instances", oSword);
    sword.owner = id; // This ensures the sword knows who its owner is
}


var axe = instance_create_layer(x, y, "Instances", oIronAxe);
axe.owner = id; // This ensures the sword knows who its owner is


sword.type = 0;
sword.isEquipped = true;
inventoryArray[0] = sword;


currentSword = sword;

axe.type = 0;
axe.isEquipped = false;
//axe.owner = id;
inventoryArray[1] = axe;
currentItemCount = 2;

//looting variables
	//isLooting = false;
// Sword Variables ~~~~~~~~~~~~~~~~~~~~~~~~~
leftMouseWasPressed = false;

attacking = false;
primaryAttack = false;
secondaryAttack = false;

//where the blocking action began at
secondaryAngleStart = 0;

// Inventory creation ~~~~~~~~~~~~~~~~~~~~~~~
if (!instance_exists(oInventory)) {
    var inventory = instance_create_layer(x, y, "Instances", oInventory);
    inventory.owner = id; // This ensures the inventory knows who its owner is
	inventory.visible = false;
}

// Head bobbing animation
// In the Create event
bobbingUp = true; // This indicates if the bob is going up or down
bobOffset = 0; // This will be either 1 or -1 pixel
bobRate = .4;
alarm[0] = game_get_speed(gamespeed_fps) * bobRate; // Set the alarm to go off after 2 seconds


// In the Player's Create event
footstep_sound_is_playing = false;
global.footstep_toggle = false; // Also ensure this global variable is initialized

fontRed = make_color_rgb(178, 12, 16);
fontGray = make_color_rgb(85, 85, 85);