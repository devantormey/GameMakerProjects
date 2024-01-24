/// @description Insert description here
// You can write your code in this editor

movSpd = 3;
accel = .1;
decel = .1;
velocity = 0;
sprintKey = keyboard_check_pressed(vk_shift)
jumpKey = keyboard_check_pressed(vk_space);
leftKey = keyboard_check(ord("A"));
downKey = keyboard_check(ord("S"));
rightKey = keyboard_check(ord("D"));

xspeed = 0;
yspeed = 0;
isJumping = false;
isOnGround = false;

