/// draws all of the items for player
draw_self();

// Save the current depth
//var original_depth = depth;

// Set the depth to a lower value than the player's current depth to draw something above the player
//depth = original_depth - 1;
if (face == 6){
	if(currentArmor != noone){
		draw_sprite(currentArmor_array[face], 0, x, y)
	}


	draw_sprite(H_sprite[face], 0, x, y + headYoffset + bobOffset);
	
	if(currentHelm != noone){
		draw_sprite(currentHelm_array[face], 0, x, y + headYoffset + bobOffset);
	}


}
else {
	draw_sprite(H_sprite[face], 0, x, y + headYoffset + bobOffset);
	
	if(currentHelm != noone){
		draw_sprite(currentHelm_array[face], 0, x, y + headYoffset + bobOffset);
	}

	if(currentArmor != noone){
		draw_sprite(currentArmor_array[face], 0, x, y)
	}
}




// Restore the original depth after drawing
//depth = original_depth;


// Calculate the health percentage
var health_percentage = charHealth/max_health;

// Draw event of the player object or a UI object
var bar_full_width = 200; // The full width of the health bar
var bar_height = 20;

// Calculate the current width of the health bar
var bar_current_width = bar_full_width * health_percentage;

// Get the camera's top-left corner position
var cam = view_camera[0];
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);

var offset_x = 20; // Offset from the camera view's edge
var offset_y = 20; // Offset from the camera view's edge
var x1 = cam_x + offset_x; // X start position of the health bar
var y1 = cam_y + offset_y; // Y start position of the health bar
var x2 = x1 + bar_current_width; // X end position of the health bar
var y2 = y1 + bar_height; // Y end position of the health bar

// Draw the background of the health bar (empty part)
draw_set_color(c_gray);
draw_rectangle(x1, y1, x1 + bar_full_width, y2, false);

// Set the color for the health bar
if (health_percentage > 0.5) {
    draw_set_color(c_green); // More than 50% health
} else if (health_percentage > 0.25) {
    draw_set_color(c_yellow); // Between 25% and 50% health
} else {
    draw_set_color(c_red); // Less than 25% health
}

// Draw the current health (filled part)
draw_rectangle(x1, y1, x2, y2, false);
//}





