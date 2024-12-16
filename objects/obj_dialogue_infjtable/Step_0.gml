// Inherit the parent event
event_inherited();

//switch state
if (struct_exists(current_dialogue, "message") 
&& current_dialogue.message == "Hello?"){
	global.infjtable_slow = true;
	global.infjtable_inflating = true;
}


if (struct_exists(current_dialogue, "message") 
&& current_dialogue.message == "HALF OFF ON ALL VEHICLES, I SAY!" && !global.rocket_halved){
	global.infjtable_deals = true;
	global.rocket_halved = true;
	PlaySFX(sfx_rocket_fall);
}


//start speed inflating!
if (global.infjtable_slow && obj_infjtable.image_index==3) {
	global.infjtable_slow = false;
	PlaySFX(sfx_jingle_1);
	dialogue = dialogue2;
	
	showing_dialogue = false;
}

//sound
if (struct_exists(current_dialogue, "message")
&& current_dialogue.message == "AHAHAHAHA!!!!!" && !global.infjtable_laugh_1) {
	global.infjtable_laugh_1 = true;
	PlaySFX(sfx_jingle_2);
}

if (struct_exists(current_dialogue, "message")
&& current_dialogue.message == "Well, anyway." && !global.infjtable_laugh_2) {
	global.infjtable_laugh_2 = true;
	PlaySFX(sfx_jingle_3);
}