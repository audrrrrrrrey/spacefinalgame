/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (struct_exists(current_dialogue, "message") 
&& current_dialogue.message == "Nice." && !global.windmill_spinning){
	global.windmill_spinning = true;
	PlaySFX(sfx_switch);
}