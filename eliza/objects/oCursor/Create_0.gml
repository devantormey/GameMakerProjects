/// @description Insert description here
// You can write your code in this editor

previous_distance = 0;
previous_x = x;
previous_y = y;
//           right    upright      up         upleft        left      downleft      down      downright
handOffset = [0,       -5,          -5,         -5,            0,         5,           5,           5 ];
//handOffset = [0,0,0,0,0,0,0,0];

handMode = false;
