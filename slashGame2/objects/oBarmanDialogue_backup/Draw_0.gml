/// @description Insert description here
// You can write your code in this editor

if (displayText) {
	draw_set_color(c_black);
	draw_set_font(fnt_default);	
	var cam = view_camera[0];
	var cam_x = camera_get_view_x(cam);
	var cam_y = camera_get_view_y(cam);
	var _diag_box_x = cam_x + owner.chat_offset_x;
	var _diag_box_y = cam_y + owner.chat_offset_y;
    draw_text(_diag_box_x + 10, _diag_box_y + 33, currentText);
	
	if(hasResponse){
		for (var i = 0; i < numResponse; i += 1){
			var _current_response_text = ds_list_find_value(currentResponseList,i);
			draw_text(responseX, responseY + i*30, _current_response_text);
			
		}
	}
	//show_debug_message("Unique Dialogue ID = " + string(test_unique) )	
}

