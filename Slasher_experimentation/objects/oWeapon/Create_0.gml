/// @description Insert description here
// You can write your code in this editor

/// @description Insert description here
// You can write your code in this editor
reverseCount = 1;
type = 0;
isEquipped = false;
owner = noone;

swingingFlag = false;
firstIterationFlag = true;
swordYOffset = 0;
maxAngularChange = 10;

sword_offset_x = [0,0];
sword_offset_y = [0,0];
//swingCountTimer = 0;

primaryAttack_speed = 5;
secondaryAttack_speed = 5;

primaryAttack_counter = 90/primaryAttack_speed;
secondaryAttack_counter = 180/secondaryAttack_speed;

//inventorySprite = sword_inv;
//equippedSprite = sword_equip;

primaryDamage = 50;
fastDammage = 50;

wpn_speed = 0;
critSpeed = 10;

critAcheivedFlag = false;
//this will toggle between slow and fast according to player input.
damage = 0;

prev_mouse_angle = point_direction(x, y, mouse_x, mouse_y);
blocking = false;


name = "Default Weapon";
visible = true;
//solid = true;

// Weapon effects variables
//weapon Length
weapon_length = 26;

//line points for drawing swing arc
line_points = ds_list_create();



