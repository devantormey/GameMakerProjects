/// @description Insert description here
// You can write your code in this editor
face = 1;
headSprite = playerHead;
handSprite = hand;


walkSprite = bodyWalk;
bodySprite = body;
shadowSprite = bodyShadow;

movSpd = 1;
moveDir = 0;
aimDir = 0;
yspeed = 0;
xspeed = 0;

attacking = false;
secondaryAttack = false;
secondaryAngleStart = 0;

currentWeapon = noone;


swing_frequency = .2;
bobRate =  .6;
bobOffset = 0;


footstep_sound_is_playing = false;


percent = 0;
percentRate = 1/60;
handCurve_x = animcurve_get_channel(handAnim,"curve1");
handCurve_y = animcurve_get_channel(handAnim,"curve2");

alarm[0] = game_get_speed(gamespeed_fps) * bobRate; // Resll set alarm 0 to trigger after 60 steps (1 second if your game runs at 60fps)

//make cursor object
if (!instance_exists(oCursor)) {
    cursor = instance_create_layer(mouse_x, mouse_y, "Instances", oCursor);
    cursor.owner = id; // This ensures the sword knows who its owner is
}

//make starting weapon
if (!instance_exists(oWeapon)) {
    currentWeapon = instance_create_layer(mouse_x, mouse_y, "Instances", oWeapon);
    currentWeapon.owner = id; // This ensures the sword knows who its owner is
	currentWeapon.isEquipped = true;
}
