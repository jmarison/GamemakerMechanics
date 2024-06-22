//Action Library
#region
global.actionLibrary =
{
	attack :
	{
		name : "Attack",
		description : "{0} attacks",
		subMenu : -1,
		targetRequired : true,
		targetEnemyByDefault : true,
		targetAll : MODE.NEVER,
		userAnimation : "attack",
		effectSprite: sAttackBonk,
		effectOnTarget : MODE.ALWAYS,
		func : function (_user, _targets){
			var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
			BattleChangeHP(_targets[0], -_damage, 0);
		}
	},
	fireball : 
	{
		name : "Fireball",
		description : "{0} casts a fireball",
		subMenu: "Magic",
		mpCost : 5,
		targetRequired : true,
		targetEnemyByDefaul: true, //0 : party, 1 : enemy
		targetAll: MODE.NEVER,
		userAnimation : "fireball",
		effectSprite : spr_fireballHit,
		effectOnTarget : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			var _damage = (_user.magicStrength + random_range(-_user.magicStrength * 0.25, _user.magicStrength * 0.25));
			BattleChangeHP(_targets[0], -_damage, 0);
			//BattleChangeMP(_user, -mpCost)
		}
	}
}
#endregion



//targeting
enum MODE
	{
		NEVER = 0,
		ALWAYS = 1,
		VARIES = 2
	}



//party data
#region
	global.party = 
	[
	 { 
		name: "Lilly",
		hp: 25,
		hpMax: 25,
		mp: 20,
		mpMax: 20,
		strength: 6,
		magicStrength: 2,
		sprites : 
			{
				idle: spr_playerRight,
				attack: spr_playerAttack,
				fireball : spr_playerFireball,
				//hurt: spr_LillyHurt,
				down: spr_playerDowned
			},
		actions : [global.actionLibrary.attack, global.actionLibrary.fireball]
	 }
	 ,
	 { 
		name: "Millie",
		hp: 15,
		hpMax: 15,
		mp: 8,
		mpMax: 8,
		strength: 3,
		magicStrength: 5,
		sprites : 
			{
				idle: spr_doge,
				attack: spr_dogeAttack,
				//hurt: spr_MillieHurt,
				down: spr_dogeDowned
			},
		actions : [global.actionLibrary.attack]
	 }		
	 ];
 #endregion



//enemies data
#region
 global.enemies = 
 {
	 skeleton:
	 {
	name: "Skeleton",
	hp: 50,
	hpMax: 50,
	mp: 0,
	mpMax: 0,
	strength: 5,
	sprites : 
		{
			idle: spr_skeleton,
			attack: spr_skeletonAttack,
			//hurt: spr_SkeletonHurt,
			//die: spr_SkeletonDie
		},
	actions : [global.actionLibrary.attack],
	xpValue: 18,
	AIscript : function(){
		//attack random party memeber
		var _action = actions[0];
		var _possibleTargets = array_filter(obj_battle.partyUnits, function(_unit, _index)
		{
			return (_unit.hp > 0)
		});
		var _target = _possibleTargets[irandom(array_length(_possibleTargets)-1)];
		return [_action, _target];
		}
	}
 }
	#endregion