surface.CreateFont( "DoorLookFont", {
 font = "Bebas Neue",
 size = 30,
 weight = 0,
 antialias = true
} )

local meta = FindMetaTable("Entity")
local black = Color(0, 0, 0, 255)
local white = Color(255, 255, 255, 200)
local red = Color(128, 30, 30, 255)

function meta:drawOwnableInfo()
	if LocalPlayer():InVehicle() then return end

	-- Look, if you want to change the way door ownership is drawn, don't edit this file, use the hook instead!
	local doorDrawing = hook.Call("HUDDrawDoorData", nil, self)
	if doorDrawing == true then return end

	local blocked = self:getKeysNonOwnable()
	local superadmin = LocalPlayer():IsSuperAdmin()
	local doorTeams = self:getKeysDoorTeams()
	local doorGroup = self:getKeysDoorGroup()
	local owned = self:isKeysOwned() or doorGroup or doorTeams

	local doorInfo = {}

	local title = self:getKeysTitle()
	if title then table.insert(doorInfo, title) end

	if owned then
		table.insert(doorInfo, DarkRP.getPhrase("keys_owned_by"))
	end

	if self:isKeysOwned() then
		table.insert(doorInfo, self:getDoorOwner():Nick())
		for k,v in pairs(self:getKeysCoOwners() or {}) do
			local ent = Entity(k)
			if not IsValid(ent) or not ent:IsPlayer() then continue end
			table.insert(doorInfo, ent:Nick())
		end

		local allowedCoOwn = self:getKeysAllowedToOwn()
		if allowedCoOwn and not fn.Null(allowedCoOwn) then
			table.insert(doorInfo, DarkRP.getPhrase("keys_other_allowed"))

			for k,v in pairs(allowedCoOwn) do
				local ent = Entity(k)
				if not IsValid(ent) or not ent:IsPlayer() then continue end
				table.insert(doorInfo, ent:Nick())
			end
		end
	elseif doorGroup then
		table.insert(doorInfo, doorGroup)
	elseif doorTeams then
		for k, v in pairs(doorTeams) do
			if not v then continue end

			table.insert(doorInfo, RPExtraTeams[k].name)
		end
	elseif blocked and superadmin then
		table.insert(doorInfo, DarkRP.getPhrase("keys_allow_ownership"))
	elseif not blocked then
		table.insert(doorInfo, DarkRP.getPhrase("keys_unowned"))
		if superadmin then
			table.insert(doorInfo, DarkRP.getPhrase("keys_disallow_ownership"))
		end
	end

	if self:IsVehicle() then
		for k,v in pairs(player.GetAll()) do
			if v:GetVehicle() ~= self then continue end

			table.insert(doorInfo, DarkRP.getPhrase("driver", v:Nick()))
		end
	end

	local x, y = ScrW()/2, ScrH() / 2
	draw.DrawText(table.concat(doorInfo, "\n"), "DoorLookFont", x , y + 1 , black, 1)
	draw.DrawText(table.concat(doorInfo, "\n"), "DoorLookFont", x, y, (blocked or owned) and white or red, 1)
end


/*---------------------------------------------------------------------------
Door data
---------------------------------------------------------------------------*/
DarkRP.doorData = DarkRP.doorData or {}

/*---------------------------------------------------------------------------
Interface functions
---------------------------------------------------------------------------*/
function meta:getDoorData()
	local i = self:EntIndex()
	self.DoorData = DarkRP.doorData[i] or {} -- Backwards compatibility

	return DarkRP.doorData[i] or {}
end

/*---------------------------------------------------------------------------
Networking
---------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------
Retrieve all the data for all doors
---------------------------------------------------------------------------*/
local function retrieveAllDoorData(len)
	local data = net.ReadTable()
	DarkRP.doorData = data
end
net.Receive("DarkRP_AllDoorData", retrieveAllDoorData)

/*---------------------------------------------------------------------------
Update changed variables
---------------------------------------------------------------------------*/
local function updateDoorData()
	local door = net.ReadUInt(32)

	DarkRP.doorData[door] = DarkRP.doorData[door] or {}

	local var = net.ReadString()
	local valueType = net.ReadUInt(8)
	local value = net.ReadType(valueType)

	DarkRP.doorData[door][var] = value
end
net.Receive("DarkRP_UpdateDoorData", updateDoorData)

/*---------------------------------------------------------------------------
Hooks
---------------------------------------------------------------------------*/
hook.Add("InitPostEntity", "getDoorData", fn.Curry(RunConsoleCommand, 2)("_sendAllDoorData"))
