/// @description Insert description here
// You can write your code in this editor

// Step event
if (displayText) {
    if (textIndex < string_length(textToDisplay)) {
        textIndex += textSpeed;
        currentText = string_copy(textToDisplay, 0, textIndex);
    }
	
}

//if(textDelay > 0){
//	textDelay--;
//}
//if(textDelay == 0){
//	displayText = true;
//}