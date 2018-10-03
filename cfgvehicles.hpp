class CfgVehicles
{
	class Land;
	class Man: Land
	{
		class EventHandlers;
	};	
	class CAManBase: Man
	{
		class EventHandlers: EventHandlers
		{
			class goko_quaddamage
			{
				init = "_this execVM '\gokoHC\initialize\goko_loadup.sqf'";
			};
		};
	};
};