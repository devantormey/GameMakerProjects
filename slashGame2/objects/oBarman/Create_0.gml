/// @description Insert description here
// You can write your code in this editor


isTalking = false;
isTalkable = false;
talkDistance = 15;
dialogue_obj = oBarmanDialogue;
//dialogue_obj.owner = id;

chat_offset_x = 128;
chat_offset_y = 200;

portrait_offset_x = chat_offset_x + 400;
portrait_offset_y = chat_offset_y + 3;

portrait = sBarmanPortrait;

mood = 0;

dialogue = instance_create_layer(0, 0, "DialogueText", dialogue_obj);
dialogue.owner = id
dialogue.displayText = false;