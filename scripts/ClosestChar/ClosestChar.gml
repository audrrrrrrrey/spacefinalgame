// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ClosestChar(){
	var closest_char = noone;
	var closest_dist = 99999;
	
	with (obj_dialogue) {
		current_dist = point_distance(obj_char.x, obj_char.y, x, y);
		if (current_dist < closest_dist || closest_char = noone) {
			closest_char = id;
			closest_dist = current_dist;
		}
	}

	return closest_char;
}