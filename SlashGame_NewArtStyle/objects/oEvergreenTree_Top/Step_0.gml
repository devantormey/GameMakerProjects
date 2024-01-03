/// @description Insert description here
// You can write your code in this editor
// Check if the object is no longer colliding with the player
if (!place_meeting(x, y-10, oPlayer)) {
    image_alpha = 1; // Reset opacity to full
}else{image_alpha = .5;}



