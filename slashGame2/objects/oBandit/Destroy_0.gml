/// @description Insert description here
// You can write your code in this editor

//instance_create_layer(x,  y + centerYOffset, "Instances", oBloodSpurt);

var bloodList = [];
bloodList[0] = instance_create_layer(x, y + centerYOffset, "Instances", oBloodSpurt);
bloodList[0].image_angle = 0;
for (var i = 1; i <= 10; i++) {
	bloodList[i] = instance_create_layer(x, y + centerYOffset, "Instances", oBloodSpurt);
	bloodList[i].image_angle = i*36;
}
with(weapon){
	instance_destroy();
}




