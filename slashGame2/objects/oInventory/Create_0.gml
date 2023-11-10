/// @description Insert description here
// You can write your code in this editor

// Information about how much we can store
	maxNumber_items = 21;
	inventoryArray = oPlayer.inventoryArray;
	
	positionsX = [];
	positionsY = [];

	cols = 7;
	rows = 3;
	
	openInv = false;

	//positionsX[0] = 0;
	//positionsY[0] = 0;
depth = oPlayer.depth - 4;

//
hoveredItemName = "";
hoveredItem = noone;

//Set up some variables for assigning inventory coordinates
	yInv_start = 160;
	currentX = 32;
	currentY = 160;

	
	
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

// Create Equiped slots
	//weapon
	weaponEquipedX = 52;
	weaponEquipedY = 63;
	//helm
	helmEquipedX = 192;
	helmEquipedY = 47;
	//armors
	armorEquipedX = 192;
	armorEquipedY = 101;
	
//for testing sake lets assign a currently equiped weapon and a filled inventory slot;
	equipedWeaponSprite = sword_equip;
	equipedHelmSprite = noone;
	equipedArmorSprite = noone;
	
	inventoryArray[0] = oPlayer.inventoryArray[0];

// Get the camera's top-left corner position
cam = view_camera[0];
cam_x = camera_get_view_x(cam);
cam_y = camera_get_view_y(cam);

offset_x = 180; // Offset from the camera view's edge
offset_y = 42; // Offset from the camera view's edge
x = cam_x + offset_x; // X start position of the health bar
y = cam_y + offset_y; // Y start position of the health bar


inventoryBackColor = make_color_rgb(216, 186, 125); // A purplish color
inventoryDarkBrown = make_color_rgb(51, 30, 9); // A purplish color
inventoryLightBrown = make_color_rgb(255, 238, 204); // A purplish color

