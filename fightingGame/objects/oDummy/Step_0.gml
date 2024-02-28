/// @description Insert description here
// You can write your code in this editor
// Check if the player is on the ground
onGround = place_meeting(x, y + 2, groundBlock); // Replace 'obj_ground' with your ground object
if(onGround){	
	var _cur_grnd = instance_nearest(x,y,groundBlock);
	y = _cur_grnd.y
};

// Apply gravity if not on ground and not jumping
if (!onGround) {
    fallSpeed += _gravity; // Increase falling speed by gravity
    y += fallSpeed; // Apply the falling speed to the vertical position
} else if (onGround) {
    fallSpeed = 0; // Reset falling speed when on the ground
}


x += xspeed;
y += yspeed;

if(xspeed != 0){
		if(xspeed > 0){
			xspeed -= decel;
		}
		if(xspeed < 0){
			xspeed += decel;
		}
		if(abs(xspeed) <= .2) {
			xspeed = 0;
		}
	}
	
if (place_meeting(x, y, oPunchCollider)) {
   show_debug_message("we got hit  -from dummy")
   if(oPunchCollider.owner.x < x){
		xspeed += oPunch.impact;
	}
	if(oPunchCollider.owner.x  > x){
		xspeed -= oPunch.impact;
	}
}	

if (place_meeting(x, y, oMagicBall)) {	
		if(oMagicBall.owner != id && oMagicBall.firstHit_id != id){
			//xspeed = 0;
			oMagicBall.firstHit_id = id;
		   show_debug_message("we got hit  -from player1")
		   if(oMagicBall.x < x){
				xspeed += oMagicBall.impact;
			}
			if(oMagicBall.x  > x){
				xspeed -= oMagicBall.impact;
			}
			
		}
}