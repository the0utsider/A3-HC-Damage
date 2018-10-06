/*	
	subfunctions of add-on A3 Hardcore damage mod
	Author: Gokmen
	website: github.com/the0utsider
	Params: none
	Sub functions called from switch inside the main function
*/

fn_goko_redirectDamageToHead =
{
	/// dynamic multiplier according to distance and weapon kind
	_getWeaponMaxRange = getNumber (configfile >> "CfgWeapons" >> currentweapon _instigator >> "maxZeroing");
	_normalizeMultiplierStart = _getWeaponMaxRange / 4;
	_measuredDistance = _instigator distance2d _unit;
	_calculateMultiplier = linearConversion [_normalizeMultiplierStart, _getWeaponMaxRange, _measuredDistance, goko_damage_multiplier, 1, true];
	
	_getHeadDamageAndAdd = _getDamage#2 + (_neckFaceDamage * _calculateMultiplier);
					if (goko_dev_debugger) then		/// debug information for head
					{
						_headAddUpper = (_neckFaceDamage * _calculateMultiplier);
						systemchat format [
							"neck and face damage: [%1], multiplier: %2x, result: [%3]. Damage Redirected-> Head: [%5], was [%4] before.)",
							_neckFaceDamage,
							_calculateMultiplier,
							_headAddUpper,
							_getDamage#2,
							_getHeadDamageAndAdd
						];
						
						hint format [
							"maximum range of used weapon: %1 meters,\n\n
							Distance of victim was: %2 meters,\n\n
							Applied multiplier according to distance: %3x
							",
							_getWeaponMaxRange,
							_measuredDistance,
							_calculateMultiplier
						];
					};
	_unit setHitPointDamage ["hithead", _getHeadDamageAndAdd];
	_unit setVariable ["goko_storeNeckDamage", _neckFaceDamage];
};

fn_goko_redirectDamageToLegs =
{
	_getWeaponMaxRange = getNumber (configfile >> "CfgWeapons" >> currentweapon _instigator >> "maxZeroing");
	_normalizeMultiplierStart = _getWeaponMaxRange / 4;
	_measuredDistance = _instigator distance2d _unit;
	_calculateMultiplier = linearConversion [_normalizeMultiplierStart, _getWeaponMaxRange, _measuredDistance, goko_damage_multiplier, 1, true];
	
	_getLegDamageAndAdd = _getDamage#10 + (_gutDamage * _calculateMultiplier);

					//debug information for chest
					if (goko_dev_debugger) then
					{
						_legAddUpper = (_gutDamage * _calculateMultiplier);
						systemchat format [
							"pelvis damage: [%1], multiplier: %2x, result: [%3]. Damage Redirected-> Legs: [%5], was [%4] before.",
							_gutDamage,
							_calculateMultiplier,
							_legAddUpper,
							_getDamage#10,
							_getLegDamageAndAdd
						];
						
						hint format [
							"maximum range of used weapon: %1 meters,\n\n
							Distance between shooter and victim was: %2 meters,\n\n
							Applied multiplier according to distance: %3x
							",
							_getWeaponMaxRange,
							_measuredDistance,
							_calculateMultiplier
						];
					};
					
	_unit setHitPointDamage ["hitlegs", _getLegDamageAndAdd];
	_unit setVariable ["goko_storePelvisDamage", _gutDamage]; 
};

fn_goko_redirectDamageToBody =
{
	_getWeaponMaxRange = getNumber (configfile >> "CfgWeapons" >> currentweapon _instigator >> "maxZeroing");
	_normalizeMultiplierStart = _getWeaponMaxRange / 4;
	_measuredDistance = _instigator distance2d _unit;
	_calculateMultiplier = linearConversion [_normalizeMultiplierStart, _getWeaponMaxRange, _measuredDistance, goko_damage_multiplier, 1, true];
	
	_getBodyDamageAndAdd = _getDamage#7 + (_chestDamage * _calculateMultiplier);

					//debug information for chest
					if (goko_dev_debugger) then
					{
						_chestAddUpper = (_chestDamage * _calculateMultiplier);
						systemchat format [
							"chest damage: [%1], multiplier: %2x, result: [%3].	Damage Redirected-> Body: [%5], was [%4] before.",
							_chestDamage,
							_calculateMultiplier,
							_chestAddUpper,
							_getDamage#7,
							_getBodyDamageAndAdd
						];
						
						hint format [
							"maximum range of used weapon: %1 meters,\n\n
							Distance between shooter and victim was: %2 meters,\n\n
							Applied multiplier according to distance: %3x
							",
							_getWeaponMaxRange,
							_measuredDistance,
							_calculateMultiplier
						];
					};
	
	_unit setHitPointDamage ["hitbody", _getBodyDamageAndAdd];
	_unit setVariable ["goko_storeDamageChest", _chestDamage]; 
};

fn_goko_redirectDamageToHands =
{
	_getWeaponMaxRange = getNumber (configfile >> "CfgWeapons" >> currentweapon _instigator >> "maxZeroing");
	_normalizeMultiplierStart = _getWeaponMaxRange / 4;
	_measuredDistance = _instigator distance2d _unit;
	_calculateMultiplier = linearConversion [_normalizeMultiplierStart, _getWeaponMaxRange, _measuredDistance, goko_damage_multiplier, 1, true];
	
	_getHandsDamageAndAdd = _getDamage#9 + (_chestDamage * _calculateMultiplier);

					//debug information for chest
					if (goko_dev_debugger) then
					{
						_chestAddUpper = (_chestDamage * _calculateMultiplier);
						systemchat format [
							"chest damage: [%1], multiplier: %2x, result: [%3].	Damage Redirected-> Hands: [%5], was [%4] before.",
							_chestDamage,
							_calculateMultiplier,
							_chestAddUpper,
							_getDamage#9,
							_getHandsDamageAndAdd
						];
						
						hint format [
							"maximum range of used weapon: %1 meters,\n\n
							Distance between shooter and victim was: %2 meters,\n\n
							Applied multiplier according to distance: %3x
							",
							_getWeaponMaxRange,
							_measuredDistance,
							_calculateMultiplier
						];
					};
	
	_unit setHitPointDamage ["hithands", _getHandsDamageAndAdd];
	_unit setVariable ["goko_storeDamageChest", _chestDamage]; 
};
