/// @description Insert description here
// You can write your code in this editor


// Create a physics fixture
var fix = physics_fixture_create();
var width = sprite_get_width(sprite_index);
var height = sprite_get_height(sprite_index);

// Define the box shape for the fixture
physics_fixture_set_box_shape(fix, width / 2, height / 2);


// Set the density to 0 to make it static
physics_fixture_set_density(fix, 0);

// Bind the fixture to the object
physics_fixture_bind(fix, id);



// Delete the temporary fixture ID
physics_fixture_delete(fix);