right_key = keyboard_check(vk_right) || keyboard_check(ord("D"));
left_key = keyboard_check(vk_left) || keyboard_check(ord("A"));
up_key = keyboard_check(vk_up) || keyboard_check(ord("W"));
down_key = keyboard_check(vk_down) || keyboard_check(ord("S"));
shift_key = keyboard_check(vk_shift);

//player movement
#region
	//get speed
		xspd = (right_key - left_key) * move_spd;
		yspd = (down_key - up_key);
		move_spd = 1;
		if shift_key{
			move_spd = 1.4;
			}
		var moveDir = point_direction( 0, 0, xspd, yspd);

		var _spd = 0;
		var _inputlevel = point_distance(0, 0, xspd, yspd);
		_spd = move_spd * _inputlevel;

		xspd = lengthdir_x(_spd, moveDir);
		yspd = lengthdir_y(_spd, moveDir);

	//pauser

		if instance_exists(obj_pauser)
		{
			xspd = 0;
			yspd = 0;
		}

	//collision
		if place_meeting( x + xspd, y, obj_wall ) == true
		{
			xspd = 0;
		}
		if place_meeting(x, y + yspd , obj_wall ) == true
		{
			yspd = 0;
		}



	//end
		x += xspd;
		y += yspd;

	//depth
	depth = -bbox_bottom;
	
#endregion


//player aiming
#region
	centerY = y + centerYOffset;
	
	//aim
	aimDir = point_direction( x, centerY, mouse_x, mouse_y);

#endregion



//sprite control
#region
	//match player with direction
	face = round(moveDir/90);
	if face == 4{
		face = 0;
	}
	
	if xspd == 0 && yspd ==0
	{
		image_index = 0;
	}
	//set the player sprite
	mask_index = sprite[3];
	sprite_index = sprite[face];
	
	#endregion
	
