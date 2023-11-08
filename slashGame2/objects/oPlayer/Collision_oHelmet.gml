/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
//


//

//currentItemCount++;
//inventoryArray[1] = other;

if (currentItemCount < inventorySlots){		
	if(currentItemCount >= 1){
		inventoryArray[currentItemCount] = other;
	}	
	currentItemCount++;


	if (currentHelm == noone){
		currentHelm = other;
		currentHelm_array = other.helmArray;
		other.isEquiped = true;
		inventoryArray[currentItemCount-1].isEquipped = true;
	}else{
		inventoryArray[currentItemCount-1].isEquipped = false;
	}
}

//show_debug_message( "current item update: " + string(inventoryArray[currentItemCount-1])  );
//show_debug_message("Current Item Count:" + string(currentItemCount))

armor += other.armor;

other.takenFlag = true;