/// @description Insert description here
// You can write your code in this editor
draw_self();

if(distance_to_object(oPlayer) <= talkDistance && !isTalking){
	isTalkable = true;
	draw_set_color(c_white);
	draw_set_font(fnt_medium);
	draw_text(x, y,"Talk [F]");	
	//isPettable = true;
}else{
	//isTalking = false;
	isTalkable = false;
}

if(isTalkable && keyboard_check_pressed(ord("F")) ){
	isTalking = true;
	var _dialogueBox = instance_create_layer(chat_offset_x, chat_offset_y, "userInterface", oDialogueBox);
	_dialogueBox.owner = id;
	alarm[0] = .5*game_get_speed(gamespeed_fps) 
}

if(isTalking){
	var cam = view_camera[0];
	var cam_x = camera_get_view_x(cam);
	var cam_y = camera_get_view_y(cam);
	//draw_sprite(portrait, mood, cam_x + portrait_offset_x, cam_y + portrait_offset_y);
}
