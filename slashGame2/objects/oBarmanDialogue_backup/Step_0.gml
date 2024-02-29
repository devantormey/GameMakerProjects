/// @description Insert description here
// You can write your code in this editor
if (displayText) {
	//textToDisplay = ds_list_find_value(textList,currentStringIndex);
    if (textIndex < string_length(textToDisplay)) {
        textIndex += textSpeed;
        currentText = string_copy(textToDisplay, 0, textIndex);
    }
		
}

if(owner.isTalking == false){
	displayText = false;
}

//Lets do all the conversation code here

if(owner.isTalking){
	if(hasResponse){
		//do the stuff to select the responses
		if(keyboard_check_pressed(ord("1"))){
			dialogueMoveStage = true
			dialogueStage = 1;
		}
		if(keyboard_check_pressed(ord("2"))){
			dialogueMoveStage = true
			dialogueStage = 1;
		}
	}
	
	if(dialogueMoveStage){
		switch(dialogueStage){
			case 1:
				
			case 2:
				//do some stuff
		}
			
		
		
		
	
	
		dialogueMoveStage = false;
	}
}