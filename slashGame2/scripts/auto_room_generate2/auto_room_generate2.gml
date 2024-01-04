// Script: auto_generate_room
// Parameters: roomWidth, roomHeight, tileSize

function auto_generate_room2(roomWidth, roomHeight, tileSize, numberOfBiomes, featureSize) {
	
	// Creat all of the ID variables
	

	var dirt_id = layer_get_id("dirt_tile_layer");
    var grass_id = layer_get_id("grass_tile_layer");
	
	
	var dirt_layer_id = layer_get_id("dirt_tile_layer");
    var grass_layer_id = layer_get_id("grass_tile_layer");
	var mix_layer_id = layer_get_id("mix_tile_layer");
	
	
	var grassland_tile_set = grasslandTileSet /* reference to grassland Tiles tileset */;
	var dirt_tileset = dirtTileSet /* reference to dirt Tiles tileset */;
	var mix_tileset_1 = dirt_grass_mix_TileSet /* reference to dirt mix Tiles tileset */;
	var mix_tileset_2 = dirt_grass_mix_TileSet_2 /* reference to dirt mix Tiles tileset */;
	var mix_tileset_3 = dirt_grass_mix_TileSet_3 /* reference to dirt mix Tiles tileset */;
	
	var grass_map_id = layer_tilemap_create(grass_layer_id, 0, 0, grassland_tile_set, 100, 100);
	var dirt_map_id = layer_tilemap_create(dirt_layer_id, 0, 0, dirt_tileset, 100, 100);
	var mix_map_id = layer_tilemap_create(mix_layer_id, 0, 0, mix_tileset_1, 100, 100);
	var mix_map_id_2 = layer_tilemap_create(mix_layer_id, 0, 0, mix_tileset_2, 100, 100);
	var mix_map_id_3 = layer_tilemap_create(mix_layer_id, 0, 0, mix_tileset_3, 100, 100);
	
	// Create the housekeeping variables
	var count = 0;
	var roomWidthInCells = roomWidth / tileSize;
	var roomHeightInCells = roomHeight / tileSize;
	var chosen_tileset = 1;
	
	//create the heatmap
	//var heatmap = ds_grid_create(roomWidthInCells, roomHeightInCells);
	//var scale = 0.1; // Adjust based on how "zoomed in" you want the noise
	//var seed = random_get_seed(); // Seed for noise generation
	
	var size = 100;
	//var featureSize = 30;
	var factor = numberOfBiomes + 1;
	//use perlin noise generation
	var heatmap = generate_simplex_noise_2d(size,featureSize,factor);
	var forbiddenCount = 0;

	var place_tree = false;
	var placeRand = 0;
	
	//assign the tiles from each set according to the heatmap
	for (var cellX = 0; cellX < roomWidthInCells; cellX++) {
	    for (var cellY = 0; cellY < roomHeightInCells; cellY++) {
		       //TileSet Choice Logic Goes here:
				   //Heatmap choice:
				   //chosen_tileset = ds_grid_get(heatmap, cellX, cellY);
				   // simplex noise approach
				   
				   chosen_tileset = heatmap[cellX,cellY];
				   show_debug_message("heatmap at current position: " + string(chosen_tileset));
				   
				   if(chosen_tileset < 0.8){
						place_tree = true;
				   }else{
						place_tree = false;
					}
				   
				   if(chosen_tileset < 1.2 || chosen_tileset >= 2){
						if(chosen_tileset < 1.2){
							chosen_tileset = 0;
						}
						if(chosen_tileset >= 2){
							chosen_tileset = 4;
						}
				   }else{
						if(chosen_tileset >= 1.2 && chosen_tileset < 1.5){
							chosen_tileset = 1;
						}
						if(chosen_tileset >= 1.5 && chosen_tileset < 1.8){
							chosen_tileset = 2;
						}
						if(chosen_tileset >= 1.8 && chosen_tileset < 2){
							chosen_tileset = 3;
						}
						
				   }
				   
				   
				   
				   show_debug_message("floored value to: " + string(chosen_tileset));
					//var tileIndex;
			   
				   //random choice:
			       // var chosen_tileset = choose(0, 1);			
			
				//Specific Tile choice logic ~~~~~~~~
			        // Randomly choose a tile from the chosen tileset
					var tileIndex = irandom_range(1,99); // since there are 100 tiles, indexed 0-99
					//if (chosen_tileset == 3){
					//	show_debug_message("FORBIDDEN VALUE");
					//	chosen_tileset = 2;
					//	forbiddenCount++;
					//}
					////var tileIndex = 4;
					
			        // draw the tyle according to chosen_tileset      
					//if heatmap
					switch(chosen_tileset){
						case 0: tilemap_set(grass_map_id,tileIndex,cellX,cellY); break; // pick grass
						case 1: tilemap_set(mix_map_id,tileIndex,cellX,cellY); break; // pick mix
						case 2: tilemap_set(mix_map_id_2,tileIndex,cellX,cellY); break; // pick mix 2
						case 3: tilemap_set(mix_map_id_3,tileIndex,cellX,cellY); break; // pick mix 3
						case 4:	 tilemap_set(dirt_map_id,tileIndex,cellX,cellY); break;	// pick dirt
					
					}
					
					placeRand = random_range(0,100);
					if(place_tree == true && placeRand >= 80){
						instance_create_layer(cellX*tileSize + random_range(0,30), cellY*tileSize + random_range(0,30), "Instances", oEvergreenTree);
					}
			
		}
	}
	show_debug_message("FORBIDDEN COUNT: " + string(forbiddenCount));
	//ds_grid_destroy(heatmap);
	
}
