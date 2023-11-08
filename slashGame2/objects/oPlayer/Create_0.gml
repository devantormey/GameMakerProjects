// variables for movement
//devan tormey
//11/2/2023
charHealth = 200;
max_health = 200;
gameOverFlag = false;
gameOver_counter = 20;
headYoffset = -24

currentHelm = noone;
currentArmor = noone;

currentHelm_array = [];
currentArmor_array = [];
armor = 0;

inventorySlots = 21;
currentItemCount = 1;

inventoryArray = [];


//movement controls ~~~~~~~~~~~~~~~~~~~~
	movDir = 0;
	movSpd = 1;

	xspeed = 0;
	yspeed = 0;
	
arrowHit = false;
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

// Offsets ~~~~~~~~~~~~~~~~~~~~~~~~~~~
centerYOffset = -18;
centerY = y + centerYOffset; //repeat in step event

aimDir = 0;
	
weaponXOffset = -6;
weaponYOffset = 2;

arrowOffsetx = 3;
arrowOffsety = 10;

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

sword.type = 0;
sword.isEquipped = true;
inventoryArray[0] = sword;


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
alarm[0] = game_get_speed(gamespeed_fps) * 1; // Set the alarm to go off after 2 seconds


// In the Player's Create event
footstep_sound_is_playing = false;
global.footstep_toggle = false; // Also ensure this global variable is initialized
