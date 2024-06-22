accept_key = keyboard_check_pressed(vk_enter)|| keyboard_check_pressed(ord("E"));

if place_meeting(x, y, obj_player) && !instance_exists(obj_dialogue_textbox) && accept_key
{
	create_textbox(text_id);
	
}