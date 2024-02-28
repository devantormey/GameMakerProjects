/// @description Insert description here
// You can write your code in this editor
if (displayText) {
	//textToDisplay = ds_list_find_value(textList,currentStringIndex);
    if (textIndex < string_length(textToDisplay)) {
        textIndex += textSpeed;
        currentText = string_copy(textToDisplay, 0, textIndex);
    }
		
}

