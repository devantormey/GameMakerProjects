/// @description Insert description here
// You can write your code in this editor
if (gameOver) {
   // Get the camera that's currently being used
    var _cam = view_camera[0];
    
    // Get the camera's properties
    var _cam_x = camera_get_view_x(_cam);
    var _cam_y = camera_get_view_y(_cam);
    var _cam_w = camera_get_view_width(_cam);
    var _cam_h = camera_get_view_height(_cam);
    
    // Calculate the position to draw the game over text
    var _text_x = _cam_x + (_cam_w * 0.4);
    var _text_y = _cam_y + (_cam_h * 0.4);
    
    // Set the drawing color and font if necessary
    draw_set_color(c_white);
    // draw_set_font(your_font); // If you have a specific font
    
    draw_text(_text_x, _text_y, "Continue?\n Y/N");
}





