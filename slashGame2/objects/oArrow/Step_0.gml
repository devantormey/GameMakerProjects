/// @description Insert description here
// You can write your code in this editor
// Step Event for obj_arrow
//if we are paused dont do nothin!
if(Control.gamePaused == true){
	speed = 0 
	return;
}
else{
	speed = 3;
}

// Increment the life counter
current_life += 1;

// Check if the arrow has reached the end of its life
if (current_life >= lifespan) {
    // The arrow has traveled its maximum range
    is_flying = false; // Update the flying status
	collisionFlag = false;
    instance_destroy(); // Destroy the arrow object
}

// Wiggle Effect ~~~~~~~~~~~~~~~~~~~~
if (is_wiggling) {
    wiggle_time--; // Decrease the wiggle time
    if (wiggle_time <= 0) {
        // Stop wiggling and set the angle to the original direction
        image_angle = direction;
        is_wiggling = false;
    } else {
        // Wiggle the arrow by alternating the angle
        var wiggle_direction = ((wiggle_time div 5) % 2) * 2 - 1; // This will alternate between -1 and 1
        image_angle = direction + wiggle_amount * wiggle_direction;
    }
}


// Calculate positional Data ~~~~~~~~~~~~~~~~~~~~

// Define the arrow length (how far ahead you want to check for a collision to destroy the arrow early)
var arrow_length = 30; // Half the length of the arrow sprite

// Update the arrow's position based on its speed and direction
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);


// COLLISION CODE FOR WALL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// The buffer distance is half the sprite's width
var buffer = 1

// Calculate the start points for the collision line
var start_x = x;
var start_y = y;

// Calculate the end points for the collision line, checking ahead of the arrow tip
var end_x = x + lengthdir_x(speed, direction);
var end_y = y + lengthdir_y(speed, direction);

// Check for a collision with owall along the path the arrow would move this step
if (collision_line(start_x, start_y, end_x, end_y, oSolidWall, false, true) && collisionFlag == false) {
    // Collision actions go here
    speed = 0;
    wiggle_time = 10; // Set how long the wiggle will last (30 steps, for example)
    is_wiggling = true;

    // Adjust the arrow's final position so that it visually intersects the wall
    x += lengthdir_x(buffer, direction);
    y += lengthdir_y(buffer, direction);
	collisionFlag = true;
}


