/// @description Insert description here
// You can write your code in this editor
// Step Event of oEnemy

//if we are paused dont do nothin!
if(Control.gamePaused == true){return;}
if(Control.gameOver == true){return;}

//shoot_timer -= 1;
if(distance_to_object(oPlayer) < 100){
	target = oPlayer;
}



//figure out how far away the player is
var distance_to_player = point_distance(x,y,target.x, target.y + centerYOffset)

//calculate where we are aiming
aimDir =  point_direction(x, y, target.x, target.y + centerYOffset);

// decide move direction (simple just make it the player for now)
movDir = aimDir;


face = round(movDir/45);
if(face == 8){face = 0;}

if(distance_to_player <= aggro_range) {aggro = true;}

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
	
	currentSword.depth = sword_depth[face];

	if(distance_to_object(oPlayer)<attackRange){	
		attackDelay--;
		if(attackDelay <= 0){
			startAttack = true;
			attackAimDir = aimDir;
		}
	}

	if(startAttack && !attackFinished){
		attacking = true;
		primaryAttack = true;
		startAttack = false;
	}

	if(attackFinished && distance_to_object(oPlayer)<attackRange){
		startAttack = false;
		attackFinished = false;
		attackDelay = attackDelayTime;
	}
	
	//dont move if we are close enough
	if(distance_to_player <= keepDistance || nearThePlayer){
		nearThePlayer = true;
		//movDir = 0;
		xspeed = 0;
		yspeed = 0;
		
	}
	
	if(distance_to_player > 50){
		nearThePlayer = false;
	}
	
	// move the groblin
	x += xspeed;
	y += yspeed;
	
	
		
}

// Set Movement direction according to mouse position	

if(face == 8){face = 0;}
//image_xscale = sign(x - mouse_x);
if((abs(xspeed) + abs(yspeed)) != 0)
{
	sprite_index = walkSprite[face];
}
else
{
	sprite_index = B_sprite[face];		
}

if(!aggro){sprite_index = B_sprite[face]}



if (oPlayer.attacking == false){
	m_already_hit = false;
}



