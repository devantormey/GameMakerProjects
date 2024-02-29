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
			transitionDialogue = true
			//currentStringIndex = 1;
			responseChoice = 1;
			//displayText = false;
		}
		if(keyboard_check_pressed(ord("2"))){
			transitionDialogue = true
			//currentStringIndex = 2;
			responseChoice = 2;
			//displayText = false;
		}
	}
	
	
	if(transitionDialogue){
		switch(dialogueStage){
			case 0:		
				if(responseChoice == 1){
					//Direct us to the next dialogue Stage
					dialogueStage = 1;
					
					//set the next stages responses
					firstReplyOption  = "1. Quest?"
					secondReplyOption = "2. Nothing, bye!"
					
					//select the appropriate dialogue string
					currentStringIndex = 1;
					textToDisplay = ds_list_find_value(mainDialogueList,currentStringIndex);
					
					
					//reset variables as needed
					currentText = "";
					textIndex = 0;
					numResponse = 2;
					responseChoice = 0;
				}
				if(responseChoice == 2){
					//Direct us to the next dialogue Stage
					dialogueStage = 1;
					
					//set the next stages responses
					firstReplyOption  = "1. Quest?"
					secondReplyOption = "2. Nothing, bye!"
					
					//select the appropriate dialogue string
					currentStringIndex = 2;
					textToDisplay = ds_list_find_value(mainDialogueList,currentStringIndex);
					
					
					//reset variables as needed
					currentText = "";
					textIndex = 0;
					numResponse = 2;
					responseChoice = 0;
				}
			case 1:
				//do some stuff				
				if(responseChoice == 1){
					firstReplyOption  = "1. Thanks. Bye!"
					secondReplyOption = ""
					numResponse = 1;
					currentStringIndex = 3;
					textToDisplay = ds_list_find_value(mainDialogueList,currentStringIndex);
					currentText = "";
					textIndex = 0;
					dialogueStage = 2;
					responseChoice = 0;
				}
				if(responseChoice == 2){
					//Direct us to the next dialogue Stage
					dialogueStage = 1;
					
					//set the next stages responses
					firstReplyOption  = "1. Quest?"
					secondReplyOption = "2. Nothing, bye!"
					
					//select the appropriate dialogue string
					currentStringIndex = 1;
					textToDisplay = ds_list_find_value(mainDialogueList,currentStringIndex);
					
					
					//reset variables as needed
					currentText = "";
					textIndex = 0;
					numResponse = 2;
					responseChoice = 0;
					owner.isTalking = false;
				}
				case 2:
					if(responseChoice == 1){
						//Direct us to the next dialogue Stage
						dialogueStage = 1;
					
						//set the next stages responses
						firstReplyOption  = "1. Quest?"
						secondReplyOption = "2. Nothing, bye!"
					
						//select the appropriate dialogue string
						currentStringIndex = 1;
						textToDisplay = ds_list_find_value(mainDialogueList,currentStringIndex);
					
					
						//reset variables as needed
						currentText = "";
						textIndex = 0;
						numResponse = 2;
						responseChoice = 0;
						owner.isTalking = false;
						
					}
		}
		transitionDialogue = false;
		responseChoice = 0;
		//show_debug_message("current text: " + currentText)
		//show_debug_message("display text: " + textToDisplay)
		//show_debug_message("transition Flag: " + string(transitionDialogue) )
		//transitionCount = transitionCount + 1;
		//show_debug_message("transition count: " + string(transitionCount) )
		//displayText = true;
	}
}