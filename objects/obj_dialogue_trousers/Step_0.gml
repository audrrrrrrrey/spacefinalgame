// Inherit the parent event
event_inherited();

showing_dialogue = false;

if (in_bounds && keyboard_check_released(ord("E"))) {
	PlaySFX(sfx_got);
	global.trousers_got = true;
	instance_deactivate_object(obj_trousers);
}
