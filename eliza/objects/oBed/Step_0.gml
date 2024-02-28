/// @description Insert description here
// You can write your code in this editor
event_inherited()


if (displayText) {
    if (textIndex < string_length(textToDisplay)) {
        textIndex += textSpeed;
        currentText = string_copy(textToDisplay, 0, textIndex);
    }
	if(textIndex >= string_length(textToDisplay)){
		textTimer--;
		if(textTimer <= 0){
			displayText = false;
			textTimer = 200;
		}
	} 
	
}



if(distance_to_object(oCursor) <= 4 && oCursor.handMode){
	if(isInteractable && mouse_check_button_pressed(mb_left)){
		//
		displayText = true;
	}
}