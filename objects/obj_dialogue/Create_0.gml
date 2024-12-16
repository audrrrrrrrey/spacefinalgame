//initialize shit
dialogues = [];
dialogue1 = new Dialogue();
array_push(dialogues, dialogue1);
dialogue = dialogue1;

//use E to forward the dialogue
key_next = ord("E");

//are we in bounds to even consider having dialogue
in_bounds = false;

//if so, is dialogue active right now
//activated in camera object code when we walk close enough
dialogue_active = false;

//if so, are we showing dialogue right now
showing_dialogue = false;

//what we're showing rn
current_dialogue = {};

//visits
current_visit = 0;

//talks within the visit
current_talk = 0;

//fades the dialogue in
alpha = 0;

//true when the player JUST steps out of bounds or in bounds
stepped_in = false;
stepped_out = false;

//switch mode, cause some things have to be changed by hand
auto_switch = true;
