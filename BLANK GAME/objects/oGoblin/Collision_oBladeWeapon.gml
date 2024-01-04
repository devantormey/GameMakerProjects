// This script describes what happens when an enemy makes a collision with the sword object

//melee hit registration code
if (m_already_hit == false && other.swingingFlag == true) {
	//stop the swing (optional)
	//other.speed = 0;	
    // Code to reduce the dummy's health
    charHealth -= other.damage;
	if (charHealth > 0) {
		audio_play_sound(snd_sword_slash, 1, false);
	}
	var bloodEffect = instance_create_layer(x, y + centerYOffset, "Instances", oBloodSpurt);
	bloodEffect.image_angle = other.image_angle;
    m_already_hit = true; //the swing should only damage once per swing
	//show_debug_message("you hit me!");
}
if (m_already_hit == true && other.swingingFlag == true){
	//show_debug_message("you tried to double hit me!");
}

if(m_already_hit == true && other.swingingFlag == false){
	m_already_hit = false;
	//show_debug_message("switch the already hit flag back on.");
}

if (charHealth <= 0){
	audio_play_sound(snd_sword_kill, 1, false);
	m_already_hit = false;
	//other.lifespan=0; Only for arrows
	//other.m_already_hit = true;
	//show_debug_message("destroyed switch the already hit flag back on.");
	instance_destroy(); // Destroy the dummy object	
}