//get input
var _w = ord("W");
var _s = ord("S");

up_key = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
down_key = keyboard_check_pressed(vk_down)|| keyboard_check_pressed(ord("S"));
accept_key = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter);
esc_key = keyboard_check_pressed(vk_escape);


//store # of options in current menu
op_length = array_length(option[menu_level]);
//move through
pos += down_key - up_key;
if pos >= op_length{pos = 0};

if pos < 0 {pos = op_length - 1};

if esc_key{
	menu_level = 0;
}

//using the options
if accept_key{
	var _sml = menu_level;
	
	switch(menu_level){
		
		case 0:
			switch(pos){
				//New Game
				case 0: room_goto_next(); break;	
				//Continue Game
				case 1: break;	
				//settings:
				case 2: menu_level = 1; break;
				//Quit Game
				case 3: game_end(); break;
			}
			break;
			
		//settings
		case 1:
			switch(pos){
				//window size
				case 0:
					break;
				//Brightness
				case 1:
					break;
				//Controls
				case 2:
					break;
				//Back
				case 3:
					menu_level = 0;
					break;
			}
			break;
	}
	if _sml != menu_level {pos = 0};
	//correct option length
	op_length = array_length(option[menu_level]);
	
}		