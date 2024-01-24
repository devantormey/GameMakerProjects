
var traction = 0.95;
var drift_traction = 0.85;
desired_direction = movDir;

// Apply traction
if (keyboard_check(vk_space)) { // Drifting
    turnRate = 5;
} else {
    turnRate = 2;
}

if (keyboard_check(ord("A"))) {
	if(velocity > .2){
		desired_direction += min(turnRate*velocity,turnRate);
	}
}
if (keyboard_check(ord("D")) ) {
	if(velocity > 0.2){
		desired_direction -= min(turnRate*velocity,turnRate);
	}
}
if (keyboard_check(ord("W"))) {
    velocity  += accel;
	
	if(velocity >= maxSpeed){
		velocity  = maxSpeed;
	}
}
if (keyboard_check(ord("S"))) {
    velocity  -= brake;
	
	if(velocity <= 0){
		velocity  = 0;
	}
}


// Apply traction
if (keyboard_check(vk_space)) { // Drifting
    velocity *= drift_traction;
} else {
    velocity *= traction;
}




// Update momentum direction based on current traction
movDir = lerp(movDir, desired_direction, traction);


var angle = movDir;

// Normalize the angle
if (angle < 0) {
    angle += 360;
}

image_angle = angle;

xSpeed = lengthdir_x(velocity,movDir)
ySpeed = lengthdir_y(velocity,movDir)

if(abs(xSpeed) > .2 || abs(ySpeed) > .2){
	rippleTimer --;
	if(rippleTimer  <= 0){
		instance_create_layer(x, y, "Instances", oRipple);
		rippleTimer = 8;
	}
}

previous_x = x;
previous_y = y;

// collision
if place_meeting(x + lengthdir_x(velocity,movDir), y, oWall)
{
	xSpeed = -xSpeed;
}
if place_meeting(x, y + lengthdir_y(velocity,movDir), oWall)
{
	ySpeed = -ySpeed;
}

x+= xSpeed;
y+= ySpeed;

