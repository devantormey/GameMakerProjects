/// @description Insert description here
// You can write your code in this editor

// Calculate the midpoint between oPlayer1 and oPlayer2
var midX = (oPlayer1.x + oPlayer2.x) / 2;
var midY = (oPlayer1.y + oPlayer2.y) / 2;
//var height_offset = 100;
// Calculate the distance between oPlayer1 and oPlayer2
var distance = point_distance(oPlayer1.x, oPlayer1.y, oPlayer2.x, oPlayer2.y);

// Determine the scaling factor based on the distance
var zoomFactor = max(1, distance / 300); // Adjust 100 to your game's needs

// Ensure the zoom factor stays within reasonable limits
zoomFactor = clamp(zoomFactor, 1, 3); // Adjust min and max zoom limits as needed

// Get the current camera
var camera = view_camera[0];

// Calculate new camera width and height based on zoom factor
var baseWidth = 512; // Base view width
var baseHeight = 256; // Base view height
var newWidth = baseWidth * zoomFactor;
var newHeight = baseHeight * zoomFactor;

// Set the new camera view size
camera_set_view_size(camera, newWidth, newHeight);

// Set the new camera position to center on the midpoint
// Adjusting for the new camera width and height
camera_set_view_pos(camera, midX - newWidth / 2, (midY - newHeight / 1.3));

if (gamepad_is_connected(0) && gamepad_button_check(0, gp_start)) {
    // Code to execute when the "Select"/"Back" button is pressed
	room_restart();
	
}