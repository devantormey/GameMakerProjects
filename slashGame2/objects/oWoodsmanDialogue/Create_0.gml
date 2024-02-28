/// @description Insert description here
// You can write your code in this editor

displayText = false;
displayResponse = false;

barmanDialogueList = ds_list_create();

responseList = ds_list_create();
firstReplyOption = ds_list_create();

ds_list_add(barmanDialogueList ,"Hello... Wait why are you naked?")
ds_list_add(barmanDialogueList ,"What do you need?")

ds_list_add(firstReplyOption ,"Yes")
ds_list_add(firstReplyOption ,"No")

responseListIndex = 0;

ds_list_add(responseList ,firstReplyOption)

hasResponse = true;

if(hasResponse){
	displayResponse = true;
}

 

currentStringIndex = 0;
textToDisplay = ds_list_find_value(barmanDialogueList,currentStringIndex);

currentText = "";
textIndex = 0;
textSpeed = 1; // How fast the text appears (characters per step)

//textDelay = 5

currentResponseList = ds_list_find_value(responseList,responseListIndex);
numResponse = ds_list_size(currentResponseList);

owner = noone;
//alarm[0] = room_speed * .1;