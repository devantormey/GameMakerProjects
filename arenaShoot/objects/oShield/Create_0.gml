/// @description Insert description here
// You can write your code in this editor


lifeSpan = 100;

//aimDir = oPlayer.aimDir;
currentAim = oPlayer.aimDir;

radius = 15;



playerX = oPlayer.x;
playerY = oPlayer.y
xdist = lengthdir_x(radius, currentAim);
ydist = lengthdir_y(radius, currentAim);
x = playerX + xdist;
y = playerY + ydist;
image_angle = oPlayer.image_angle;