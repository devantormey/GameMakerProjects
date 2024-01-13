// Get the player's position
var player_x = oPlayer.x;
var player_y = oPlayer.y;

// Get the mouse position un-needed
//var mouse_x = mouse_x;
//var mouse_y = mouse_y;

// Set the restricted radius
var restricted_radius = 40; // Change this value to whatever radius you want

// Calculate the distance between the mouse and the player
var distance_to_mouse = point_distance(player_x, player_y, mouse_x, mouse_y);

// Check if the mouse is within the restricted radius
if (distance_to_mouse < restricted_radius) {
    // Calculate the angle from the player to the mouse
    var angle_to_mouse = point_direction(player_x, player_y, mouse_x, mouse_y);
    
    // Place the object on the edge of the restricted radius along the angle to the mouse
    x = player_x + lengthdir_x(restricted_radius, angle_to_mouse);
    y = player_y + lengthdir_y(restricted_radius, angle_to_mouse);
} else {
    // If the mouse is outside the restricted radius, the object follows the mouse normally
    x = mouse_x;
    y = mouse_y;
}

// Additional code for "sliding" effect, if the object was previously within the radius
// and is now moving outside along the edge
if (distance_to_mouse >= restricted_radius && previous_distance < restricted_radius) {
    // Calculate the angle of motion
    var move_angle = point_direction(previous_x, previous_y, x, y);
    // Calculate the sliding movement along the tangent of the circle
    var slide_x = lengthdir_x(1, move_angle + 90);
    var slide_y = lengthdir_y(1, move_angle + 90);
    
    // Apply the sliding movement
    x += slide_x;
    y += slide_y;
}
 
// Store the previous frame's position and distance for sliding calculation
previous_x = x;
previous_y = y;
previous_distance = distance_to_mouse;
depth = oPlayer.depth - 3;