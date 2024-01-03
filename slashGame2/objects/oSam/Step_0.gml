/// @description Insert description here
// You can write your code in this editor


// Define the distance thresholds
var startMovingDistance = 120; // Distance at which the dog starts moving towards the player
var stopMovingDistance = 60;  // Distance at which the dog stops moving

movDir = point_direction(x, y, oPlayer.x, oPlayer.y);
movSpd = 0.8;

var distanceToPlayer = point_distance(x, y, oPlayer.x, oPlayer.y);

// Determine movement speed based on distance
if (distanceToPlayer > startMovingDistance) {
    // Far enough to start moving
	moveDelay--;
	if(moveDelay = 0){
		movSpd = 0.8;
		moveDelay = 10;
	}
    
} else if (distanceToPlayer < stopMovingDistance) {
    // Close enough to stop
    movSpd = 0;
	moveDelay = 10;
}

// Calculate movement
xSpeed = lengthdir_x(movSpd, movDir);
ySpeed = lengthdir_y(movSpd, movDir);

if(isPetting){
	xSpeed = 0;
	ySpeed = 0;
}
// Update position
x += xSpeed;
y += ySpeed;

// Set sprite based on movement
if (xSpeed != 0 || ySpeed != 0) {
    sprite_index = samWalk;
	//walkDelay = 10;
} else {
	walkDelay--;
	if(walkDelay = 0){
		sprite_index = samSit;
		walkDelay = 10;
	}
}

if(isPetting){
	sprite_index = samIdleSmile;
	
}
// Set image direction
//if (xSpeed != 0 || ySpeed != 0) {
if (movDir > 95 && movDir < 265) {
        
		flipDelay--;
		if(flipDelay = 0){
			//face = 0;
			image_xscale = 1;
			flipDelay = 10;
			
		}
    }
	if (movDir < 85 || movDir > 275) {
        image_xscale = -1;
        face = 1;
		
    }

//}
//else {
//    if (x - oPlayer.x > 0) {
//        image_xscale = 1;
//    } else {
//        image_xscale = -1;
//    }
//}

if(isPettable && keyboard_check_pressed(ord("F") ) ){
	instance_create_layer(x, y, "Instances", oSamPet);
	isPetting = true;
}
	
if(isPetting){
	sprite_index = samIdleSmile;
}

	
	