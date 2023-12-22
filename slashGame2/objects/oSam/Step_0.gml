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
    movSpd = 0.8;
} else if (distanceToPlayer < stopMovingDistance) {
    // Close enough to stop
    movSpd = 0;
}

// Calculate movement
xSpeed = lengthdir_x(movSpd, movDir);
ySpeed = lengthdir_y(movSpd, movDir);

// Update position
x += xSpeed;
y += ySpeed;

// Set sprite based on movement
if (xSpeed != 0 || ySpeed != 0) {
    sprite_index = samWalk;
} else {
    sprite_index = samSit;
}

// Set image direction
if (xSpeed != 0 || ySpeed != 0) {
    if (movDir > 90 && movDir < 270) {
        face = 0;
        image_xscale = -1;
    } else {
        image_xscale = 1;
        face = 1;
    }
} else {
    if (x - oPlayer.x > 0) {
        image_xscale = 1;
    } else {
        image_xscale = -1;
    }
}

	

	
	