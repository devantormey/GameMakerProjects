/// @description Insert description here
// You can write your code in this editor
event_inherited();
draw_self();


if(isTalkable && keyboard_check_pressed(ord("F")) ){
	isTalking = true;
	var _dialogueBox = instance_create_layer(chat_offset_x, chat_offset_y, "userInterface", oDialogueBox);
	_dialogueBox.owner = id;
	//dialogue_obj.owner = id;
	alarm[0] = .5*game_get_speed(gamespeed_fps) 
}
