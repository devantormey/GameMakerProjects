/// @description Insert description here
// You can write your code in this editor


positionsX = [];
positionsY = [];

cols = 7;
rows = 3;

inventoryArray = [];
currentItemCount = 0;
maxNumber_items = 21;

//code to create the loot here

//// test items
itemSpawnCount = random_range(0,10);

itemSpawnList = [oIronArmor,oSimpleClothes,oSimpleClothes,oSimpleClothes,oRangerHood,oLeatherArmor,oLeatherHelm];

if (itemSpawnCount > 0){
	for(var k = 0; k < itemSpawnCount; k++;){
		inventoryArray[k] = itemSpawnList[random_range(0,array_length(itemSpawnList))];
		//inventoryArray[k] = oIronAxe; // for testing a single item
		currentItemCount++;
	}
}




//test full
//for(var k = 0; k < maxNumber_items; k++;){
//	inventoryArray[k] = oRangerHood;
//	currentItemCount++;
//}

currentX = 32;
currentY = 52;



owner = noone;
isOpen = false;
show_debug_message("created inventory for chest")
depth = oPlayer.depth - 6;

for (var k = 1; k <= maxNumber_items; k++){
	
	//assign the x y coordinates starting at the 0th position
	positionsX[k-1] = currentX;
	positionsY[k-1] = currentY;
	//move x over 32 pixels
	currentX = currentX + 32;
	
	//we need to reset and update every row
	if(k % 7 == 0){
		//update y
		currentY = currentY + 32;
		//reset  x
		currentX = 32;
	}

}

// Need some variables for hovering over items
//
hoveredItemName = "";
hoveredItem = noone;

visible = false;

