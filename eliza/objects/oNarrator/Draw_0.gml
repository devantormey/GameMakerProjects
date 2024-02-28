/// @description Insert description here
// You can write your code in this editor
//draw_self();
// Draw event
if (displayText) {
	draw_set_color(c_white);
	draw_set_font(fnt_default);
	var cam = view_camera[0];
	var cam_x = camera_get_view_x(cam);
	var cam_y = camera_get_view_y(cam);
	var cam_width = camera_get_view_width(cam);
	var cam_height = camera_get_view_height(cam);
	show_debug_message("trying to display the text")
	
    draw_text(cam_x + 10, cam_y + cam_height - 42, currentText);
}
