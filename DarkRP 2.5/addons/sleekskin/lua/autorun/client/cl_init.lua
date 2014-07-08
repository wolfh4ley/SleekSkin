vgui = vgui

local QuestionVGUI = {}
local PanelNum = 0
local VoteVGUI = {}

local Texts = {}

Texts.DarkRPCommand = "say"

function RunCmd(...)
	local arg = {...}
	if Texts.DarkRPCommand:lower():find('say') then
			arg = table.concat(arg,' ')
	else
			arg = table.concat(arg,'" "')
	end
	
	RunConsoleCommand(Texts.DarkRPCommand,arg)
end

function RunEntCmd(...)
	local arg = {...}
	if Texts.DarkRPCommand:lower():find('say') then
			arg = table.concat(arg,' ')
	else
			arg = table.concat(arg,'" "')
	end
	
	LocalPlayer():ConCommand("darkrp "..arg)
end

local SideTabs = {}
table.insert( SideTabs, { Title = SSK.CommandsTabTitle, Func = function() 
	mbg:SetVisible( true ) 
	jbg:SetVisible( false )
	ebg:SetVisible( false )
end } )
table.insert( SideTabs, { Title = SSK.JobsTabTitle, Func = function() 
	mbg:SetVisible( false ) 
	jbg:SetVisible( true )
	ebg:SetVisible( false )
end } )
table.insert( SideTabs, { Title = SSK.EntitiesTabTitle, Func = function()
	mbg:SetVisible( false ) 
	jbg:SetVisible( false )
	ebg:SetVisible( true )
end } )

function OpenWebpage( url )
	gui.OpenURL( url )
end

local f4open

