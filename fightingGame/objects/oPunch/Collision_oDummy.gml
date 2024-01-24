/// @description Insert description here
// You can write your code in this editor

show_debug_message("punch detected hit")
if(other.x > x){
	other.xspeed += impact;
}
if(other.x < x){
	other.xspeed -= impact;
}