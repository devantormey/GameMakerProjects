/// @description Insert description here
// You can write your code in this editor

if(Control.notHome ){ // if you are NOT home
	 if ( audio_is_playing(bgm) ){
		audio_sound_gain(bgm,.3,0);
	 }

}else{
	if ( audio_is_playing(bgm) ){
		//audio_resume_sound(bgm);
		audio_sound_gain(bgm,.6,0);
	}
}

if(!Control.notTitle){
	if ( audio_is_playing(bgm) ){
			//audio_resume_sound(bgm);
			audio_sound_gain(bgm,.6,0);
		}
}
