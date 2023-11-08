/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(vk_tab)) {
	// Get the camera's top-left corner position
	cam = view_camera[0];
	cam_x = camera_get_view_x(cam);
	cam_y = camera_get_view_y(cam);

	offset_x = 180; // Offset from the camera view's edge
	offset_y = 42; // Offset from the camera view's edge
	x = cam_x + offset_x; // X start position of the health bar
	y = cam_y + offset_y; // Y start position of the health bar
	
    openInv = !openInv; // This toggles the boolean value
    visible = openInv;  // This sets the visibility to the same value as openInv
	Control.gamePaused = !Control.gamePaused;
}






