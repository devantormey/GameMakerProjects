/// @description Insert description here
// You can write your code in this editor

lifeSpan--;
if(lifeSpan <= 0){
	oPlayer.noShield = true;
	instance_destroy();
}

currentAim = oPlayer.aimDir;

playerX = oPlayer.x;
playerY = oPlayer.y
xdist = lengthdir_x(radius, currentAim);
ydist = lengthdir_y(radius, currentAim);
x = playerX + xdist;
y = playerY + ydist;

image_angle = oPlayer.image_angle;