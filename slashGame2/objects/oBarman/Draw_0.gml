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
}

