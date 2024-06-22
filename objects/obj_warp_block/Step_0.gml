accept_key = keyboard_check_pressed(vk_enter)|| keyboard_check_pressed(ord("E"));

if place_meeting(x, y, obj_player) && !instance_exists(obj_warp)  && accept_key
{
	var inst = instance_create_depth(0, 0, -10000, obj_warp);
	inst.target_x = target_x;
	inst.target_y = target_y;
	inst.target_rm = target_rm;
}