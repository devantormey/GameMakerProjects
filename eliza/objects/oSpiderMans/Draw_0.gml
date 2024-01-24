/// @description Insert description here
// You can write your code in this editor
draw_self();
// Draw event
if (displayText) {
	draw_set_color(c_white);
	draw_set_font(fnt_default);
    draw_text(x + 25, y + 124, currentText);
}
