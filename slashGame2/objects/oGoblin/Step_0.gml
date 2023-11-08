/// @description Insert description here
// You can write your code in this editor
// Step Event of oEnemy

//if we are paused dont do nothin!
if(Control.gamePaused == true){return;}

shoot_timer -= 1;


//figure out how far away the player is
var distance_to_player = point_distance(x,y,oPlayer.x,oPlayer.y)
movDir =  point_direction(x, y, oPlayer.x, oPlayer.y + oPlayer.centerYOffset );

if(distance_to_player <= aggro_range ) {aggro = true;}

xspeed = lengthdir_x(movSpeed,movDir);
yspeed = lengthdir_y(movSpeed,movDir);

// collision
if place_meeting(x + xspeed, y, oWall)
{
	xspeed = 0;
}
if place_meeting(x, y + yspeed, oWall)
{
	yspeed = 0;
}

//aggro move code
if(aggro){	
	
	// point the weapon at the player if we have aggro
	weapon.image_angle = movDir;
	weapon.x = x + lengthdir_x(weaponDistance,movDir)
	weapon.y = y + lengthdir_y(weaponDistance,movDir) + centerYOffset;
	if(movDir > 90 && movDir < 270 ){
		weapon.image_yscale = -1;
	}else{weapon.image_yscale = 1;}

	//dont move if we are close enough
	if(distance_to_player <= keepDistance){
		//movDir = 0;
		xspeed = 0;
		yspeed = 0;
		
	}
	
	// move the groblin
	x += xspeed;
	y += yspeed;
	
	
		
}

// Set Movement direction according to mouse position	
face = round(movDir/45);
if(face == 8){face = 0;}
//image_xscale = sign(x - mouse_x);
if((abs(xspeed) + abs(yspeed)) != 0)
{
	sprite_index = walkSprite[face];
}
else
{
	sprite_index = idleSprite[face];		
}

if(!aggro){sprite_index = idleSprite[face]}

if(first_shot && aggro){
	 shoot_timer = shoot_timer_max;
    
    // Calculate the direction from the enemy to the player
    //var dir = point_direction(x, y, oPlayer.x, oPlayer.y);
    var dir = point_direction(x, y, oPlayer.x, oPlayer.y + oPlayer.centerYOffset );
    // Create the projectile
	//var arrowX = x + lengthdir_x(30, dir);
	//var arrowY = y + lengthdir_y(30, dir);
	var arrowX = x + lengthdir_x(32, dir);
	var arrowY = y + centerYOffset + lengthdir_y(32, dir);

    var proj = instance_create_layer(arrowX, arrowY, "Instances", oArrow);
	proj.owner = id;
	
    proj.direction = dir;
	proj.image_angle = dir;
    proj.speed = 3; // Set the projectile's speed
	first_shot = false;
}

if (shoot_timer <= 0 && aggro) {	
	
    shoot_timer = shoot_timer_max;
    
    // Calculate the direction from the enemy to the player
    //var dir = point_direction(x, y, oPlayer.x, oPlayer.y);
    var dir = point_direction(x, y, oPlayer.x, oPlayer.y + oPlayer.centerYOffset );
    // Create the projectile
	//var arrowX = x + lengthdir_x(30, dir);
	//var arrowY = y + lengthdir_y(30, dir);
	var arrowX = x + lengthdir_x(32, dir);
	var arrowY = y + centerYOffset + lengthdir_y(32, dir);

    var proj = instance_create_layer(arrowX, arrowY, "Instances", oArrow);
	proj.owner = id;
	
    proj.direction = dir;
	proj.image_angle = dir;
    proj.speed = 3; // Set the projectile's speed
    
    // Add any additional code for the shooting effect, sound, etc.
}

if (oPlayer.attacking == false){
	m_already_hit = false;
}



