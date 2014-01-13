MsgN("Initializing Gangs by Wolf Haley")

GANGS = {}

if SERVER then
	AddCSLuaFile("sv_init.lua")
	AddCSLuaFile( "sh_config.lua" )
	AddCSLuaFile( "cl_init.lua" )
	include("sv_init.lua" )
	include("sh_config.lua" )
else
	include( "cl_init.lua" )
	include("sh_config.lua" )
end