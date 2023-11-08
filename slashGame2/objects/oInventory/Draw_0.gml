/// @description Insert description here
// You can write your code in this editor
if(openInv){
	
	if(array_length(oPlayer.inventoryArray) <= 21) {
		inventoryArray = oPlayer.inventoryArray;

	}
	
	draw_self();
	var xOffset
	var yOffset
	
	for(var k = 0; k < oPlayer.currentItemCount; k++){
		if(inventoryArray[k] != noone){
			
			xOffset = positionsX[k];
			
			yOffset = positionsY[k];
			
			//show_debug_message( "current K: " + string(k)  );
			 
			currentSprite = inventoryArray[k].inventorySprite;
			
			draw_sprite(currentSprite , 0 , x + xOffset, y + yOffset);
		// we need to draw the equiped sprites if they are the appropriate type and equiped
		// type 0 - weapon
		// type 1 - helmet
		// type 2 - armor

			switch(inventoryArray[k].type) {
				case 0:
					if(inventoryArray[k].isEquipped){			 
						currentSprite = inventoryArray[k].equippedSprite;
					
						draw_sprite(currentSprite , 0 , x + weaponEquipedX, y + weaponEquipedY);
					}
					break;
				case 1:
					if(inventoryArray[k].isEquipped){			 
						currentSprite = inventoryArray[k].equippedSprite;
					
						draw_sprite(currentSprite , 0 , x + helmEquipedX, y + helmEquipedY);
					}
					break;
				case 2:
					if(inventoryArray[k].isEquipped){			 
						currentSprite = inventoryArray[k].equippedSprite;
					
						draw_sprite(currentSprite , 0 , x + armorEquipedX, y + armorEquipedY);
					}
					break;
			}
			
			
		}
	}
}



