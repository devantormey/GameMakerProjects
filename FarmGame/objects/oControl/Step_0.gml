/// @description Insert description here
// You can write your code in this editor

if(mouse_check_button_pressed(mb_left)){
	var menuChecker_F = point_in_rectangle(mouse_x,mouse_y, FoodButton.x,FoodButton.y, FoodButton.x + sprite_get_width(sFood) + 40, FoodButton.y + sprite_get_height(sFood) + 5 )
	var menuChecker_P = point_in_rectangle(mouse_x,mouse_y, PokeButton.x,PokeButton.y,PokeButton.x + sprite_get_width(sPoke) + 40,PokeButton.y + sprite_get_height(sPoke) + 5 )
	var menuChecker_A = point_in_rectangle(mouse_x,mouse_y, AddFish.x,AddFish.y,AddFish.x + sprite_get_width(sAddFish) + 40,AddFish.y + sprite_get_height(sAddFish) + 5 )
	show_debug_message("poke Flag: " + string(menuChecker_P))
	show_debug_message("Food Flag: " + string(menuChecker_F))
	if(PokeButton.we_pressed_poke){
		if(!point_in_rectangle(mouse_x,mouse_y, VolumeButton.x,VolumeButton.y,VolumeButton.x + sprite_get_width(speakerIkon) + 40, VolumeButton.y + sprite_get_height(speakerIkon) + 5 ) && !menuChecker_F && !menuChecker_P && !menuChecker_A ){
			instance_create_layer(mouse_x,mouse_y,"Instances",oRipple)
			audio_play_sound(SplashFootstep_S08WR_97,1,false,.5,0,1.2)

		}
	}
	if(FoodButton.we_pressed_food){
		
		if(!point_in_rectangle(mouse_x,mouse_y, VolumeButton.x,VolumeButton.y,VolumeButton.x + sprite_get_width(speakerIkon) + 40,VolumeButton.y + sprite_get_height(speakerIkon) + 5 ) && !menuChecker_F && !menuChecker_P && !menuChecker_A  ){
			instance_create_layer(mouse_x,mouse_y,"Instances",oRippleFriend)
			instance_create_layer(mouse_x,mouse_y,"Instances",oFood)
			audio_play_sound(SplashBathTub_SFXB_4833,1,false,.5,0,1.2)

		}
	}
	if(AddFish.we_pressed_fish){
		
		if(!point_in_rectangle(mouse_x,mouse_y, VolumeButton.x,VolumeButton.y,VolumeButton.x + sprite_get_width(speakerIkon) + 40,VolumeButton.y + sprite_get_height(speakerIkon) + 5 ) && !menuChecker_F && !menuChecker_P && !menuChecker_A  ){
			fishCount++;
			if(fishCount < maxFishCount){
				instance_create_layer(mouse_x,mouse_y,"Instances",oRippleFriend)
				instance_create_layer(mouse_x,mouse_y,"Instances",oBoid)
				audio_play_sound(SplashBathTub_SFXB_4833,1,false,.3,0,1.8)
			}
		}
	}
	previous_x = mouse_x;
	previous_y = mouse_y;
	
}

// Check if the left mouse button is held down
if (mouse_check_button(mb_left)) {
	if(PokeButton.we_pressed_poke){
	    // Additional condition to prevent ripple creation over your UI (adjust as needed)
	    if (!point_in_rectangle(mouse_x, mouse_y, VolumeButton.x, VolumeButton.y, VolumeButton.x + sprite_get_width(speakerIkon) + 40, VolumeButton.y + sprite_get_height(speakerIkon) + 5)) {
	        // Create a ripple at the mouse position
	        // You might want to add a condition to limit the rate of ripple creation
			 var _slice_angle = point_direction(previous_x,previous_y,mouse_x,mouse_y)
	        if( point_distance(mouse_x,mouse_y,previous_x,previous_y) > 2){
				var _slice_obj = instance_create_layer(mouse_x, mouse_y, "Instances", oRipple);
				_slice_obj.image_angle = _slice_angle - 90;
			}
			previous_x = mouse_x;
			previous_y = mouse_y;
	    }
	}
}

//// Add current mouse position to the list
//ds_list_add(mouse_positions, mouse_x);
//ds_list_add(mouse_positions, mouse_y);

//// Keep the list size within the limit
//while (ds_list_size(mouse_positions) > max_positions * 2) {
//    ds_list_delete(mouse_positions, 0);
//    ds_list_delete(mouse_positions, 0);
//}

//// Check for mouse dragging
//if (mouse_check_button(mb_left)) {
//    // Iterate through the positions and create ripples
//    for (var i = 0; i < ds_list_size(mouse_positions); i += 2) {
//        var pos_x = ds_list_find_value(mouse_positions, i);
//        var pos_y = ds_list_find_value(mouse_positions, i + 1);

//         //Create ripple instance at each position
//        var _slice_angle = point_direction(previous_x,previous_y,pos_x,pos_y)
//        if( point_distance(mouse_x,mouse_y,previous_x,previous_y) > 2){
//			var _slice_obj = instance_create_layer(mouse_x, mouse_y, "Instances", oSlice);
//			_slice_obj.image_angle = _slice_angle + 90;
//		}
//		previous_x = mouse_x;
//		previous_y = mouse_y;
	
//    }
//}


if (musicOn && VolumeButton.we_pressed_volume)
{
	//changing the gain
	show_debug_message( "changing the Gain!" )
	show_debug_message( "volume is now: " + string(VolumeLevel) )
    audio_sound_gain(music, VolumeLevel, 1);
}
