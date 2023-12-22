/// @description Insert description here
// You can write your code in this editor
draw_self();

if(isOpen){
	//show_debug_message("trying to draw chest!")
	var cam = view_camera[0];
	var cam_x = camera_get_view_x(cam);
	var cam_y = camera_get_view_y(cam);

	var offset_x = 288 + 32; // Offset from the camera view's edge
	var offset_y = 64; // Offset from the camera view's edge
	
	//x = oPlayer.x;
	//y = oPlayer.y;
	
	x = cam_x + offset_x; // X start position of the health bar
	y = cam_y + offset_y; // Y start position of the health bar
	visible = true;
	depth = oPlayer.depth - 4;
	
	
	var xOffset
	var yOffset
	var currentSprite = noone;
	
	if(currentItemCount > 0){
		for(var k = 0; k < array_length(inventoryArray); k++){
			if(inventoryArray[k] != noone){
			
				xOffset = positionsX[k];
			
				yOffset = positionsY[k];
			
				var current_item = instance_create_depth(0, 0, 0, inventoryArray[k]);
			
				//show_debug_message( "current K: " + string(k)  );
				//show_debug_message( "item Name " + string(current_item.name)  );
				currentSprite = current_item.inventorySprite;
			
			
				draw_sprite(currentSprite , 0 , x + xOffset, y + yOffset);
				instance_deactivate_object(current_item);
			}
		}
	}

}else{
	visible = false;
}




