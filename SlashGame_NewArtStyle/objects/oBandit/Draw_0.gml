// ~~~~~~~~~~~~~~~~~~ This is the shader code ~~~~~~~~~~~~~~~~~~~~~~
//very unfinished
////shader enable:
//// Set the shader
//shader_set(shd_simpleShadow);

//// Draw the shadow slightly offset below the player
//var shadowOffsetY = -8; // Adjust this value as needed
//draw_sprite_ext(sprite_index, image_index, x, y + shadowOffsetY, image_xscale, image_yscale, 45, image_blend, image_alpha);

//// Reset to the default shader
//shader_reset();

//~~~~~~~~~~~~ Begin Player Draw Code ~~~~~~~~~~~~~~~~~~

/// draw the player
draw_self();



// ~~~~~~~~~~~~~ Set the armor and helmet sprite according to the mouse orientation ~~~~~~~~~~~~~~~~~~~
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