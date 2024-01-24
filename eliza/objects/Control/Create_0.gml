global.debug_mode = false;
gameOver = false;
gamePaused = false;
window_set_cursor(cr_none);

standingOnItem = false;
currentItemPlayerIsTouching = noone;
playerTouchingFlag = false;

global.footstep_toggle = true;

lootingChest = noone;
isLootingChest = false;

notHome = false;

light_surface = surface_create(room_width, room_height);

persistent = true;

sound1 = noone;
sound2 = noone;
cursorRoom = false;