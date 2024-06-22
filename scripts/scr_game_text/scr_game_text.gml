//@param text_id
function scr_game_text(_text_id){
	
	switch(_text_id){
		
		case "npc_1":
		scr_text("Hi, Im NPC one!");
			scr_option("Great to meet you", "npc_1 - hooray");
			scr_option("oh thats cool", "npc_1 - nonchalant");
		break;
		case "npc_1 - hooray":
			scr_text(" :) ");
			break;
		
		case "npc_1 - nonchalant":
			scr_text(" oh ok ");
			break;
			
		case "npc_2":
		scr_text("Hi, Im NPC two!");
		
			break;
			
		case "locked_door":
			scr_text("The door is locked.");
		
			break;
			
		case "npc_4":
		
			break;
		
	}

}