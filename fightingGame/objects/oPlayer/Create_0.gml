/// @description Insert description here
// You can write your code in this editor

movSpd = 3;
accel = .1;
decel = .1;
velocity = 0;

//we can use this flag to keep track of when we flip directions;
movement_Direction = 0;
// Create Event
_gravity = 0.5; // Adjust this value to control the gravity strength
fallSpeed = 0; // Current falling speed
maxJumpCount = 1;
jumpCount = 0;
// Create Event
jumpSpeed = 10; // Initial upward speed for the jump
maxJumpHeight = 50; // Maximum height the player can reach during a jump
jumpStartY = 0; // Y position where the jump started
isFalling = false;


sprintKey = keyboard_check_pressed(vk_shift)
jumpKey = keyboard_check_pressed(vk_space);
leftKey = keyboard_check(ord("A"));
downKey = keyboard_check(ord("S"));
rightKey = keyboard_check(ord("D"));

xspeed = 0;
yspeed = 0;
isJumping = false;
isOnGround = false;
onGround = true;

bottomOffset = 0
centerYOffset = 15;
punching = false;

isJumpingFlag = true;

percent = 0;
rate = 1/60;

groundBlock = oGrassBlock_physics