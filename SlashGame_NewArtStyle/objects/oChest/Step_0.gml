/// @description Insert description here
// You can write your code in this editor

if (distance_to_object(oPlayer) <= lootDistance){
	isLootable = true;

}else{
	isLootable = false;
}


if(isLootable && keyboard_check_pressed(ord("F"))){
	Control.isLootingChest = true;
	Control.lootingChest = self;
	if(inventoryObject.owner == id){
		inventoryObject.isOpen = true;	
		inventoryObject.visible = true;
		//objectForReal = inventoryObject;
	}
	oInventory.lootingInv = true;
	oInventory.openInv = true;
	oPlayer.isLooting = true;
	
	show_debug_message("trying to open chest")
	show_debug_message("my ID is: " + string(inventoryObject.owner) );
	show_debug_message("Create Loot Inventory Object: " + string(inventoryID) );
}

if(Control.isLootingChest == true) { 
	if(keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_tab)){
		//inventoryObject.isOpen = false;
		inventoryObject.isOpen = false;	
		inventoryObject.visible = false;
		show_debug_message("trying to close chest")
		//show_debug_message("my ID is: " + string(objectForReal.owner) );
		//show_debug_message("Inventory ID is: " + string(inventoryID) );
		
		Control.isLootingChest = false;
		Control.lootingChest = noone;
		oInventory.isLooting = false;
		oInventory.openInv = false;
		oPlayer.isLooting = false;
		
		
		
	}
}

