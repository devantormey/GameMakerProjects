/// this is the create script for shooting an arrow

// Create Event of obj_arrow

// Assume the length from the origin to the tip is 32 pixels
length_to_tip = 32;

// Set the lifespan of the arrow in steps (e.g., if room_speed is 60, 120 steps is 2 seconds)
lifespan = 120; 
current_life = 0; // A counter to keep track of how long the arrow has been alive

damage = 50; // Damage the arrow will do on impact
is_flying = true; // A flag to check if the arrow is still flying

// The direction and speed are set by the player upon creation of the arrow,
// so they're not initialized here.

// Define wiggle for the arrow object
wiggle_time = 0; // Time for which the arrow will wiggle
wiggle_amount = 5; // Amount of angle change during the wiggle
is_wiggling = false; // Flag to check if the arrow is currently wiggling

collisionFlag = false;

already_hit = false;
//blocked = false;

owner = 0;