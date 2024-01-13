/// @description Insert description here
// You can write your code in this editor
// This script describes what happens when an enemy makes a collision with the sword object

//melee hit registration code
if (m_already_hit == false && other.swingingFlag == true && !other.gotBlocked) {
	//stop the swing (optional)
	//other.speed = 0;	
	
	
    // Code to reduce the player's health
    charHealth -= other.damage;
	
	//show_debug_message("health: "+ string(charHealth));
	//show_debug_message("i just got hit for: " + string(other.damage));
	
	if (charHealth > 0) {
		audio_play_sound(snd_sword_slash, 1, false);
	}
	
	var bloodEffect = instance_create_layer(x, y + centerYOffset, "Instances", oBloodSpurt);
	
	bloodEffect.image_angle = other.image_angle;
	
    m_already_hit = true; //the swing should only damage once per swing
	//show_debug_message("you hit me!");
}

//legacy bug checking code consider removing
if (m_already_hit == true && other.swingingFlag == true){
	//show_debug_message("you tried to double hit me!");
}

//swing has finished, allow them to hit again
if(m_already_hit == true && other.swingingFlag == false){
	m_already_hit = false;
	//show_debug_message("switch the already hit flag back on.");
}

charHealth = clamp(charHealth, 0, max_health);

if (charHealth==0){
	other.lifespan=0;
	other.already_hit = true;
	visible = false;
	// Example for loop that counts from 1 to 10 and shows a debug message for each count
	var bloodList = [];
	bloodList[0] = instance_create_layer(x, y + centerYOffset, "Instances", oBloodSpurt);
	bloodList[0].image_angle = 0;
	for (var i = 1; i <= 10; i++) {
		bloodList[i] = instance_create_layer(x, y + centerYOffset, "Instances", oBloodSpurt);
		bloodList[i].image_angle = i*36;
	}

	var bloodEffect = instance_create_layer(x, y + centerYOffset, "Instances", oBloodSpurt);
	bloodEffect.image_angle = other.image_angle;
	
	gameOverFlag = true;
	if (currentSword != noone){currentSword.visible = false;}
	
	//game_end();
}





