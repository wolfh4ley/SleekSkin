surface.CreateFont( "DoorButtonFont", {
 font = "Bebas Neue",
 size = 24,
 weight = 500,
 blursize = 0,
 scanlines = 0,
 antialias = true
} )

local function AddButtonToFrame(Frame)
	Frame:SetTall(Frame:GetTall() + 45)

	local button = vgui.Create("DButton", Frame)
	button:SetPos(Frame:GetWide() / 2 - 91, Frame:GetTall() - 50)
	button:SetSize(182, 40)
	button:SetFont( "DoorButtonFont" )
	button:SetTextColor(Color(255, 255, 255, 255))
	button.Paint = function( self, w, h )
		local gcol
				if self.hover then
					gcol = Color( 36, 190, 255 )
				else
					gcol = Color( 26, 160, 212 )
				end
				draw.RoundedBox( 0, 0, 0, w, h, Color( 22, 131, 173 ) )
				draw.RoundedBox( 0, 1, 1, w - 2, h - 2, gcol )

				surface.SetDrawColor( Color( 31, 191, 255, 255 ) )
				surface.DrawLine( 1, 1, w - 1, 1 )
				surface.DrawLine( 1, 1, 1, 40 )
				surface.DrawLine( 1, 38, w - 1, 38 )
				surface.DrawLine( w - 2, 1, w - 2, 40 )
	end
	button.OnCursorEntered = function( self )
		self.hover = true
	end
	button.OnCursorExited = function( self )
		self.hover = false
	end
	return button
end

local function AdminMenuAdditions(Frame, ent, entType)
	local DisableOwnage = AddButtonToFrame(Frame)
	DisableOwnage:SetText(DarkRP.getPhrase(ent:getKeysNonOwnable() and "allow_ownership" or "disallow_ownership"))
	DisableOwnage.DoClick = function() Frame:Close() RunConsoleCommand("darkrp", "toggleownable") end

	if ent:getKeysNonOwnable() and entType then
		local DoorTitle = AddButtonToFrame(Frame)
		DoorTitle:SetText(DarkRP.getPhrase("set_x_title", entType))
		DoorTitle.DoClick = function()
			OpenTextBox( "Set Door Title", "What would you like this door title to be set to?", "/title " )
		end
	else
		local EditDoorGroups = AddButtonToFrame(Frame)
		EditDoorGroups:SetText(DarkRP.getPhrase("edit_door_group"))
		EditDoorGroups.DoClick = function()
			local menu = DermaMenu()
			local groups = menu:AddSubMenu(DarkRP.getPhrase("door_groups"))
			local teams = menu:AddSubMenu(DarkRP.getPhrase("jobs"))
			local add = teams:AddSubMenu(DarkRP.getPhrase("add"))
			local remove = teams:AddSubMenu(DarkRP.getPhrase("remove"))

			menu:AddOption(DarkRP.getPhrase("none"), function() RunConsoleCommand("darkrp", "togglegroupownable") Frame:Close() end)
			for k,v in pairs(RPExtraTeamDoors) do
				groups:AddOption(k, function() RunConsoleCommand("darkrp", "togglegroupownable", k) Frame:Close() end)
			end

			local doorTeams = ent:getKeysDoorTeams()
			for k,v in pairs(RPExtraTeams) do
				if not doorTeams or not doorTeams[k] then
					add:AddOption(v.name, function() RunConsoleCommand("darkrp", "toggleteamownable", k) if Frame.Close then Frame:Close() end end)
				else
					remove:AddOption(v.name, function() RunConsoleCommand("darkrp", "toggleteamownable", k) Frame:Close() end)
				end
			end

			menu:Open()
		end
	end
end

