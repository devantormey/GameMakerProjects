/// @description Insert description here
// You can write your code in this editor
/// Create Event for objDummy

// Initialize health
charHealth = 200; // Set the starting health of the dummy
m_already_hit = false;

aimDir = 0;
face = 0;
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
hand_offset_x = [1,   0,  -7, -7,  -2,  2,  2,  2];
hand_offset_y = [-17,-17,-17,-15,-14,-17,-17,-17];
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