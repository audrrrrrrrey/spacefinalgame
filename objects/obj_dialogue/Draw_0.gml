//draw dialogue if showing dialogue is true
if (showing_dialogue && dialogue_active){
	
	var text_to_char = (sprite_get_height(spr_char_front) * 0.25);
	var text_x = obj_char.x;
	var text_y = obj_char.y - text_to_char;
	
	/*
	//if "1" that means the other is speaking, so change draw position
	if (current_dialogue.who == 1) {
		text_x = x;
		text_y = y - text_to_char;
	}
	*/
	
	var text = current_dialogue.message;
	var text_sep = font_get_size(fnt_dialogue) * 1.5;
	var text_width = (display_get_gui_width() * 0.25) * obj_camera.cam_current_scale;
	var text_width_2 = string_width_ext(text, text_sep, text_width);
	var text_height = string_height_ext(text, text_sep, text_width);
	
	//alignment
	//draw_set_halign(fa_center);
	//draw_set_valign(fa_center);
	
	//draw text bubble
	var bubble_x_pad = 0.1;
	var bubble_y_pad = -0.075;
	
	var bubble_width = bubble_x_pad + (text_width_2/sprite_get_width(spr_bubble));
	var bubble_height = bubble_y_pad + (text_height/sprite_get_height(spr_bubble));
	
	var bubble_pad = text_sep * 1;
	var bubble_x = text_x;
	var bubble_y = text_y - bubble_pad;
	
	if (text != "NULL"){
		draw_sprite_ext(spr_bubble, image_index, bubble_x, bubble_y, bubble_width, bubble_height, image_angle, image_blend, image_alpha);
	}

	//text alignment
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);

	//draw text
	draw_set_alpha(alpha);
	
	draw_set_color(c_black);
	draw_set_font(fnt_dialogue);
	
	if (text != "NULL"){
		draw_text_ext(text_x, text_y, text, text_sep, text_width); 
	}

	alpha = lerp(alpha, 1, 0.06);
	
}

draw_set_alpha(1);