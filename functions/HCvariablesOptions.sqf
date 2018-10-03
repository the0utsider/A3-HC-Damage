/*	
	variables and optional settings of add-on A3 Hardcore damage mod
	Author: Gokmen
	website: github.com/the0utsider
	
	variable initialisations & optional CBA detection
*/

goko_damage_multiplier = profileNamespace getVariable ["goko_damage_multiplier", 1];	//TODO add dynamic formula
goko_damage_fatalHeadWounds = profileNamespace getVariable ["goko_damage_fatalHeadWounds", true];
goko_damage_fatalChestWounds = profileNamespace getVariable ["goko_damage_fatalChestWounds", 0];
goko_damage_affects_hands = profileNamespace getVariable ["goko_damage_affects_hands", true];
goko_damage_disableLegs = profileNamespace getVariable ["goko_damage_disableLegs", true];
goko_dev_debugger = profileNamespace getVariable ["goko_dev_debugger", false];

if(isClass(configFile >> "CfgPatches" >> "cba_settings")) then 
{
	[] spawn 
	{
		[
			"goko_damage_fatalChestWounds", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"LIST", // setting type
			["Chest & upperbody damage modification setting:","Decide how chest wounds affects gameplay: Fatal or increased aim swing by passing damage to arms which makes it difficult to operate weapon."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"Goko Damage Modifier", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[[0,1],["Pass chest damage to overall health.","Pass damage to arms. Non-fatal."],0], // default
			true, // "global" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;

		[
			"goko_damage_multiplier", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			["Damage multiplication ratio:","Decide how much different wounds affect overall health of units. Default is 1.5x"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"Goko Damage Modifier", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0.42,4.2,1.5,2], // default
			true, // "global" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;

		[
			"goko_damage_fatalHeadWounds", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Damage around neck and face affects head damage:","Neck and face damage gets added to make up overall head health."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"Goko Damage Modifier", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			true, // default
			true, // "global" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;

		[
			"goko_damage_disableLegs", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Gut damage affects legs","Wound/damage value of pelvis and lower gut passed to legs."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"Goko Damage Modifier", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			true, // default
			true, // "global" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;

		[
			"goko_dev_debugger", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Enable dev debugger","Local setting. Should be useful."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"Goko Damage Modifier", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // default
			false, // "global" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
	};	
};