//managing whether dialogue is active once we're in bounds
//if we're within threshold

show_debug_message(current_visit);

if (in_bounds){

	//if we're just becoming active
	//aka if we're not yet active but just pressed E or haven't done the tutorial
	if ((!global.tutorial_done || keyboard_check_released(key_next)) && !dialogue_active) {
		
		//add one to current talks, resets in obj_camera with every visit
		if (global.tutorial_done) current_talk++;
	
		//switch dialogue if needed
		if (current_talk == 1 && current_visit > 0 && current_visit < array_length(dialogues) && auto_switch) {
			//get next visit's dialogue
			dialogue = dialogues[current_visit-1];
		}
		
		//activate dialogue
		dialogue_active = true;
	}

} else {
	
	//deactivate dialogue
	if (dialogue_active) {
		dialogue_active = false;
	}
	
}

//managing dialogue once we're active
//if we're showing dialogue, get the current dialogue OR destroy instance if no more
if (dialogue_active) {
	
	//if we're on the tutorial, just display E
	if (!global.tutorial_done) {
		dialogue.insert(0, "E", 1);
		global.tutorial_done = true;
		
	//otherwise, here's the dialogue system
	//showing_dialogue is basically a variable that triggers the dialogue to switch
	} else {
		if (!showing_dialogue) {
			//if there's no more dialogue to show, end the function
			if (dialogue.count() <= 0) {
				dialogue_active = false;
				//instance_destroy();
				return;
			}
			
			//trigger the next dialogue to show
			current_dialogue = dialogue.pop();
			showing_dialogue = true;
		} else {
			
			//if E is pressed, we're temporarily not showing dialogue
			if (keyboard_check_released(key_next)) {
				
				//sound
				PlaySFX(sfx_bubble);
				
				//reset variables
				showing_dialogue = false;
				alpha = 0;
			}
		}
	}
}