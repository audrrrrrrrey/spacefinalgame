//get current camera pos
cam_x = camera_get_view_x(camera);
cam_y = camera_get_view_y(camera);
cam_w = camera_get_view_width(camera);
cam_h = camera_get_view_height(camera);

//set target camera pos, plus a little skew up because obj_char's origin is at feet
var target_x = obj_char.x - cam_w/2;
var target_y = obj_char.y - (cam_h * (4/5));

//clamp target to room bounds so we don't go outta frame
target_x = clamp(target_x, 0, room_width - cam_w);
target_y = clamp(target_y, 0, room_height - cam_h);

//smoothly move camera to target pos
cam_x = lerp(cam_x, target_x, LERP_SPEED);
cam_y = lerp(cam_y, target_y, LERP_SPEED);

//zooming in and out
//if we're close to a silly object, the camera zooms in
//else zoom back out
//the dialogue is placed at ideal points for the character to go to for each character/knick knack

if (room != rm_this_is_nice) {
	
	var add_w = cam_w * cam_speed;
	var add_h = cam_h * cam_speed;

	var closest_char = instance_nearest(obj_char.x, obj_char.y, obj_dialogue);
	var closest_char_closeness = point_distance(obj_char.x, obj_char.y, closest_char.x, closest_char.y);

	//if the closest obj is a dialogue point AND we're within the threshold, zoom in/activate dialogue
	if (closest_char_closeness < closeness_thresh) {
	
		//activate in bounds
		if (!closest_char.object_index.in_bounds) {
			closest_char.object_index.in_bounds = true;
			closest_char.object_index.current_visit++;
		}
	
	
		if (cam_w > cam_w_min) {
			//add to camera view size
			cam_w -= add_w;
			cam_h -= add_h;
	
			//center camera pos
			cam_x += add_w/2;
			cam_y += add_h/2;
		}
	
	} else {
	
		//deactivate in bounds
		if (closest_char.object_index.in_bounds) {
			closest_char.object_index.in_bounds = false;
			closest_char.object_index.current_talk = 0;
		}
	
		if (cam_w < cam_w_max) {
			//add to camera view size
			cam_w += add_w;
			cam_h += add_h;
	
			//center camera pos
			cam_x -= add_w/2;
			cam_y -= add_h/2;
		}
	}
}
	


//apply camera pos
camera_set_view_pos(camera, cam_x, cam_y);
camera_set_view_size(camera, cam_w, cam_h);
cam_current_scale = cam_w/cam_w_max;
cam_current_x_offset = cam_x;
cam_current_y_offset = cam_y;