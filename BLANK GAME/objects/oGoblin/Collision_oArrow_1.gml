/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
/// Collision Event with objArrow

// Collision event of the arrow with the target dummy
if(other.owner != id) {
	if (other.already_hit == false) {
		other.speed = 0;
	
		other.wiggle_time = 2; // Set how long the wiggle will last (30 steps, for example)
		other.is_wiggling = true;
	    // Code to reduce the dummy's health
	    charHealth -= other.damage;
	    other.already_hit = true; // The arrow has now dealt damage and should not deal more
	}
	if (charHealth==0){
		other.lifespan=0;
		other.already_hit = true;
		instance_destroy(); // Destroy the dummy object	
	}
}






