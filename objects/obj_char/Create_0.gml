global.last_x = room_width * (1/2);
global.last_y = room_height * (2/3);

buffer = 10;

x_speed = 0;
y_speed = 0;
walk_vel = 10;
run_vel = walk_vel*2;
velocity = walk_vel;
dist_thresh = 30;

sprite[RIGHT] = spr_char_side;
sprite[UP] = spr_char_back;
sprite[LEFT] = spr_char_side;
sprite[DOWN] = spr_char_front;

face = DOWN;

scale = 0.75;



/*
mode = 0;
badTiles[0] = layer_tilemap_get_id("blackTilesLayer");
badTiles[1] = layer_tilemap_get_id("whiteTilesLayer");
*/