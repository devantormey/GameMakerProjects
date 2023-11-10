/// @description Insert description here
// You can write your code in this editor
if(openInv){
	var original_depth = depth;
	
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
			// Store the current depth
			
			// Set the depth to a lower value to draw on top
			
			//draw the isEquipped Highlight box
			if (inventoryArray[k].isEquipped == true) {
					depth = original_depth - 100; // Some very low value to make sure it is drawn above everything else
					var borderSize = 0; // Size of the border
					var borderColor = c_yellow; // Color of the border
					draw_set_color(borderColor);
					draw_rectangle(x + xOffset - borderSize, y + yOffset - borderSize, x + xOffset + 32 + borderSize, y + yOffset + 32 + borderSize, true);
					draw_set_color(c_white); // Reset the drawing color to default
					depth = original_depth;
			}
			// Reset the depth to its original value
			
		}
	}
	// Draw GUI event of the inventory object
	if (hoveredItemName != "") {
		//Draw the Name of the item
		var drawX = x + 33;
		var drawY = y + 140;
	    // Draw the item name
		draw_set_color(inventoryDarkBrown);
	    draw_text(drawX, drawY, hoveredItemName);
		
		//display the items stats
		drawX = mouse_x + 14 // Offset so it doesn't draw right under the mouse
	    drawY = mouse_y - 5;
		// Calculate the position and padding for the rectangle
		var rectX = drawX - 4; // 4 pixels padding on the left side
		var rectY = drawY - 4; // 4 pixels padding on the top side
		var rectWidth = 0; // Total padding on both sides
		var rectHeight = 0; //
		
		if(hoveredItem != noone) {
			draw_set_font(fnt_small);			
			var printString = "";
			var textWidth = 0;
			var textHeight = 0;
			switch(hoveredItem.type) {
							case 0:
								printString = "Dmg: " + string(hoveredItem.primaryDamage);
								textWidth = string_width(printString);
								textHeight = string_height(printString);
								rectWidth = textWidth + 5; // Total padding on both sides
								rectHeight = textHeight + 5; //
								break;
							case 1:
								printString = "Armor: " + string(hoveredItem.armor);
								textWidth = string_width(printString);
								textHeight = string_height(printString);
								rectWidth = textWidth + 5; // Total padding on both sides
								rectHeight = textHeight + 5; //
								break;
							case 2:
								printString = "Armor: " + string(hoveredItem.armor);
								textWidth = string_width(printString);
								textHeight = string_height(printString);
								rectWidth = textWidth + 5; // Total padding on both sides
								rectHeight = textHeight + 5; //
								break;
			}
			
			// Draw the rectangle
			draw_set_color(inventoryLightBrown); // Set color for the rectangle
			draw_rectangle(rectX, rectY, rectX + rectWidth, rectY + rectHeight, false);
			draw_set_color(c_black);
			draw_text(drawX, drawY, printString);
		}
		draw_set_color(c_black);
		draw_set_font(fnt_default);
	}


}

if(lootingInv){
	var original_depth = depth;
	
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
			// Store the current depth
			
			// Set the depth to a lower value to draw on top
			
			//draw the isEquipped Highlight box
			if (inventoryArray[k].isEquipped == true) {
					depth = original_depth - 100; // Some very low value to make sure it is drawn above everything else
					var borderSize = 0; // Size of the border
					var borderColor = c_yellow; // Color of the border
					draw_set_color(borderColor);
					draw_rectangle(x + xOffset - borderSize, y + yOffset - borderSize, x + xOffset + 32 + borderSize, y + yOffset + 32 + borderSize, true);
					draw_set_color(c_white); // Reset the drawing color to default
					depth = original_depth;
			}
			// Reset the depth to its original value
			
		}
	}
	// Draw GUI event of the inventory object
	if (hoveredItemName != "") {
		//Draw the Name of the item
		var drawX = x + 33;
		var drawY = y + 140;
	    // Draw the item name
		draw_set_color(inventoryDarkBrown);
	    draw_text(drawX, drawY, hoveredItemName);
		
		//display the items stats
		drawX = mouse_x + 14 // Offset so it doesn't draw right under the mouse
	    drawY = mouse_y - 5;
		// Calculate the position and padding for the rectangle
		var rectX = drawX - 4; // 4 pixels padding on the left side
		var rectY = drawY - 4; // 4 pixels padding on the top side
		var rectWidth = 0; // Total padding on both sides
		var rectHeight = 0; //
		
		if(hoveredItem != noone) {
			draw_set_font(fnt_small);			
			var printString = "";
			var textWidth = 0;
			var textHeight = 0;
			switch(hoveredItem.type) {
							case 0:
								printString = "Dmg: " + string(hoveredItem.primaryDamage);
								textWidth = string_width(printString);
								textHeight = string_height(printString);
								rectWidth = textWidth + 5; // Total padding on both sides
								rectHeight = textHeight + 5; //
								break;
							case 1:
								printString = "Armor: " + string(hoveredItem.armor);
								textWidth = string_width(printString);
								textHeight = string_height(printString);
								rectWidth = textWidth + 5; // Total padding on both sides
								rectHeight = textHeight + 5; //
								break;
							case 2:
								printString = "Armor: " + string(hoveredItem.armor);
								textWidth = string_width(printString);
								textHeight = string_height(printString);
								rectWidth = textWidth + 5; // Total padding on both sides
								rectHeight = textHeight + 5; //
								break;
			}
			
			// Draw the rectangle
			draw_set_color(inventoryLightBrown); // Set color for the rectangle
			draw_rectangle(rectX, rectY, rectX + rectWidth, rectY + rectHeight, false);
			draw_set_color(c_black);
			draw_text(drawX, drawY, printString);
		}
		draw_set_color(c_black);
		draw_set_font(fnt_default);
	}



}

