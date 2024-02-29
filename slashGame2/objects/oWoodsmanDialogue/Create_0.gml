/// @description Insert description here
// You can write your code in this editor
event_inherited()

mainDialogueList = ds_list_create();



ds_list_add(mainDialogueList ,"huh... what do you want?") //0
ds_list_add(mainDialogueList ,"Oh dang bro I thought you were gonna mess \n up my stuff!") //1
ds_list_add(mainDialogueList ,"Meditation, spacetime shit bro. \n Need something?") //2
ds_list_add(mainDialogueList ,"Nothing right now, gotta break through") //3
ds_list_add(mainDialogueList ,"I got Nothing for you, gotta break through my \n mind prison and explore my space powers") //4

firstReplyOption = "1. Dunno, who are you?"
secondReplyOption = "2. What Are you doing?"

//responseListIndex = 0;

//ds_list_add(responseList ,replyOptions)

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

//currentResponseList = ds_list_find_value(responseList,responseListIndex);
numResponse = 2;

responseX = 0;
responseY = 0;
//alarm[0] = room_speed * .1;


//doing some unique object testing
test_unique = 0;

dialogueStage = 0;

transitionDialogue = false;
transitionCount = 0;
responseChoice = 0;