/// @description Insert description here
// You can write your code in this editor
//if(Control.notHome == false && Control.notTitle == true){
//	alarm[0] = room_speed * 1; // Wait for 3 seconds before showing text
//	show_debug_message("Setting the alarm because we got home.")
//}
// Step event
if (displayText) {
	//textToDisplay = ds_list_find_value(textList,currentStringIndex);
    if (textIndex < string_length(textToDisplay)) {
        textIndex += textSpeed;
        currentText = string_copy(textToDisplay, 0, textIndex);
    }
	
}

//if(!Control.narattor_talking){
//	displayText = false;
//}

//if(textDelay > 0){
//	textDelay--;
//}
//if(textDelay == 0){
//	displayText = true;
//}