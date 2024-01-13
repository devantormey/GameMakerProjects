/// @description Insert description here
// You can write your code in this editor
if(distance_to_object(other) <= 2){
	show_debug_message("Health: " + string(other.grassHealth))
	if(other.grassHealth > 0){
		other.grassHealth--;
	}

}






