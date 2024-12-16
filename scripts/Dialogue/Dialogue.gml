//a "dialogue" object is one CHAIN of dialogue by the same character.
//there's a variable that indicates which character is speaking.
//so the hierarchy is 
//used this tutorial: https://www.youtube.com/watch?v=k3AAxKOl-yU&ab_channel=GameMaker
function Dialogue() constructor {
	dialogues = [];
	
	add = function(message, who) {
		array_push(dialogues, {
			message: message,
			who: who
		});
	}
	
	pop = function () {
		var t = array_first(dialogues);
		array_delete (dialogues, 0, 1);
		
		return t;
	}
	
	insert = function (index, message, who) {
		array_insert(dialogues, index, {
			message: message,
			who: who
		});
	}
		
	
	count = function () {
		return array_length(dialogues);
	}

}