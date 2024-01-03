if (oPlayer.secondaryAttack && swingingFlag){
	other.speed = 0;
	other.visible = false;
	//var break_angle = other.image_angle
	var dir = other.direction;
	var broke_arrow = instance_create_layer(other.x, other.y, "Instances", oArrowBreak);
	broke_arrow.x += lengthdir_x(3,dir);
	broke_arrow.y += lengthdir_y(3,dir);
	broke_arrow.image_angle = other.image_angle
	with(other){
		instance_destroy();
	}
}