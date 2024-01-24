/// @description Insert description here
// You can write your code in this editor

//~~~~~~~~~~~~ Begin Player Draw Code ~~~~~~~~~~~~~~~~~~

if(face < 2 || face > 6){ // we are facing right up right and up
		
	var hand_x = x + hand_offset_x[face] + swing_offset_x;
	var hand_y = y + hand_offset_y[face] + swing_offset_y;
	
	draw_self();
	
	draw_sprite(clothingArray[face], 0, x, y + clothingOffset); // clothing bottom
	draw_sprite(H_sprite[face], 0, x, y + headYoffset + bobOffset); //head middle
	draw_sprite(hairArray[face], 0, x, y + headYoffset + bobOffset); //hair on top
	draw_sprite(hatArray[face], 0, x, y + headYoffset + bobOffset); //hair on top
	draw_sprite(pHand, image_index, hand_x, hand_y);
	
}else{ // upleft left downleft
	var hand_x = x + hand_offset_x[face] + swing_offset_x;
	var hand_y = y + hand_offset_y[face] + swing_offset_y;
	draw_self();
	
	// ~~~~~~~~~~~~~ Set the armor and helmet sprite according to the mouse orientation ~~~~~~~~~~~~~~~~~~~
	if (face == 6){ //facing down
		
	

		draw_sprite(clothingArray[face], 0, x, y + clothingOffset);
		draw_sprite(H_sprite[face], 0, x, y + headYoffset + bobOffset);
		draw_sprite(hairArray[face], 0, x, y + headYoffset + bobOffset);
		draw_sprite(hatArray[face], 0, x, y + headYoffset + bobOffset); //hair on top
		draw_sprite(pHand, image_index, hand_x, hand_y);

	}
	else {
		
		
	
		

		
		draw_sprite(pHand, image_index, hand_x, hand_y);
		draw_sprite(clothingArray[face], 0, x, y + clothingOffset);
		draw_sprite(H_sprite[face], 0, x, y + headYoffset + bobOffset);
		draw_sprite(hairArray[face], 0, x, y + headYoffset + bobOffset);
		draw_sprite(hatArray[face], 0, x, y + headYoffset + bobOffset); //hair on top
		
	}


		
	}





