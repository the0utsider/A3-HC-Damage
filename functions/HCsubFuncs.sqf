/*	
	subfunctions of add-on A3 Hardcore damage mod
	Author: Gokmen
	website: github.com/the0utsider
	Params: none
	Sub functions that are called from switch in Main
*/

//Face and Neck damage should add up to Head damage.
fn_goko_FirstCaseFunctionNeckArea =
{
	_headDamageSolution = _getDamage#2 + (_upperChest * goko_damage_multiplier);

					//debug information for head
					if (goko_dev_debugger) then
					{
						_headaddupper = (_upperChest * goko_damage_multiplier);
							systemchat format [
								"Total face and neck damage: %1, multiplier used: %2x, resulting in: %3. damageRedirect->(Head damage was: %4, amplified to: %5)",
								_upperChest,
								goko_damage_multiplier,
								_headaddupper,
								_getDamage#2,
								_headDamageSolution
							];
					};
					
	_unit setHitPointDamage ["hithead", _headDamageSolution];
	_unit setVariable ["goko_setNeckDamage", _upperChest];
};

//Diaphragm and Pelvis damage should add up to legs damage.		
fn_goko_SecondCaseFunctionFerGutArea =
{
	_legDamageSolution = _getDamage#11 + (_gutDamage * goko_damage_multiplier);

					//debug information for legs
					if (goko_dev_debugger) then
					{
						_legaddupper = (_gutDamage * goko_damage_multiplier);
							systemchat format [
								"Total pelvis damage: %1, multiplier used: %2x, resulting in: %3. damageRedirect->(Leg damage was: %4, amplified to: %5)",
								_gutDamage,
								goko_damage_multiplier,
								_legaddupper,
								_getDamage#10,
								_legDamageSolution
							];
					};
					
	_unit setHitPointDamage ["hitlegs", _legDamageSolution];
	_unit setVariable ["goko_setAbdomenDamage", _gutDamage]; 
};

//abdomen, diaphragm, chest damage should added to total body damage. Fatal.
fn_goko_ThirdCaseFunctionForChest =
{
	_bodyDamageSolution = _getDamage#7 + (_chestDamage * goko_damage_multiplier);

					//debug information for chest
					if (goko_dev_debugger) then
					{
						_chestaddupper = (_chestDamage * goko_damage_multiplier);
							systemchat format [
								"Total chest damage: %1, multiplier used: %2x, resulting in: %3. damageRedirect->(Body damage was: %4, amplified to: %5)",
								_chestDamage,
								goko_damage_multiplier,
								_chestaddupper,
								_getDamage#7,
								_bodyDamageSolution
							];
					};
	
	_unit setHitPointDamage ["hitbody", _bodyDamageSolution];
	_unit setVariable ["goko_setDamageChest", _chestDamage]; 
};

fn_goko_ForthCaseFunctionForHands =
{
	//if (goko_damage_fatalChestWounds != 1 && (goko_setNeckDamage != _upperChest || goko_setAbdomenDamage != _gutDamage)) exitWith {};
	//Upper body damage should add up to hands damage (which increases swing and makes it difficult operate weapons properly).Increases difficulty but not fatal.
	_handDamageSolution = _getDamage#9 + (_chestDamage * goko_damage_multiplier);
					//debug information for hands 
					if (goko_dev_debugger) then
					{
						_handsaddupper = (_chestDamage * goko_damage_multiplier);
							systemchat format [
								"Total chest damage: %1, multiplier used: %2x, resulting in: %3. damageRedirect->(Hands damage were: %4, amplified to: %5)",
								_chestDamage,
								goko_damage_multiplier,
								_handsaddupper,
								_getDamage#9,
								_handDamageSolution
							];
					};

	_unit setHitPointDamage ["hithands", _handDamageSolution];
	_unit setVariable ["goko_setDamageChest", _chestDamage]; 
};
