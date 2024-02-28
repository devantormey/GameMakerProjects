/// @description Insert description here
// You can write your code in this editor

if (displayText) {
	draw_set_color(c_black);
	draw_set_font(fnt_default);	
	var _diag_box = oDialogueBox;
    draw_text(_diag_box.x + 10, _diag_box.y + 33, currentText);
	show_debug_message("diag box x = " + string(_diag_box.x) )
	show_debug_message("diag box y = " + string(_diag_box.y) )
	//draw_text(_diag_box.x + 10, _diag_box.y + 10, "testing if we can print shit");
}

