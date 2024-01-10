/// @description Insert description here
// You can write your code in this editor
reverseCount = 1;
type = 0;
isEquipped = false;
owner = noone;

swingingFlag = false;
firstIterationFlag = true;
swordYOffset = -14;
maxAngularChange = 10;

sword_offset_x = [ -2,  0,  0,  0,  0,  0,  -4,  -3];
sword_offset_y = [0,0,0,0,0,0,0,0];
//swingCountTimer = 0;

primaryAttack_speed = 10;
secondaryAttack_speed = 5;
primaryBlockSpeed = 15;

secondaryAttack_counter = 180/secondaryAttack_speed;

// set the draw distance for the sword/player
distance_to_sword = 14; // Change this value to what fits your sprite sizes
distance_from_player = 9;

primaryDamage = 50;
fastDammage = 50;
wpn_speed = 0;
arcSwingPercentChange = 1/40;
arcSwingPercent = 0;

totalAttackTimer =  1/arcSwingPercentChange
primaryAttack_counter = totalAttackTimer;
critSpeed = 12;
critAcheivedFlag = false;
//this will toggle between slow and fast according to player input.
damage = 0;
prev_mouse_angle = point_direction(x, y, mouse_x, mouse_y);

name = "Bladed Weapon";
visible = true;
solid = true;

// Weapon effects variables
gotBlocked = false;
gotBlockedCounter = 15;
	
blockAnimCurve = animcurve_get_channel(BlockingCurve,"curve1");
swingAnimCurve = animcurve_get_channel(SwingCurve,"enemyBladeSwing");
arc_speed = 10;
returnSpeed = 10;
arc_angle = 0;
returnSwordFlag = false;

original_x = x;
original_y = y;

percent = 0;


//weapon Length
weapon_length = 28;

//line points for drawing swing arc
line_points = ds_list_create();
