/// @description Insert description here
// You can write your code in this editor
if(firstFrame){
	//speed = 1;
	show_debug_message("Face Direction: " + string(owner.face))
	movDir = point_direction(0,0,owner.face,0)
	xspeed = lengthdir_x(movSpd,movDir)
	depth = owner.depth - 10;
	firstFrame = false;
}


var move = gamepad_axis_value(owner.gamepadIndex, gp_axislv);
if(move > 0.5){
	yspeed += directionChange
}
if(move <  -0.5){
	yspeed -= directionChange
}

//normalize so the speed stays at the max move speed

// Calculate the magnitude of the vector
var magnitude = sqrt(xspeed * xspeed + yspeed * yspeed);

// Check if the magnitude is not zero to avoid division by zero
if (magnitude != 0) {
    // Normalize the vector
    var normX = xspeed / magnitude;
    var normY = yspeed / magnitude;

    // Scale the normalized vector by movSpd
    //var movSpd = 15;
    xspeed = normX * movSpd;
    yspeed = normY * movSpd;
} else {
    // If the magnitude is zero, set speeds to zero
    xspeed = 0;
    yspeed = 0;
}


y += yspeed
x += xspeed;
lifeSpan--;
var _angle_update =  point_direction(previous_x,previous_y,x,y)
image_angle = _angle_update;
yImpact = impact*sin(degtorad( _angle_update ));
xImpact = impact*cos(degtorad( _angle_update ));

show_debug_message("xImpact: " + string(xImpact))
show_debug_message("yImpact: " + string(yImpact))
show_debug_message("image_ange: " + string(_angle_update))

//image_xscale = owner.face;

if(lifeSpan <= 0){
	owner.rangedAttacking = false;
	owner.spellCast = false;
	instance_destroy();
}

previous_x = x;
previous_y = y;
//var move = gamepad_axis_value(gamepadIndex, gp_axislh);

//if (abs(move) > 0.5) { // Deadzone adjustment
//		if(abs(velocity) <= movSpd){
//			velocity += sign(move) * accel;
			
//}

