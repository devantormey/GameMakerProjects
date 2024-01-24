/// @description Insert description here
// You can write your code in this editor

x = oPlayer.x;
y = oPlayer.y - oPlayer.centerYOffset - 3; 

if(image_index > 3){
	if(colliderFlag){
		_punch_collider = instance_create_layer(x, y, "Instances", oPunchCollider);
		oPunchCollider.owner = owner
		oPunchCollider.image_xscale = image_xscale
		colliderFlag = false;
	}
}



