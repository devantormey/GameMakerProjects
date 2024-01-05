/// @description Insert description here
// You can write your code in this editor
// Step event of oSword
if(owner.charHealth <=0){
	instance_destroy();
}
//draw_set_alpha(0.5);
//draw_rectangle_colour(bbox_left,bbox_top,bbox_right,bbox_bottom,c_red,c_red,c_red,c_red,false);
if(owner != noone && owner.attacking){
	// drawing an ark on the weapon
	for (var i = 0; i < ds_list_size(line_points); i++) {
		var point = ds_list_find_value(line_points, i);
		draw_set_alpha(point.alpha);
		if(abs(wpn_speed) > critSpeed){
			draw_set_color(c_red);
		}else{
			draw_set_color(c_white);
		}
		// Draw a line from the current to the previous point if it exists
		if (i > 0) {
		    var prev_point = ds_list_find_value(line_points, i - 1);
		    //draw_line(point.x, point.y, prev_point.x, prev_point.y);
			// Calculate the thickness based on index
		var base_thickness = 0.5; // Starting thickness
		var thickness_increase = 0.4; // Increment of thickness per point
		var thickness = base_thickness + thickness_increase * i;
		
			draw_line_width(point.x, point.y, prev_point.x, prev_point.y, thickness);
		}
		// Update alpha
		point.alpha -= 0.1; // Adjust this value for fade speed
		if (point.alpha <= 0) {
		    ds_list_delete(line_points, i);
		    i--;
		}
	}
	draw_set_alpha(1); // Reset alpha
}

draw_self();