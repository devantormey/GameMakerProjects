/// @description Insert description here
// You can write your code in this editor
// check for equiping and unequiping in the inventory
if (isOpen){
	var mouseX = mouse_x;
	var mouseY = mouse_y;  

	if (mouse_check_button_pressed(mb_left)) {
		// Get the mouse coordinates
		// First, determine if the mouse is being clicked
	  
		
		show_debug_message( "you clicked!");
	
		var indexToRemove = -1;
		// Loop through all inventory slots
		for (var i = 0; i < array_length(inventoryArray); i++) {
			// Determine the boundaries of the current slot
			var slotXStart = x  + positionsX[i];
			var slotXEnd = slotXStart + 32; // Assuming you have an inventory slot sprite
			var slotYStart = y + positionsY[i];
			var slotYEnd = slotYStart + 32;
			
		    if(inventoryArray[i] != noone){
				// Check if the mouse click is within the boundaries of the slot
				if (mouseX >= slotXStart && mouseX <= slotXEnd && mouseY >= slotYStart && mouseY <= slotYEnd) {
					show_debug_message( "you clicked an item!");
					var playerItemIndex = oPlayer.currentItemCount
				
					if(playerItemIndex < oInventory.maxNumber_items){
					
						var current_item = instance_create_depth(0, 0, 0, inventoryArray[i]);
					
						show_debug_message( "moving item: " + string(current_item.name));
						current_item.isEquipped = false;
				
						oInventory.inventoryArray[playerItemIndex] = current_item;
				
						oPlayer.inventoryArray[playerItemIndex] = current_item;
				
						oPlayer.currentItemCount ++;
				
						indexToRemove = i;
				
						
						instance_deactivate_object(current_item);
						show_debug_message( string(currentItemCount) + " item(s) left in box.");
					}
			
				}	
			}

		}
		
		
		if(indexToRemove != -1){		
			if(inventoryArray[indexToRemove] != noone){
					inventoryArray[indexToRemove] = noone;
					currentItemCount--;
			}
		}
			
		

	}
	
}
if(Control.isLootingChest != true){
	isOpen = false;
}

//if (distance_to_object(oPlayer) <= 2){
//	show_debug_message("Looting chest: " + string(owner) );
//	show_debug_message("isOpen: " + string(isOpen) );
//	show_debug_message("control.isLooting: " + string(Control.isLootingChest) );

//}