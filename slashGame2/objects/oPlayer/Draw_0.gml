// This is the Draw event for our player



if(face < 3 || face > 5){ // we are facing right up right and up
		
	var hand_x = x + hand_offset_x[face] + swing_offset_x;
	var hand_y = y + hand_offset_y[face] + swing_offset_y;
	
	draw_sprite(pHand, image_index, hand_x, hand_y);
	
	draw_self();
	
	if(currentArmor != noone){
		draw_sprite(currentArmor.ArmorArray[face], 0, x, y);
		
	}else{
		//draw_sprite(clothingArray[face], 0, x, y + clothingOffset); // clothing bottom
	}
	
	draw_sprite(H_sprite[face], 0, x, y + headYoffset + bobOffset); //head middle
	
	if(currentHelm != noone){
		draw_sprite(currentHelm.helmArray[face], 0, x, y + headYoffset + bobOffset);
	}	
	
	//draw_sprite(hairArray[face], 0, x, y + headYoffset + bobOffset); //hair on top
	
	
}else{ // upleft left downleft
	
	var hand_x = x + hand_offset_x[face] + swing_offset_x;
	var hand_y = y + hand_offset_y[face] + swing_offset_y;
	draw_self();
		
	if(currentArmor != noone){
		draw_sprite(currentArmor.ArmorArray[face], 0, x, y);
		
	}else{
		//draw_sprite(clothingArray[face], 0, x, y + clothingOffset); // clothing bottom
	}
		
	draw_sprite(H_sprite[face], 0, x, y + headYoffset + bobOffset);
	//draw_sprite(hairArray[face], 0, x, y + headYoffset + bobOffset);
	if(currentHelm != noone){
		draw_sprite(currentHelm.helmArray[face], 0, x, y + headYoffset + bobOffset);
	}
	draw_sprite(pHand, image_index, hand_x, hand_y);

}

//~~~~~~~~~~~~~~~~~~~~ Player UI Code ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Get the camera's top-left corner position
	var cam = view_camera[0];
	var cam_x = camera_get_view_x(cam);
	var cam_y = camera_get_view_y(cam);
	var offset_x = 20; // Offset from the camera view's edge
	var offset_y = cam_y + 20; // Offset from the camera view's edge
	var health_start = cam_x + offset_x; // X start position of the health bar
	//var y1 = cam_y + offset_y; // Y start position of the health bar
	var armor_start = cam_x + 300; // X end position of the health bar
	//var y2 = y1 + bar_height; // Y end position of the health bar
	draw_sprite(sHealthHeart,0,health_start,offset_y);
	draw_set_color(fontRed);
	draw_set_font(fnt_big);
	draw_text(health_start + 42, offset_y + 2, charHealth);
	draw_set_font(fnt_default);

























	//~~~~~~~~~~~~ Code for drawing a health bar (instead of a number) ~~~~~~~~~~~~~~~~~~~~
	//// Calculate the health percentage
	//var health_percentage = charHealth/max_health;

	//// Draw event of the player object or a UI object
	//var bar_full_width = 200; // The full width of the health bar
	//var bar_height = 20;

	//// Calculate the current width of the health bar
	//var bar_current_width = bar_full_width * health_percentage;

	//// Get the camera's top-left corner position
	//var cam = view_camera[0];
	//var cam_x = camera_get_view_x(cam);
	//var cam_y = camera_get_view_y(cam);

	//var offset_x = 20; // Offset from the camera view's edge
	//var offset_y = 20; // Offset from the camera view's edge
	//var x1 = cam_x + offset_x; // X start position of the health bar
	//var y1 = cam_y + offset_y; // Y start position of the health bar
	//var x2 = x1 + bar_current_width; // X end position of the health bar
	//var y2 = y1 + bar_height; // Y end position of the health bar

	//// Draw the background of the health bar (empty part)
	//draw_set_color(c_gray);
	//draw_rectangle(x1, y1, x1 + bar_full_width, y2, false);

	//// Set the color for the health bar
	//if (health_percentage > 0.5) {
	//    draw_set_color(c_green); // More than 50% health
	//} else if (health_percentage > 0.25) {
	//    draw_set_color(c_yellow); // Between 25% and 50% health
	//} else {
	//    draw_set_color(c_red); // Less than 25% health
	//}

	//// Draw the current health (filled part)
	//draw_rectangle(x1, y1, x2, y2, false);
	////}





