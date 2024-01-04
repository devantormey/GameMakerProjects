/// @description Insert description here
// You can write your code in this editor
// Step Event of oEnemy
shoot_timer -= 1;

if (shoot_timer <= 0) {
    shoot_timer = shoot_timer_max;
    
    // Calculate the direction from the enemy to the player
    //var dir = point_direction(x, y, oPlayer.x, oPlayer.y);
    var dir = point_direction(x, y, oPlayer.x, oPlayer.y + oPlayer.centerYOffset );
    // Create the projectile
	var arrowX = x + lengthdir_x(30, dir);
    var arrowY = y + lengthdir_y(30, dir);
    var proj = instance_create_layer(arrowX, arrowY, "Instances", oArrow);
	proj.owner = id;
	
    proj.direction = dir;
	proj.image_angle = dir;
    proj.speed = 3; // Set the projectile's speed
    
    // Add any additional code for the shooting effect, sound, etc.
}



