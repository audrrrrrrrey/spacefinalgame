/*
//sound test
if (keyboard_check_pressed(ord("C"))) {
	PlaySFX(sfx_test);
}
*/



//sound
PlayBGM(sfx_bgm, true);

if (global.infjtable_deals) {
	//PlaySFX(sfx_rocket_fall);
}

if (global.windmill_spinning) {
	//PlaySFX(sfx_switch);
	PlaySFX(sfx_windmill);
}

/*
//room switch test
if (keyboard_check_pressed(vk_space)) {
	if (room_exists(room_next(room))) room_goto_next();
	else room_goto(rm_1);
}
*/

//switching back from "this is nice" room
if (room == rm_this_is_nice) {
	instance_deactivate_object(obj_camera);
	instance_deactivate_object(obj_dialogue);
	instance_deactivate_object(obj_char);
	
	if (keyboard_check_released(ord("E"))) {
		global.folding_sittable = false;
		
		instance_activate_object(obj_camera);
		instance_activate_object(obj_dialogue);
		instance_activate_object(obj_char);
		room_goto(rm_2);
	}
}