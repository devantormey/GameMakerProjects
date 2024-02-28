/// @description Insert description here
// You can write your code in this editor

// Calculate a random position just outside the camera view
var cam = view_camera[0];
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);
var cam_width = camera_get_view_width(cam);
var cam_height = camera_get_view_height(cam);

// Randomize the start side (0: left/right, 1: top/bottom)
var side = irandom(1);

var _x, _y;
if (side == 0) {
    _x = choose(cam_x - 32, cam_x + cam_width + 32); // Just outside horizontally
    _y = irandom_range(cam_y, cam_y + cam_height);
} else {
    _x = irandom_range(cam_x, cam_x + cam_width);
    _y = choose(cam_y - 32, cam_y + cam_height + 32); // Just outside vertically
}

// Create the object at the calculated position
var _seal_index = irandom_range(0,1);
var _seal_obj = instance_create_depth(_x, _y, 0, oSeal);
_seal_obj.image_decider = _seal_index;
// Assign a random direction (0-359 degrees) to the object
var _mov_dir =  point_direction(_x,_y, oBoat.x,oBoat.y);
_seal_obj.direction = _mov_dir
_seal_obj.speed = 1; // Adjust speed as needed
_seal_obj.image_angle = _mov_dir



// Reset the alarm
alarm[0] = 15 * room_speed;