local KeyFrameVisible = false
function KeysMenu(um)
	if KeyFrameVisible then return end

	local ent = LocalPlayer():GetEyeTrace().Entity
	if not IsValid(ent) or not ent:isKeysOwnable() or ent:GetPos():Distance(LocalPlayer():GetPos()) > 200 then return end

	KeyFrameVisible = true
	local Frame = vgui.Create("DFrame")
	Frame:SetSize(200, 52) -- base size
	Frame:SetVisible(true)
	Frame:ShowCloseButton( false )
	Frame:MakePopup()
	Frame.Paint = function( self, w, h )

		draw.RoundedBox( 0, 0, 0, w, h, Color( 224, 224, 224, 255 ) )
		draw.RoundedBox( 0, 1, 1, w - 2, h - 2, Color( 250, 250, 250, 255 ) )

		draw.RoundedBox( 0, 0, 0, w, 36, Color( 62, 67, 77 ) )

		draw.SimpleText( "Door Options", "VoteFont", 10, 7, Color( 255, 255, 255, 255 ) )

		surface.SetDrawColor( Color( 84, 89, 100, 255 ) )
		surface.DrawLine( 1, 1, w - 1, 1 )
		surface.DrawLine( 1, 1, 1, 34 )
		surface.DrawLine( 1, 34, w - 1, 34 )
		surface.DrawLine( w - 1, 1, w - 1, 34 )
	end

	function Frame:Think()
		local ent = LocalPlayer():GetEyeTrace().Entity
		if not IsValid(ent) or not ent:isKeysOwnable() or ent:GetPos():Distance(LocalPlayer():GetPos()) > 200 then
			self:Close()
		end
		if not self.Dragging then return end
		local x = gui.MouseX() - self.Dragging[1]
		local y = gui.MouseY() - self.Dragging[2]
		x = math.Clamp(x, 0, ScrW() - self:GetWide())
		y = math.Clamp(y, 0, ScrH() - self:GetTall())
		self:SetPos(x, y)
	end

	local entType = DarkRP.getPhrase(ent:IsVehicle() and "vehicle" or "door")
	Frame:SetTitle("")

	function Frame:Close()
		KeyFrameVisible = false
		self:SetVisible(false)
		self:Remove()
	end

	local cl = vgui.Create( "DButton", Frame )
	cl:SetSize( 50, 20 )
	cl:SetPos( Frame:GetWide() - 60, 0 )
	cl:SetText( "X" )
	cl:SetFont( "fontclose" )
	cl:SetTextColor( Color( 255, 255, 255, 255 ) )
	cl.Paint = function( self, w, h )
		local kcol
		if self.hover then
			kcol = Color( 255, 150, 150, 255 )
		else
			kcol = Color( 175, 100, 100 )
		end
		draw.RoundedBoxEx( 0, 0, 0, w, h, Color( 255, 150, 150, 255 ), false, false, true, true )
		draw.RoundedBoxEx( 0, 1, 0, w - 2, h - 1, kcol, false, false, true, true )
	end
	cl.DoClick = function()
		Frame:Close()
	end
	cl.OnCursorEntered = function( self )
		self.hover = true
	end
	cl.OnCursorExited = function( self )
		self.hover = false
	end

	if ent:isKeysOwnedBy(LocalPlayer()) then
		local Owndoor = AddButtonToFrame(Frame)
		Owndoor:SetText(DarkRP.getPhrase("sell_x", entType))
		Owndoor.DoClick = function() RunConsoleCommand("darkrp", "toggleown") Frame:Close() end

		local AddOwner = AddButtonToFrame(Frame)
		AddOwner:SetText(DarkRP.getPhrase("add_owner"))
		AddOwner.DoClick = function()
			local menu = DermaMenu()
			menu.found = false
			for k,v in pairs(player.GetAll()) do
				if not ent:isKeysOwnedBy(v) and not ent:isKeysAllowedToOwn(v) then
					menu.found = true
					menu:AddOption(v:Nick(), function() RunConsoleCommand("darkrp", "ao", v:SteamID()) end)
				end
			end
			if not menu.found then
				menu:AddOption(DarkRP.getPhrase("noone_available"), function() end)
			end
			menu:Open()
		end

		local RemoveOwner = AddButtonToFrame(Frame)
		RemoveOwner:SetText(DarkRP.getPhrase("remove_owner"))
		RemoveOwner.DoClick = function()
			local menu = DermaMenu()
			for k,v in pairs(player.GetAll()) do
				if (ent:isKeysOwnedBy(v) and not ent:isMasterOwner(v)) or ent:isKeysAllowedToOwn(v) then
					menu.found = true
					menu:AddOption(v:Nick(), function() RunConsoleCommand("darkrp", "ro", v:SteamID()) end)
				end
			end
			if not menu.found then
				menu:AddOption(DarkRP.getPhrase("noone_available"), function() end)
			end
			menu:Open()
		end
		if not ent:isMasterOwner(LocalPlayer()) then
			RemoveOwner:SetDisabled(true)
		end

		local DoorTitle = AddButtonToFrame(Frame)
		DoorTitle:SetText(DarkRP.getPhrase("set_x_title", entType))
		DoorTitle.DoClick = function()
			OpenTextBox( "Set Door Title", "What would you like this door title to be set to?", "/title " )
		end
	elseif not ent:isKeysOwnedBy(LocalPlayer()) and not ent:isKeysOwned() and not ent:getKeysNonOwnable() and not ent:getKeysDoorGroup() and not ent:getKeysDoorTeams() then
		if LocalPlayer():hasDarkRPPrivilege("rp_doorManipulation") then
			local Owndoor = AddButtonToFrame(Frame)
			Owndoor:SetText(DarkRP.getPhrase("buy_x", entType))
			Owndoor.DoClick = function() RunConsoleCommand("darkrp", "toggleown") Frame:Close() end

			AdminMenuAdditions(Frame, ent, entType)
		else
			RunConsoleCommand("darkrp", "toggleown")
			Frame:Close()
			KeyFrameVisible = true
			timer.Simple(0.3, function() KeyFrameVisible = false end)
		end
	elseif not ent:isKeysOwnedBy(LocalPlayer()) and ent:isKeysAllowedToOwn(LocalPlayer()) then
		if LocalPlayer():hasDarkRPPrivilege("rp_doorManipulation") then
			local Owndoor = AddButtonToFrame(Frame)
			Owndoor:SetText(DarkRP.getPhrase("coown_x", entType))
			Owndoor.DoClick = function() RunConsoleCommand("darkrp", "toggleown") Frame:Close() end

			AdminMenuAdditions(Frame, ent, entType)
		else
			RunConsoleCommand("darkrp", "toggleown")
			Frame:Close()
			KeyFrameVisible = true
			timer.Simple(0.3, function() KeyFrameVisible = false end)
		end
	elseif LocalPlayer():hasDarkRPPrivilege("rp_doorManipulation") then
		AdminMenuAdditions(Frame, ent, entType)
	else
		Frame:Close()
	end

	Frame:Center()
end

timer.Simple( 1, function()
	print( "Override Keys Menu" )
	DarkRP.openKeysMenu = KeysMenu
end )