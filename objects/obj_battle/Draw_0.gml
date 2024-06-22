
draw_sprite(battleBackground,0,x,y);


//Draw units in depth order
var _unitWithCurrentTurn = unitTurnOrder[turn].id;
for (var i =0; i<array_length(unitRenderOrder); i++){
	with (unitRenderOrder[i])
		{
			draw_self();
		}
}
//Draw UI 
draw_sprite_stretched(sBox, 0, x+225, y+10, 245, 60);
draw_sprite_stretched(sBox, 0, x+150, y+10, 74, 60); 

//Positions
#macro COLUMN_ENEMY 15
#macro COLUMN_NAME 90
#macro COLUMN_HP 160
#macro COLUMN_MP 220

//Draw Headings
draw_set_font(global.font_main);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_color(c_gray);
draw_text(x+COLUMN_ENEMY + 150, y+15, "ENEMY");
draw_text(x+COLUMN_NAME+ 150, y+15, "NAME");
draw_text(x+COLUMN_HP+ 150, y+15, "HP");
draw_text(x+COLUMN_MP+ 150, y+15, "MP");

var _drawLimit = 3;
var _drawn = 0;
for (var i = 0; (i<array_length(enemyUnits)) && (_drawn < _drawLimit); i++){
	var _char = enemyUnits[i];
	if (_char.hp > 0)
	{
		_drawn++
		draw_set_halign(fa_left);
		draw_set_color(c_white);
		if (_char.id == _unitWithCurrentTurn) draw_set_color(c_yellow);
		draw_text(x+COLUMN_ENEMY + 150, y+25+(i*12), _char.name);
	}
}

//Draw party info

for (var i = 0; i < array_length(partyUnits); i++){
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	var _char = partyUnits[i];
	if (_char.id == _unitWithCurrentTurn) draw_set_color(c_yellow);
	if (_char.hp <= 0) draw_set_color(c_maroon);
	draw_text(x+COLUMN_NAME + 150, y+25+(i*12), _char.name);
	draw_set_halign(fa_right);

	draw_set_color(c_white);
	if(_char.hp < (_char.hpMax * 0.5)) draw_set_color(c_orange);
	if (_char.hp <= 0) draw_set_color(c_maroon);
	draw_text(x+COLUMN_HP + 200, y + 25 + (i*12), string(_char.hp) + "/" + string(_char.hpMax));
	
	draw_set_color(c_white);
	if(_char.mp < (_char.mpMax * 0.5)) draw_set_color(c_orange);
	if (_char.mp <= 0) draw_set_color(c_maroon);
	draw_text(x+COLUMN_MP + 200, y + 25 + (i*12), string(_char.mp) + "/" + string(_char.mpMax));
	
	draw_set_color(c_white);
}