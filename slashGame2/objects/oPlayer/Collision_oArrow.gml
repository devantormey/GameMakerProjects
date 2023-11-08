/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
/// Collision Event with objArrow

// Collision event of the arrow with the target dummy
if (other.already_hit == false) {
	other.speed = 0;
	
	other.wiggle_time = 2; // Set how long the wiggle will last (30 steps, for example)
	other.is_wiggling = true;
    // Code to reduce the dummy's health
    charHealth -= (other.damage - (other.damage*(armor/100)));
	show_debug_message("Took Damage Health is now: " + string(charHealth));
    other.already_hit = true; // The arrow has now dealt damage and should not deal more
	arrowHit = true;
	
	var arrowAngle = other.image_angle;
	var arrowX = other.x;
	var arrowyY= other.y;
	with(other) {
		instance_destroy();
	}
	var bloodEffect = instance_create_layer(arrowX, arrowyY, "Instances", oBloodSpurt);
	bloodEffect.image_angle = arrowAngle;
}

charHealth = clamp(charHealth, 0, max_health);

if (charHealth==0){
	other.lifespan=0;
	other.already_hit = true;
	visible = false;
	// Example for loop that counts from 1 to 10 and shows a debug message for each count
	var bloodList = [];
	bloodList[0] = instance_create_layer(arrowX, arrowyY, "Instances", oBloodSpurt);
	bloodList[0].image_angle = 0;
	for (var i = 1; i <= 10; i++) {
		bloodList[i] = instance_create_layer(arrowX, arrowyY, "Instances", oBloodSpurt);
		bloodList[i].image_angle = i*36;
	}

	var bloodEffect = instance_create_layer(arrowX, arrowyY, "Instances", oBloodSpurt);
	bloodEffect.image_angle = arrowAngle;
	
	gameOverFlag = true;
	
	//game_end();
}







