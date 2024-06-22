//draw player

	draw_self();
	
//draw weapon
	//get weapon off player body
	var _xOffset = lengthdir_x(weaponOffsetDist, aimDir);
	var _yOffset = lengthdir_y(weaponOffsetDist, aimDir);
	
	
	
	var _weaponYscl = 1;
	
	//draw_sprite_ext(spr_scythe, 0, x + _xOffset, centerY + _yOffset, 1, _weaponYscl, aimDir, c_white, 1);