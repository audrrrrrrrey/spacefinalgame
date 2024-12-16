/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (global.trousers_got){
	dialogue = dialogue2;
} else {
	dialogue = dialogue1;
}

if (struct_exists(current_dialogue, "message") 
&& current_dialogue.message == "Oh, traveler..." && !global.princess_oh){
	global.princess_oh = true;
}

if (struct_exists(current_dialogue, "message") 
&& current_dialogue.message == "I don't want those..." && !global.princess_sad){
	global.princess_sad = true;
}