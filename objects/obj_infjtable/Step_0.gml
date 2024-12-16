//depth
depth = -bbox_bottom;


//sprites
if (global.infjtable_inflating) {
	if (global.infjtable_slow) {
		image_speed = 0.1;
		if (image_index == 3) image_speed = 0;
	}
	else image_speed = 1.5;
} else {
	image_speed = 0;
	image_index = 0;
}