/// @description Insert description here
// You can write your code in this editor

// Collision event of the arrow with the target dummy
if(owner.secondaryAttack){
	
if (other.already_hit == false) {
	other.speed = 0;
	other.damage = 0;
	
	//other.wiggle_time = 2; // Set how long the wiggle will last (30 steps, for example)
	//other.is_wiggling = true;
    // Code to reduce the dummy's health
    //charHealth -= other.damage;
    other.already_hit = true; // The arrow has now dealt damage and should not deal more
	//destroy it
	with(other) {
		var arrowX = other.x;
		var arrowY = other.y;
		var arrowAngle = other.image_angle;
		instance_destroy();
		var brokenArrow = instance_create_layer(x, y, "Instances", oArrowBreak);
		//we can use either angle here, depending on how it looks.
		//brokenArrow.image_angle = arrowAngle;
		brokenArrow.image_angle =  point_direction(x, y, mouse_x, mouse_y);
	}
	
}

}




