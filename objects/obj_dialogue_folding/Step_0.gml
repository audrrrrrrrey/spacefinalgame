/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/*
//some variables to shorten the if statement
global.folding_is_last = struct_exists(current_dialogue, "message") 
&& (current_dialogue.message == "And E is for enjoying the view."
|| current_dialogue.message == "That last song didn't rhyme, did it."
|| current_dialogue.message == "Are you ready?"
|| current_dialogue.message == "I've been taking stand-up classes lately.") //&& dialogue_active;
*/

global.folding_is_last = struct_exists(current_dialogue, "message") 
&& (current_dialogue.message == "NULL");

if (global.folding_is_last) {
	global.folding_sittable = true;
} else {
	global.folding_sittable = false;
}

//show_debug_message(current_visit);

/*else {
	global.folding_sittable = false;
}
*/

/*
if (is_last && dialogue = dialogue1) 
|| (!is_last && dialogue != dialogue1) { 
	global.folding_sittable = true;
} else {
	global.folding_sittable = false;
}
*/
