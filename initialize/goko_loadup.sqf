if(is3DEN) exitWith {};

_unit = _this select 0;

if (local _unit) then
{
	_unit addEventHandler ["handledamage", {_this call fn_goko_hardcoreMain}];

};