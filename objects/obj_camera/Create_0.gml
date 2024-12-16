//how close we can walk to a "silly" object to talk to it
closeness_thresh = 800;
global.zoom_scale = 3/5;
cam_w_max = 7500;
cam_h_max = 10000;
cam_w_min = cam_w_max * global.zoom_scale;		//4500
cam_h_min = cam_h_max * global.zoom_scale;		//6000
cam_current_scale = 1;

cam_speed = 0.01;

//tutorial used: https://www.youtube.com/watch?v=VYgf3V6Fx3M&ab_channel=GameMakerStation-Matharoo
//resolution
#macro RES_W cam_w_max	//target is 4500
#macro RES_H cam_h_max	//6000
#macro RES_SCALE display_get_height()/RES_H

#macro LERP_SPEED 0.05

//enable views
view_enabled = true;
view_visible[0] = true;

//create camera
camera = camera_create_view(0,0, RES_W, RES_H);
cam_current_x_offset = 0;
cam_current_y_offset = 0;
cam_x = camera_get_view_x(camera);
cam_y = camera_get_view_y(camera);
cam_w = camera_get_view_width(camera);
cam_h = camera_get_view_height(camera);

view_set_camera(0, camera);

//resize window and app surface
window_set_size(RES_W * RES_SCALE, RES_H * RES_SCALE);

if (surface_get_width(application_surface) != RES_W || surface_get_height(application_surface) != RES_H) {
	surface_resize(application_surface, RES_W * RES_SCALE, RES_H * RES_SCALE);
}

display_set_gui_size(RES_W, RES_H);

//center window
var display_width = display_get_width();
var display_height = display_get_height();

var window_width = RES_W * RES_SCALE;
var window_height = RES_H * RES_SCALE;

window_set_position(display_width/2 - window_width/2, display_height/2 - window_height/2);