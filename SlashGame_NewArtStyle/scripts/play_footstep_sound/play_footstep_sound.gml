/// @description play_footstep_sound()
/// @param none

// Create a new script file named "play_footstep_sound"
function play_footstep_sound() {
    if (global.footstep_toggle) {
        audio_play_sound(snd_footstep_gravel_1, 1, false);
    } else {
        audio_play_sound(snd_footstep_gravel_2, 1, false);
    }
    global.footstep_toggle = !global.footstep_toggle; // Toggle the flag
}