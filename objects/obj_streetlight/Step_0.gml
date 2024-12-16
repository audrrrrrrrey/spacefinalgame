//happy!
if (global.windmill_spinning) {
	global.streetlight_lit = true;
}

//sprites
if (global.streetlight_lit) {
	image_index = 2;
} else if (global.streetlight_sad) {
	image_index = 1;
} else {
	image_index = 0
}