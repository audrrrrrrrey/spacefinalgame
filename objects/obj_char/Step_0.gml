//depth
depth = -bbox_bottom;

//variables for spacebar
var space = keyboard_check_released(vk_space);
var right = keyboard_check(ord("D")) or keyboard_check(vk_right);
var left = keyboard_check(ord("A")) or keyboard_check(vk_left);
var up = keyboard_check(ord("W")) or keyboard_check(vk_up);
var down = keyboard_check(ord("S")) or keyboard_check(vk_down);
var shift = keyboard_check(vk_shift);

//running, run image speed
if (shift) {
	velocity = run_vel;
	image_speed = 1.5;
} else {
	velocity = walk_vel;
	image_speed = 1;
}

//actually moving the player
if (right-left != 0) x_speed = (right-left)*velocity;
else x_speed = right*velocity;

if (down-up != 0) y_speed = (down-up)*velocity;
else y_speed = down*velocity;

//player direction aka set sprite
if y_speed == 0{
	if x_speed > 0 {face = RIGHT}
	if x_speed < 0 {face = LEFT}
}
if x_speed > 0 && face = LEFT { face = RIGHT }
if x_speed < 0 && face = RIGHT{ face = LEFT }

if x_speed == 0{
	if y_speed > 0 {face = DOWN}
	if y_speed < 0 {face = UP}
}
if y_speed > 0 && face = UP { face = DOWN }
if y_speed < 0 && face = DOWN{ face = UP }

//if we're going left, just flip the sprite
if (face = LEFT) image_xscale = scale * -1;
else image_xscale = scale;

//if (face == LEFT) image_xscale *= -1;
//else image_xscale *= 1;

//set the sprite
sprite_index = sprite[face];

/*
//hint box appearing
if distance_to_object(blueDudeObject) <= distThresh {
	draw_sprite(hintBoxSprite, 0,mouse_x, mouse_y);
}
*/

/*
//collisions
if place_meeting(xSpeed+x, y, badTiles[mode]) || place_meeting(x, ySpeed+y, badTiles[mode]){
	global.plays++;
	room_restart();
	if global.plays <= 3 {
		room_goto(hintRoom);
	} else {
		room_goto(loseRoom);
	}
}

if place_meeting(xSpeed+x, y, wallObject){
	xSpeed = 0;
}
if place_meeting(x, ySpeed+y, wallObject){
	ySpeed = 0;
}

if place_meeting(xSpeed+x, y, [orangeDudeObject, blueDudeObject]){
	xSpeed = 0;
}
if place_meeting(x, ySpeed+y, [orangeDudeObject, blueDudeObject]){
	ySpeed = 0;
}
*/

//collisions
//making sure you don't fall off the planet and room switches
if (place_meeting(x+x_speed, y, obj_walls)) {
	if (x > room_width/2 && face = RIGHT && x_speed > 0 && y > 6300) {
		x = room_width - x + buffer;
		PlaySFX(sfx_room_switch);
		
		if (room_exists(room_previous(room)) && room_previous(room)!= rm_this_is_nice) {
			room_goto_previous();
		} else {
			room_goto(rm_4);
		}
	}
	
	if (x < room_width/2 && face = LEFT && x_speed < 0 && y > 6300) {
		x = room_width - x - buffer;
		PlaySFX(sfx_room_switch);
		
		if (room_exists(room_next(room)) && room_next(room) != rm_this_is_nice) {
			room_goto_next();
		} else {
			room_goto(rm_1);
		}
	}
	
	x_speed = 0;
	
	
}
if (place_meeting(x, y+y_speed, obj_walls)) {
	//laySFX(sfx_wall);
	y_speed = 0;
}

if (place_meeting(x+x_speed, y, obj_silly)) {
	//PlaySFX(sfx_wall);
	x_speed = 0;
}

if (place_meeting(x, y+y_speed, obj_silly)) {
	//PlaySFX(sfx_wall);
	y_speed = 0;
}

x += x_speed;
y += y_speed;

//sound
if (x_speed == 0 && y_speed == 0) {
	StopSFX(sfx_running);
	StopSFX(sfx_walking);
} else if (velocity == run_vel || shift) {
	StopSFX(sfx_walking);
	PlayBGM(sfx_running, true);
} else {
	StopSFX(sfx_running);
	PlayBGM(sfx_walking, true);
}

//animation, ensures player is still when idling
if (x_speed == 0 && y_speed == 0) {
	image_index = 0;
}

//track closest character ( as in the silly ones) to self
//closest_char = instance_nearest(obj_char.x, obj_char.y, all);
//closest_char_closeness = point_distance(obj_char.x, obj_char.y, closeness_char.x, closeness_char.y);