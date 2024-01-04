/// @description Insert description here
// You can write your code in this editor

//inventoryArray = [];
//curentItemCount = 0;
maxItemCount = 21;


// Assign items to the chest (this can be as complex as we need)
//inventoryArray[0] = oRangerHood;
//currentItemCount = 1;



lootDistance = 2;
isLootable = false;


inventoryObject = instance_create_layer(x, y, "Instances", oLootInventory);
inventoryObject.owner = id;
inventoryID = inventoryObject.id;

show_debug_message("my ID is: " + string(inventoryObject.owner) );
show_debug_message("Inventory ID is: " + string(inventoryID) );


objectForReal = noone;

depth = oPlayer.depth + 4;
//inventoryObject.inventoryArray = inventoryArray;
//inventoryObject.currentItemCount = currentItemCount;