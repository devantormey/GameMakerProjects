/// @description Insert description here
// You can write your code in this editor


lifeSpan--;

if (lifeSpan <= 0){
	instance_destroy();
}

var xspeed = lengthdir_x(speed, direction);
var yspeed = lengthdir_y(speed, direction);

// Check for collision in the X direction
if (place_meeting(x + xspeed, y, oWall) && firstHit == false) {
    // Reverse the horizontal direction
    direction = 180 - direction;
    image_angle = direction;
    show_debug_message("hit a wall in x direction");
	firstHit = true;
    // Move the projectile out of the wall
    //while (place_meeting(x + sign(xspeed), y, oWall)) {
    //    x += sign(xspeed)*3;
    //}
}

// Check for collision in the Y direction
if (place_meeting(x, y + yspeed, oWall) && firstHit == false) {
    // Reverse the vertical direction
    direction = -direction;
    image_angle = direction;
    show_debug_message("hit a wall in y direction");
	firstHit = true;
    // Move the projectile out of the wall
    //while (place_meeting(x, y + sign(yspeed), oWall)) {
    //    y += sign(yspeed)*3;
    //}
}

if (place_meeting(x + xspeed, y, oShield) && firstHit == false) {
    // Reverse the horizontal direction
    direction = 180 - direction;
    image_angle = direction;
    show_debug_message("hit a shield in x direction");
	firstHit = true;
    // Move the projectile out of the wall
    //while (place_meeting(x + sign(xspeed), y, oWall)) {
    //    x += sign(xspeed)*3;
    //}
}

// Check for collision in the Y direction
if (place_meeting(x, y + yspeed, oShield) && firstHit == false) {
    // Reverse the vertical direction
    direction = -direction;
    image_angle = direction;
    show_debug_message("hit a shield in y direction");
	firstHit = true;
    // Move the projectile out of the wall
    //while (place_meeting(x, y + sign(yspeed), oWall)) {
    //    y += sign(yspeed)*3;
    //}
}

if(firstHit){
	hitCounter--;
	if(hitCounter <=0){
		firstHit = false;
		hitCounter = 10;
	}
}