function CreateMenu()

	f4open = true

	if F4Menu and IsValid(F4Menu) then
		F4Menu:Remove()
	end

	F4Menu = vgui.Create('DFrame')
	F4Menu:SetSize(ScrW() * 0.70, ScrH() * 0.70)
	F4Menu:Center()
	F4Menu:MakePopup()
	F4Menu:ShowCloseButton(true)
	F4Menu.btnMaxim:SetVisible( false )
	F4Menu.btnMinim:SetVisible( false )
	F4Menu:SetDeleteOnClose(false)
	F4Menu:ParentToHUD()
	F4Menu:SetDraggable(false)
	F4Menu:SetSizable(false)
	F4Menu:SetTitle('')
	F4Menu.Init = function( self )
		self.startTime = SysTime()
	end
	F4Menu.Paint = function( self, w, h )
		Derma_DrawBackgroundBlur( self, self.startTime )
	end
	
	local SLEEK_SIDEBAR = vgui.Create( "Panel", F4Menu )
	SLEEK_SIDEBAR:SetSize( 200, F4Menu:GetTall() )
	SLEEK_SIDEBAR.Paint = function( self, w, h )
		draw.RoundedBoxEx( 4, 0, 0, w - 1, h - 2, Color( 83, 88, 100, 255 ), true, false, true, false )
		draw.RoundedBoxEx( 0, 0, 0, w, h, Color( 51, 54, 58, 255 ), true, false, true, false )
		draw.RoundedBoxEx( 4, 1, 224, w - 1, h - 225, Color( 83, 88, 100, 255 ), false, false, true, false )

		surface.SetDrawColor( Color( 92, 98, 109, 255 ) )
		surface.DrawLine( 1, 224, 1, F4Menu:GetTall() )
	end
	
	SLEEK_SIDELIST = vgui.Create( "DPanelList", F4Menu )
	SLEEK_SIDELIST:SetSize( 200, F4Menu:GetTall() )
	SLEEK_SIDELIST:SetPos( 1, 63 )
	
	SLEEK_MAIN = vgui.Create( "DFrame", F4Menu )
	SLEEK_MAIN:SetSize( F4Menu:GetWide() - 200, F4Menu:GetTall() )
	SLEEK_MAIN:SetPos( 200, 0 )
	SLEEK_MAIN:ShowCloseButton( false )
	SLEEK_MAIN:SetTitle( "" )
	SLEEK_MAIN.Paint = function( self, w, h )
		draw.RoundedBoxEx( 4, 0, 0, w, h - 1, Color( 232, 234, 236, 255 ), false, true, false, true )

		surface.SetDrawColor( Color( 61, 65, 73, 255 ) )
		surface.DrawLine( 0, 0, 0, h )

		surface.SetDrawColor( Color( 168, 170, 171, 255 ) )
		surface.DrawLine( 1, 0, 1, h )

		surface.SetDrawColor( Color( 181, 183, 184, 255 ) )
		surface.DrawLine( 2, 0, 2, h )

		surface.SetDrawColor( Color( 191, 193, 194, 255 ) )
		surface.DrawLine( 3, 0, 3, h )

		surface.SetDrawColor( Color( 199, 201, 203, 255 ) )
		surface.DrawLine( 4, 0, 4, h )

		surface.SetDrawColor( Color( 169, 171, 177, 255 ) )
		surface.DrawLine( 5, 0, 5, h + 2 )
	end
	
	TITLE_PANEL = vgui.Create( "Panel", SLEEK_SIDEBAR )
	TITLE_PANEL:SetPos( 1, 1 )
	TITLE_PANEL:SetSize( SLEEK_SIDEBAR:GetWide(), 62 )
	TITLE_PANEL.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 64, 69, 78 ) )

		surface.SetDrawColor( Color( 84, 89, 100, 255 ) )
		surface.DrawLine( 0, 0, 200, 0 )
		surface.DrawLine( 0, 0, 0, 64 )

		surface.SetDrawColor( Color( 51, 54, 58, 255 ) )
		surface.DrawLine( 0, 61, 200, 61 )

		--draw.SimpleText( LocalPlayer():Name(), "sidefont", 60, 20 )
	end

	local name = vgui.Create( "DLabel", TITLE_PANEL )
	name:SetPos( 54, 14 )
	name:SetSize( 140, 32 )
	name:SetFont( "sidefont" )
	name:SetText( LocalPlayer():Name() )
	name:SetTextColor( Color( 255, 255, 255, 255 ) )

	local ava = vgui.Create( "AvatarImage", TITLE_PANEL )
	ava:SetPos( 16, 14 )
	ava:SetSize( 32, 32 )
	ava:SetPlayer( LocalPlayer(), 32 )

	local cmdOpen = false
	local jobOpen = false
	
	SLEEK_CLOSE = vgui.Create( "DButton", SLEEK_MAIN )
	SLEEK_CLOSE:SetSize( 50, 20 )
	SLEEK_CLOSE:SetPos( SLEEK_MAIN:GetWide() - 60, 0 )
	SLEEK_CLOSE:SetText( "X" )
	SLEEK_CLOSE:SetFont( "fontclose" )
	SLEEK_CLOSE:SetTextColor( Color( 255, 255, 255, 255 ) )
	SLEEK_CLOSE.Paint = function( self, w, h )
		local kcol
		if self.hover then
			kcol = Color( 255, 150, 150, 255 )
		else
			kcol = Color( 175, 100, 100 )
		end
		draw.RoundedBoxEx( 0, 0, 0, w, h, Color( 255, 150, 150, 255 ), false, false, true, true )
		draw.RoundedBoxEx( 0, 1, 0, w - 2, h - 1, kcol, false, false, true, true )
	end
	SLEEK_CLOSE.DoClick = function()
		F4Menu:Close()
		isOpen = false
		textOpen = false
	end
	SLEEK_CLOSE.OnCursorEntered = function( self )
		self.hover = true
	end
	SLEEK_CLOSE.OnCursorExited = function( self )
		self.hover = false
	end
	
	for k, v in pairs( SideTabs ) do
		local SIDE_BUTTON = vgui.Create( "DButton", SLEEK_SIDELIST )
		SIDE_BUTTON:SetSize( SLEEK_MAIN:GetWide(), 54 )
		SIDE_BUTTON:SetText( "" )
		SIDE_BUTTON.Paint = function( self, w, h )
			if self.Hover then
				draw.RoundedBox( 0, 0, 0, w, h, Color( 87, 92, 104 ) )

				surface.SetDrawColor( Color( 73, 78, 87, 255 ) )
				surface.DrawLine( 1, 0, 200, 0 )

				surface.SetDrawColor( Color( 79, 83, 93, 255 ) )
				surface.DrawLine( 1, 1, 200, 1 )

				surface.SetDrawColor( Color( 83, 88, 99, 255 ) )
				surface.DrawLine( 1, 2, 200, 2 )
			elseif self.Click then
				draw.RoundedBox( 0, 0, 0, w, h, Color( 87, 92, 104 ) )

				surface.SetDrawColor( Color( 73, 78, 87, 255 ) )
				surface.DrawLine( 1, 0, 200, 0 )

				surface.SetDrawColor( Color( 79, 83, 93, 255 ) )
				surface.DrawLine( 1, 1, 200, 1 )

				surface.SetDrawColor( Color( 83, 88, 99, 255 ) )
				surface.DrawLine( 1, 2, 200, 2 )
			else
				draw.RoundedBox( 0, 0, 0, w, h, Color( 80, 84, 96 ) )

				surface.SetDrawColor( Color( 92, 98, 109, 255 ) )
				surface.DrawLine( 0, 0, 0, 54 )
			end

			draw.SimpleText( v.Title, "sidefont", 22, 17, Color( 255, 255, 255, 255 ) )
			
			if v.Title != SSK.EntitiesTabTitle then
				surface.SetDrawColor( Color( 51, 54, 58, 255 ) )
				surface.DrawLine( 0, 53, 200, 53 )
			end
		end
		SIDE_BUTTON.DoClick = function()
			v.Func()
		end
		SIDE_BUTTON.OnCursorEntered = function( self )
			self.Hover = true
		end
		SIDE_BUTTON.OnCursorExited = function( self )
			self.Hover = false
		end
		
		SLEEK_SIDELIST:AddItem( SIDE_BUTTON )
	end
	
	local SLEEK_DIV = vgui.Create( "Panel", SLEEK_SIDELIST )
	SLEEK_DIV:SetSize( SLEEK_MAIN:GetWide(), 24 )
	SLEEK_DIV:SetPos( 0, 224 )
	SLEEK_DIV.Paint = function( self, w, h )

		draw.RoundedBox( 0, 0, 0, w, h, Color( 60, 63, 71 ) )

		surface.SetDrawColor( Color( 72, 77, 84, 255 ) )
		surface.DrawLine( 1, 1, 200, 1 )
		surface.DrawLine( 1, 1, 1, 54 )

		draw.RoundedBox( 0, 0, 2, w - 4, h - 3, Color( 63, 68, 77 ) )

	end
	
	SLEEK_SIDELIST:AddItem( SLEEK_DIV )
	
	for k, v in pairs( WEB_BUTTONS ) do
		local SIDE_BUTTON = vgui.Create( "DButton", SLEEK_SIDELIST )
		SIDE_BUTTON:SetSize( SLEEK_MAIN:GetWide(), 54 )
		SIDE_BUTTON:SetText( "" )
		SIDE_BUTTON.Paint = function( self, w, h )
			if self.Hover then
				draw.RoundedBox( 0, 0, 0, w, h, Color( 87, 92, 104 ) )

				surface.SetDrawColor( Color( 73, 78, 87, 255 ) )
				surface.DrawLine( 1, 0, 200, 0 )

				surface.SetDrawColor( Color( 79, 83, 93, 255 ) )
				surface.DrawLine( 1, 1, 200, 1 )

				surface.SetDrawColor( Color( 83, 88, 99, 255 ) )
				surface.DrawLine( 1, 2, 200, 2 )
			elseif self.Click then
				draw.RoundedBox( 0, 0, 0, w, h, Color( 87, 92, 104 ) )

				surface.SetDrawColor( Color( 73, 78, 87, 255 ) )
				surface.DrawLine( 1, 0, 200, 0 )

				surface.SetDrawColor( Color( 79, 83, 93, 255 ) )
				surface.DrawLine( 1, 1, 200, 1 )

				surface.SetDrawColor( Color( 83, 88, 99, 255 ) )
				surface.DrawLine( 1, 2, 200, 2 )
			else
				draw.RoundedBox( 0, 0, 0, w, h, Color( 80, 84, 96 ) )

				surface.SetDrawColor( Color( 92, 98, 109, 255 ) )
				surface.DrawLine( 0, 0, 0, 54 )
			end

			draw.SimpleText( v.Title, "sidefont", 22, 17, Color( 255, 255, 255, 255 ) )
			
			surface.SetDrawColor( Color( 51, 54, 58, 255 ) )
			surface.DrawLine( 0, 53, 200, 53 )
		end
		SIDE_BUTTON.DoClick = function()
			v.Func()
		end
		SIDE_BUTTON.OnCursorEntered = function( self )
			self.Hover = true
		end
		SIDE_BUTTON.OnCursorExited = function( self )
			self.Hover = false
		end
		
		SLEEK_SIDELIST:AddItem( SIDE_BUTTON )
	end
end

local function BuildF4Menu()
	if F4Menu and F4Menu:IsValid() and F4Menu:IsVisible() then
		F4Menu:SetVisible( false )
	elseif F4Menu and F4Menu:IsValid() and not F4Menu:IsVisible() then
		F4Menu:SetVisible(true)
		return
	end
	CreateMenu()
	OpenCmds()
	OpenJobs()
	OpenEnts()
end

timer.Simple( 0.7, function()
	GAMEMODE.ShowSpare2 = BuildF4Menu
end ) 
