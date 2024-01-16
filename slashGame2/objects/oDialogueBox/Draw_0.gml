/// @description Insert description here
// You can write your code in this editor




if(owner.isTalking){
	draw_self();
	var cam = view_camera[0];
	var cam_x = camera_get_view_x(cam);
	var cam_y = camera_get_view_y(cam);
	draw_sprite(owner.portrait, 0, cam_x + owner.portrait_offset_x, cam_y + owner.portrait_offset_y);
	x = cam_x + owner.chat_offset_x;
	y = cam_y + owner.chat_offset_y;
}else{
	visible = false;
}

