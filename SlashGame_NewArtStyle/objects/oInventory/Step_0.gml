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
	
	if(lootingInv == false){
	    openInv = !openInv; // This toggles the boolean value
		visible = openInv;  // This sets the visibility to the same value as openInv
		Control.gamePaused = !Control.gamePaused;
	}else{
		openInv = false;
		//visible = lootingInv;
	}
}

if(openInv){
	
	if(lootingInv){
		// Get the camera's top-left corner position
		
		cam = view_camera[0];
		cam_x = camera_get_view_x(cam);
		cam_y = camera_get_view_y(cam);

		offset_x = 10; // Offset from the camera view's edge
		offset_y = 42; // Offset from the camera view's edge
		x = cam_x + offset_x; // X start position of the health bar
		y = cam_y + offset_y; // Y start position of the health bar
		   
	    visible = true;  // This sets the visibility to the same value as openInv
		
	}
	
	// First, determine if the mouse is being clicked
	var mouseX = mouse_x;
	var mouseY = mouse_y;
	
	// check for equiping and unequiping in the inventory
	if (mouse_check_button_pressed(mb_left)) {
	    // Get the mouse coordinates
	    
		
		show_debug_message( "you clicked!");
    
	    // Loop through all inventory slots
	    for (var i = 0; i < array_length(inventoryArray); i++) {
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
							case 0: //weapon type
								if (oPlayer.currentSword == noone){
									//in case you need to create an additional instance
									//var objectType = item.object_index; 
									
									//set the current sword to this item (note item is just a pointer to the object)
									oPlayer.currentSword = item;
									
									// just some house keeping, not sure if necessary, but making sure we know the state
									oPlayer.currentSword.isEquipped = true;
									oPlayer.currentSword.visible = true;
									oPlayer.currentSword.solid = true;
									equipFlag = false;
									}else{
										equipFlag = true;
										inventoryArray[i].isEquipped = false;
									}
								
								break;
							case 1: //helmet type
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
							case 2: //armor type
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
								oPlayer.currentSword.isEquipped = false;
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
	for (var i = 0; i < array_length(inventoryArray); i++) {
		// Determine the boundaries of the current slot
		var slotXStart = x  + positionsX[i];
		var slotXEnd = slotXStart + 32; // Assuming you have an inventory slot sprite
		var slotYStart = y + positionsY[i];
		var slotYEnd = slotYStart + 32;
	
		//check if it is in an assigned slot
		if (mouseX >= slotXStart && mouseX <= slotXEnd && mouseY >= slotYStart && mouseY <= slotYEnd) {							
			if (inventoryArray[i] != noone) {
				hoveredItem = inventoryArray[i]
				hoveredItemName = hoveredItem.name
	
			}
		}
		
		}
	//this line checks if we are hovering the mouse outside the possible bounds of current number of items in the inventory
	// it is trying to be clever as oPlayer.currentItemCount is always going to be 1 greater than the last index in inventoryArray.
	// we need to check if the mouse is hovering in a box drawn to the size of the number of items (not the index of the array) hope that makes sense
	//sorry future devan
	var checkIndex = oPlayer.currentItemCount;
	if (checkIndex >= maxNumber_items ){ checkIndex = checkIndex - 1;}
	if ( mouseX < (x + positionsX[0]) || mouseX > (x + positionsX[checkIndex]) || mouseY < (y + positionsY[0]) ||  mouseY > (y + positionsY[checkIndex] + 32) ) {
		hoveredItemName = "";
		hoveredItem = noone;
	}
	
	if (mouse_check_button_pressed(mb_left)) {
		//Allow unequip from weapon slot
		if(oPlayer.currentSword != noone){
			if (mouseX >= x + weaponEquipedX && mouseX <= x + weaponEquipedX + 42 && mouseY >= y + weaponEquipedY && mouseY <= y + weaponEquipedY + 63 ) {
				var current_weapon = oPlayer.currentSword;
				for (var i = 0; i < oPlayer.currentItemCount; i++) {
					if(current_weapon.id == inventoryArray[i].id){
						inventoryArray[i].isEquipped = false;
						oPlayer.inventoryArray[i].isEquipped = false;
					}
				}
				oPlayer.currentSword = noone;
			}
		}
		//Allow unequip from armor slot
		if(oPlayer.currentArmor != noone){
			if (mouseX >= x + armorEquipedX && mouseX <= x + armorEquipedX + 42 && mouseY >= y + armorEquipedY && mouseY <= y + armorEquipedY + 32 ) {
				var current_armor = oPlayer.currentArmor;
				for (var i = 0; i < oPlayer.currentItemCount; i++) {
					if(current_armor.id == inventoryArray[i].id){
						inventoryArray[i].isEquipped = false;
						oPlayer.inventoryArray[i].isEquipped = false;
						oPlayer.armor -= current_armor.armor;
					}
				}
				oPlayer.currentArmor = noone;
			}
		}
		//Allow unequip from helm slot
		if(oPlayer.currentHelm != noone){
			if (mouseX >= x + helmEquipedX && mouseX <= x + helmEquipedX + 42 && mouseY >= y + helmEquipedY && mouseY <= y + helmEquipedY + 32 ) {
				var current_helm = oPlayer.currentHelm;
				for (var i = 0; i < oPlayer.currentItemCount; i++) {
					if(current_helm.id == inventoryArray[i].id){
						inventoryArray[i].isEquipped = false;
						oPlayer.inventoryArray[i].isEquipped = false;
						oPlayer.armor -= current_helm.armor;
					}
				}
				oPlayer.currentHelm = noone;
			}
		}
	}
	
	oPlayer.inventoryArray = inventoryArray;
	
}






