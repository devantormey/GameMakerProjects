/// @description Insert description here
// You can write your code in this editor
/// Create Event for objDummy
centerYOffset = -18;
// Initialize health
charHealth = 100; // Set the starting health of the dummy
m_already_hit = false;

xspeed = 0;
yspeed = 0;
movSpeed = 1;

face = 0;
idleAnim = gobDown;
walkSprite[0] = gobWalkRight;
walkSprite[1] = gobWalkUpRight;
walkSprite[2] = gobWalkUp;
walkSprite[3] = gobWalkUpLeft;
walkSprite[4] = gobWalkLeft;
walkSprite[5] = gobWalkDownLeft;
walkSprite[6] = gobWalkDown;
walkSprite[7] = gobWalkDownRight;

idleSprite[0] = gobRight;
idleSprite[1] = gobUpRight;
idleSprite[2] = gobUp;
idleSprite[3] = gobUpLeft;
idleSprite[4] = gobLeft;
idleSprite[5] = gobDownLeft;
idleSprite[6] = gobDown;
idleSprite[7] = gobDownRight;




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
