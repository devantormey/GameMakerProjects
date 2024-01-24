/// @description Insert description here
// You can write your code in this editor
if(speed >  0){sprite_index = sKomooTopRun}

var _running_angle = point_direction(x,y,oRaceCar.x,oRaceCar.y);

	//move to average ange
if(angle_difference(direction,_running_angle) > 0){
	direction -= turnRate;
}else{
	direction += turnRate;
}
	
var _desired_angle =  direction - 90;
if (_desired_angle < 0) {
    _desired_angle += 360;
}

if(abs(_desired_angle - last_angle) > 3){
	image_angle = direction - 90;
}

last_angle = image_angle;