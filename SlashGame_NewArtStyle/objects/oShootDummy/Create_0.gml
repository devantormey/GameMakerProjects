/// @description Insert description here
// You can write your code in this editor
/// Create Event for objDummy

// Initialize health
charHealth = 100; // Set the starting health of the dummy
m_already_hit = false;

// Create Event of oEnemy
shoot_timer = game_get_speed(gamespeed_fps) * 3; // Shoots every 2 seconds.
shoot_timer_max = shoot_timer;