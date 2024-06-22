up_key = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
down_key = keyboard_check_pressed(vk_down)|| keyboard_check_pressed(ord("S"));
accept_key = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter);
esc_key = keyboard_check_pressed(vk_escape);


if (active){
	hover += down_key - up_key
	if (hover > array_length(options)-1) hover = 0;
	if (hover < 0) hover = array_length(options)-1;
	
	//Exectue
	if (accept_key){
		if (array_length(options[hover]) > 1) && (options[hover][3] == true){
			if (options[hover][1] != -1){
				var _func = options[hover][1];
				if (options[hover][2] != -1) script_execute_ext(_func, options[hover][2]);
			}
		}
	}
	if (esc_key){
		if (subMenuLevel > 0) MenuGoBack();
	}
}