
var traction = 0.95;
var drift_traction = 0.9;
desired_direction = movDir;

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


var angle = movDir - 90;

// Normalize the angle
if (angle < 0) {
    angle += 360;
}

image_angle = angle;

x+= lengthdir_x(velocity,movDir);
y+= lengthdir_y(velocity,movDir)