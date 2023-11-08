/// @description Insert description here
// You can write your code in this editor

/// @description Insert description here
// You can write your code in this editor


if (currentItemCount < inventorySlots){		
	if(currentItemCount >= 1){
		inventoryArray[currentItemCount] = other;
	}	
	currentItemCount++;
	
	if (currentArmor == noone){
		currentArmor = other;
		currentArmor_array = other.ArmorArray;
		other.isEquiped = true;
		inventoryArray[currentItemCount-1].isEquipped = true;
	}else{
		inventoryArray[currentItemCount-1].isEquipped = false;
	}
}

armor += other.armor;

other.takenFlag = true;



