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
		audio_play_sound(snd_item_pickup_1, 1, false, .8, 0, 1.2);
	}else{
		inventoryArray[currentItemCount-1].isEquipped = false;
		audio_play_sound(snd_item_pickup_2, 1, false, .8, 0, 1.2);
	}
}

//show_debug_message( "current item update: " + string(inventoryArray[currentItemCount-1])  );
//show_debug_message("Current Item Count:" + string(currentItemCount))

if (other.isEquiped){armor += other.armor;}

other.takenFlag = true;