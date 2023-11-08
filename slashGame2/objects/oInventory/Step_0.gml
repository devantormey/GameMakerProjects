/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(vk_tab)) {
	// Get the camera's top-left corner position
	cam = view_camera[0];
	cam_x = camera_get_view_x(cam);
	cam_y = camera_get_view_y(cam);

	offset_x = 180; // Offset from the camera view's edge
	offset_y = 42; // Offset from the camera view's edge
	x = cam_x + offset_x; // X start position of the health bar
	y = cam_y + offset_y; // Y start position of the health bar
	
    openInv = !openInv; // This toggles the boolean value
    visible = openInv;  // This sets the visibility to the same value as openInv
	Control.gamePaused = !Control.gamePaused;
}

if(openInv){
	// First, determine if the mouse is being clicked
	var mouseX = mouse_x;
	var mouseY = mouse_y;
	
	if (mouse_check_button_pressed(mb_left)) {
	    // Get the mouse coordinates
	    
		
		show_debug_message( "you clicked!");
    
	    // Loop through all inventory slots
	    for (var i = 0; i < oPlayer.currentItemCount; i++) {
	        // Determine the boundaries of the current slot
	        var slotXStart = x  + positionsX[i];
	        var slotXEnd = slotXStart + 32; // Assuming you have an inventory slot sprite
	        var slotYStart = y + positionsY[i];
	        var slotYEnd = slotYStart + 32;
        
	        // Check if the mouse click is within the boundaries of the slot
	        if (mouseX >= slotXStart && mouseX <= slotXEnd && mouseY >= slotYStart && mouseY <= slotYEnd) {
				
				show_debug_message( "You clicked an Item!" );
	            // Here we assume inventoryArray[i] is the instance id of the item in the inventory
				var item  = noone;
				
				if (inventoryArray[i] != noone) {
					item = inventoryArray[i];
				
					show_debug_message( "item Name: " + string(item.name) );
					show_debug_message( "item type: " + string(item.type) );
				}
				
	            if (inventoryArray[i] != noone) { // Make sure there's an item in the slot
	                // Toggle the isEquipped status
					
					
	                inventoryArray[i].isEquipped = !item.isEquipped;
					var equipFlag = false;
					var un_equipFlag = false;
					//equipToggled = !equipToggled;
                
	                // If the item is now equipped, do something
	                if (inventoryArray[i].isEquipped) {
			            switch(item.type) {
							case 0:
								oPlayer.currentSword = item;
								break;
							case 1:
								if (oPlayer.currentHelm == noone){
									oPlayer.currentHelm = item;
									oPlayer.currentHelm_array = item.helmArray;
									oPlayer.armor += item.armor;
									oPlayer.armor = clamp(oPlayer.armor,0,100);
									equipFlag = false;
								}else{
									equipFlag = true;
									inventoryArray[i].isEquipped = false;
								}
								break;
							case 2:
								if (oPlayer.currentArmor == noone){
									oPlayer.currentArmor = item;
									oPlayer.currentArmor_array = item.ArmorArray;
									oPlayer.armor += item.armor;
									oPlayer.armor = clamp(oPlayer.armor,0,100);
								}else{
									equipFlag = true;
									inventoryArray[i].isEquipped = false;
								}
								
								break;
						}
					}
					 // If the item is now unequiped, do something
					if (inventoryArray[i].isEquipped == false && equipFlag == false) {
			            switch(item.type) {
							case 0:
								oPlayer.currentSword = noone;
								break;
							case 1:
								oPlayer.currentHelm = noone;
								oPlayer.currentHelm_array = noone;
								oPlayer.armor -= item.armor;
								oPlayer.armor = clamp(oPlayer.armor,0,100);
								break;
							case 2:		
								oPlayer.currentArmor = noone;
								oPlayer.currentArmor_array = noone;
								oPlayer.armor -= item.armor;
								oPlayer.armor = clamp(oPlayer.armor,0,100);
								break;
						}
					}
				}
	            // Break the loop since we found the clicked slot
	            break;
	        }
	    }
	}
	
	// let's figure out if we are hovering over an item
	for (var i = 0; i < oPlayer.currentItemCount; i++) {
	    // Determine the boundaries of the current slot
	    var slotXStart = x  + positionsX[i];
	    var slotXEnd = slotXStart + 32; // Assuming you have an inventory slot sprite
	    var slotYStart = y + positionsY[i];
	    var slotYEnd = slotYStart + 32;
	
		if (mouseX >= slotXStart && mouseX <= slotXEnd && mouseY >= slotYStart && mouseY <= slotYEnd) {							
			if (inventoryArray[i] != noone) {
				hoveredItem = inventoryArray[i]
				hoveredItemName = hoveredItem.name
	
			}
		}
		
		}
		if ( mouseX < (x + positionsX[0]) || mouseX > (x + positionsX[oPlayer.currentItemCount]) || mouseY < (y + positionsY[0]) ||  mouseY > (y + positionsY[oPlayer.currentItemCount] + 32) ) {
			hoveredItemName = "";
			hoveredItem = noone;
		}
}


//i know this works 



