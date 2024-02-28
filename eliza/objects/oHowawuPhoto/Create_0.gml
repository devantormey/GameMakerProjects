/// @description Insert description here
// You can write your code in this editor
Control.sound1 = audio_play_sound(ESM_SC_Beach_Loop_2_Ambience_Nature_South_Carolina_Water_Waves_Sea_Gull, .8, true);	
//Control.sound2 = audio_play_sound(Kauai__O_o, .01, true);	

// Create event
displayText = false;
textToDisplay = "Howawu...                  \n               Shroomies....";
currentText = "";
textIndex = 0;
textSpeed = 1; // How fast the text appears (characters per step)
alarm[0] = room_speed * 3; // Wait for 3 seconds before showing text
textDelay = 5