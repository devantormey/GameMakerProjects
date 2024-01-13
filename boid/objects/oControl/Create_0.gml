/// @description Insert description here
// You can write your code in this editor
musicOn = true;
VolumeLevel = 1;
randomize()
var track = choose(3,1,2);
if(musicOn){
	if(track>0){
		music = audio_play_sound(Zelda___Chill__Ocarina_of_Time__Mikel_Lofi_Remix,1,true)
	
	}else{
		music = audio_play_sound(Never_Let_Me_Go,1,true)
	}
	
}



previous_x = mouse_x;
previous_y = mouse_y;

mouse_positions = ds_list_create();
max_positions = 10; // Adjust the length of the wake here

fishCount = 50;
maxFishCount = 200;