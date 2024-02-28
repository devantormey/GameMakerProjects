/// @description Insert description here
// You can write your code in this editor

if(startFlag){

depth = owner.depth - 10;
image_xscale = owner.image_xscale;
startFlag = false;
}

x = owner.x;
y = owner.y - owner.centerYOffset - 3; 

if(image_index > 3){
	if(colliderFlag){
		_punch_collider = instance_create_layer(x, y, "Instances", oPunchCollider);
		oPunchCollider.owner = owner
		oPunchCollider.image_xscale = image_xscale
		colliderFlag = false;
	}
}



