
var startX = 100; // X-coordinate for player start
var startY = 1000; // Y-coordinate for player start
var layer_name = "Instances"; // The name of the layer where you want to place the player



var control_instance = instance_create_layer(0, 0, layer_name, Control);
// Create an instance of the player at the start position
var playerInstance = instance_create_layer(startX, startY, layer_name, oPlayer);

//auto_generate_room2(3200, 3200, 32);
auto_generate_room2(3200, 3200, 32, 2, 30);


