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

primaryAttack_speed = 5;
secondaryAttack_speed = 5;

primaryAttack_counter = 90/primaryAttack_speed;
secondaryAttack_counter = 180/secondaryAttack_speed;

inventorySprite = sword_inv;
equippedSprite = sword_equip;

primaryDamage = 50;
fastDammage = 50;

//this will toggle between slow and fast according to player input.
damage = 0;
prev_mouse_angle = point_direction(x, y, mouse_x, mouse_y);

name = "Iron Sword";