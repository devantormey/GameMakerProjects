/// @description Insert description here
// You can write your code in this editor

displayText = false;
displayResponse = false;
owner = noone;
waitingForInput = false;

_diag_box = oDialogueBox;
mainDialogueList = ds_list_create();

responseList = ds_list_create();
firstReplyOption = ds_list_create();

ds_list_add(mainDialogueList ,"Hello... Wait why are you naked?")
ds_list_add(mainDialogueList ,"What do you need?")

ds_list_add(firstReplyOption ,"1. Yes.")
ds_list_add(firstReplyOption ,"2. I don't know.")

responseListIndex = 0;

ds_list_add(responseList ,firstReplyOption)

hasResponse = true;

if(hasResponse){
	displayResponse = true;
}

 

currentStringIndex = 0;
textToDisplay = ds_list_find_value(mainDialogueList,currentStringIndex);

currentText = "";
textIndex = 0;
textSpeed = 1; // How fast the text appears (characters per step)

//textDelay = 5

currentResponseList = ds_list_find_value(responseList,responseListIndex);
numResponse = ds_list_size(currentResponseList);

responseX = 0;
responseY = 0;
//alarm[0] = room_speed * .1;


//doing some unique object testing
test_unique = 0;

dialogueStage = 0;
dialogueMoveStage = false;