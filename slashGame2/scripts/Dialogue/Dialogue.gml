// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Dialogue() constructor {
	_dialogs = [];
	add = function(_sprite, _message){
		array_push(_dialogs, {
			sprite: _sprite,
			message: _message
		});
	}
	
}