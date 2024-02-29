/// @description Insert description here
// You can write your code in this editor




if(owner.isTalking){
	draw_self();
	var cam = view_camera[0];
	var cam_x = camera_get_view_x(cam);
	var cam_y = camera_get_view_y(cam);
	draw_sprite(owner.portrait, owner.mood, cam_x + owner.portrait_offset_x, cam_y + owner.portrait_offset_y);
	show_debug_message("owner Mood: " + string(owner.mood))
	x = cam_x + owner.chat_offset_x;
	y = cam_y + owner.chat_offset_y;
	responseOffsetX = owner.portrait_offset_x/2.5;
	
	if(owner.dialogue.hasResponse){
		draw_sprite(sResponseBox, 0, x + responseOffsetX , y + responseOffsetY);	
			if(owner.dialogue.numResponse > 0){
				
				owner.dialogue.responseX = x + responseOffsetX + 6
				owner.dialogue.responseY = y + responseOffsetY + 8
				//for (var i = 0; i < _dialogue.numResponse; i += 1){
					//draw_sprite(sIndicator, 0, x + responseOffsetX + 6, y + responseOffsetY + 8 + i*30);
					
				//}
			}				
	}
}else{
	visible = false;
	if(owner.dialogue != noone){
		if(owner.dialogue.owner == owner.id){
			owner.dialogue.displayText = false;
		}
	}
}

