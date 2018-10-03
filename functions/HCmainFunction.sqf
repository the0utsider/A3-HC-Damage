/*	
	main function of add-on A3 Hardcore damage mod
	Author: Gokmen
	website: github.com/the0utsider
*/

fn_goko_hardcoreMain =
{
	params [
		"_unit", 
		"_selection", 
		"_damage", 
		"_source", 
		"_projectile", 
		"_hitIndex", 
		"_instigator", 
		"_hitPoint"
	];
	
	// all selections are: ["face_hub","neck","head","pelvis","spine1","spine2","spine3","body","arms","hands","legs","body"]
	// hit index : "hitface","hitneck","hithead","hitpelvis","hitabdomen","hitdiaphragm","hitchest","hitbody","hitarms","hithands","hitlegs","incapacitated"
	
	if !(_hitPoint in ["hitface", "hitneck", "hitpelvis", "hitabdomen", "hitdiaphragm", "hitchest"]) exitWith{};
	if (_projectile == "" || _damage > 1) exitWith{};

	_getDamage = (getAllHitPointsDamage _unit)#2;
	_PartsLeftOut = [_getDamage#2, _getDamage#7, _getDamage#9, _getDamage#10];

	if (0.25 in _PartsLeftOut || !alive _unit) exitwith { if (goko_dev_debugger) then {systemchat "Warning: Unit doesn't have enough hitpoints / already dead!"};};

	_upperChest = _getDamage#0 + _getDamage#1;
	_chestDamage = _getDamage#4 + _getDamage#5 + _getDamage#6;
	_gutDamage = _getDamage#3;

	_getDamageUpperChest = _unit getVariable "goko_setNeckDamage"; 
	_getDamageChest = _unit getVariable "goko_setDamageChest";
	_getDamageGuts = _unit getVariable "goko_setAbdomenDamage";
	
	if isNil {_unit getVariable "goko_setDamageChest"} exitWith 
	{
		_unit setVariable ["goko_setNeckDamage", _upperChest];
		_unit setVariable ["goko_setAbdomenDamage", _gutDamage];
		_unit setVariable ["goko_setDamageChest", _chestDamage];
	};

	switch (_selection in ["face_hub", "neck", "pelvis", "spine1", "spine2", "spine3"]) do 
	{ 
		case (goko_damage_disableLegs && _getDamageGuts != _gutDamage) : fn_goko_SecondCaseFunctionFerGutArea;
		case (goko_damage_fatalChestWounds isEqualTo 0 && _getDamageChest != _chestDamage) : fn_goko_ThirdCaseFunctionForChest;
		case (goko_damage_fatalChestWounds isEqualTo 1 && _getDamageChest != _chestDamage) : fn_goko_ForthCaseFunctionForHands;
		case (goko_damage_fatalHeadWounds && _getDamageUpperChest != _upperChest) : fn_goko_FirstCaseFunctionNeckArea;
	}; 
};
