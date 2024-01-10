/// @description Insert description here
// You can write your code in this editor
if(distance_to_object(oPlayer) < 100){
	target = oPlayer;
}

aimDir = point_direction(x,y,target.x,target.y)

face = round(aimDir/45);
if(face == 8){face = 0;}

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

//we just swung the swerd move it back to my origional spot
//if(attackDelay > 0){

//}

show_debug_message("startAttack: " + string(startAttack));
show_debug_message("attacking: " + string(attacking));
show_debug_message("primaryAttack: " + string(primaryAttack));
show_debug_message("attackFinished: " + string(attackFinished));