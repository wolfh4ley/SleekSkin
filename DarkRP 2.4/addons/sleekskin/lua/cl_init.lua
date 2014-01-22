surface.CreateFont( "fontclose", {
 font = "Cabin",
 size = 14,
 weight = 500,
 blursize = 0,
 scanlines = 0,
 antialias = true
} )

surface.CreateFont( "buyitemfont", {
 font = "Bebas Neue",
 size = 16,
 weight = 500,
 blursize = 0,
 scanlines = 0,
 antialias = true
} )

surface.CreateFont( "sidefont", {
 font = "Bebas Neue",
 size = 22,
 weight = 500,
 blursize = 0,
 scanlines = 0,
 antialias = true
} )

surface.CreateFont( "sidefont2", {
 font = "Bebas Neue",
 size = 18,
 weight = 500,
 blursize = 0,
 scanlines = 0,
 antialias = true
} )

surface.CreateFont( "boxtitlef", {
 font = "Bebas Neue",
 size = 24,
 weight = 500,
 blursize = 0,
 scanlines = 0,
 antialias = true
} )

surface.CreateFont( "boxmainf", {
 font = "Calibri",
 size = 18,
 weight = 500,
 blursize = 0,
 scanlines = 0,
 antialias = true
} )

surface.CreateFont( "buttontextfont", {
 font = "Bebas Neue",
 size = 18,
 weight = 500,
 blursize = 0,
 scanlines = 0,
 antialias = true
} )

surface.CreateFont( "jobtitlef", {
 font = "Bebas Neue",
 size = 30,
 weight = 500,
 blursize = 0,
 scanlines = 0,
 antialias = true
} )

surface.CreateFont( "jobmainf", {
 font = "Myriad Pro",
 size = 13,
 weight = 500,
 blursize = 0,
 scanlines = 0,
 antialias = true
} )

surface.CreateFont( "jobmainf2", {
 font = "Myriad Pro",
 size = 14,
 weight = 0,
 blursize = 0,
 scanlines = 0,
 antialias = true
} )

surface.CreateFont( "entmainf", {
 font = "Bebas Neue",
 size = 20,
 weight = 0,
 blursize = 0,
 scanlines = 0,
 antialias = true
} )

surface.CreateFont( "CategoryTitle", {
 font = "Bebas Neue",
 size = 16,
 weight = 500,
 blursize = 0,
 scanlines = 0,
 antialias = true
} )

surface.CreateFont( "maxjob", {
 font = "Bebas Neue",
 size = 18,
 weight = 500,
 blursize = 0,
 scanlines = 0,
 antialias = true
} )

local textOpen = false


function OpenTextBox( text1, text2, cmd )
	
	local bg = vgui.Create( "DFrame" )
	bg:SetSize( 500, 150 )
	bg:Center()
	bg:MakePopup()
	bg:SetTitle( "" )
	bg:ShowCloseButton( false )
	bg.Init = function(self)
		self.startTime = SysTime()
	end
	bg.Paint = function( self, w, h )
		Derma_DrawBackgroundBlur( self, self.startTime )
		
		draw.RoundedBox( 0, 0, 0, w, h, Color( 224, 224, 224, 255 ) )
		draw.RoundedBox( 0, 1, 1, w - 2, h - 2, Color( 250, 250, 250, 255 ) )
		
		draw.RoundedBox( 0, 0, 0, w, 50, Color( 62, 67, 77 ) )
		
		draw.SimpleText( text1, "boxtitlef", 20, 15, Color( 255, 255, 255, 255 ) )
		draw.SimpleText( text2, "boxmainf", w / 2, 65, Color( 167, 167, 167, 255 ), TEXT_ALIGN_CENTER )
		
		surface.SetDrawColor( Color( 84, 89, 100, 255 ) )
		surface.DrawLine( 1, 1, w - 1, 1 )
		surface.DrawLine( 1, 1, 1, 50 )
	end
	textOpen = true
	
	local cl = vgui.Create( "DButton", bg )
	cl:SetSize( 50, 20 )
	cl:SetPos( bg:GetWide() - 60, 0 )
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
		bg:Close()
		textOpen = false
	end
	cl.OnCursorEntered = function( self )
		self.hover = true
	end
	cl.OnCursorExited = function( self )
		self.hover = false
	end
	
	local myText = vgui.Create("DTextEntry", bg)
	myText:SetText("")
	myText:SetPos( bg:GetWide() / 2 - 100, bg:GetTall() - 60 )
	myText:SetSize( 200, 20	)
	myText.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color(230,230,230))
		draw.RoundedBox( 0, 1, 1, w-2, h-2, Color(255,255,255))
		self:DrawTextEntryText(Color(30, 30, 30), Color(149, 240, 193), Color(0, 0, 0))
	end
	
	local ybut = vgui.Create( "DButton", bg )
	ybut:SetSize( 50, 20 )
	ybut:SetPos( bg:GetWide() / 2 - 20, bg:GetTall() - 34 )
	ybut:SetText( "Accept" )
	ybut:SetFont( "fontclose" )
	ybut:SetTextColor( Color(255,255,255) )
	ybut.Paint = function( self, w, h )
		local gcol
		if self.hover then
			gcol = Color( 36, 190, 255 )
		else
			gcol = Color( 36, 165, 221 )
		end
		draw.RoundedBox( 0, 0, 0, w, h, Color( 16, 96, 130 ) )
		draw.RoundedBox( 0, 1, 1, w - 2, h - 2, gcol )
	end
	ybut.DoClick = function()
		local amt = myText:GetValue()
		local str = cmd.." "..amt
		if amt then
			RunConsoleCommand( "say", str )
		end
		bg:Close()
		textOpen = false
	end
	ybut.OnCursorEntered = function( self )
		self.hover = true
	end
	ybut.OnCursorExited = function( self )
		self.hover = false
	end
end

function OpenPlyBox( text1, text2, cmd )
	
	local bg = vgui.Create( "DFrame" )
	bg:SetSize( 500, 150 )
	bg:Center()
	bg:MakePopup()
	bg:SetTitle( "" )
	bg:ShowCloseButton( false )
	bg.Init = function(self)
		self.startTime = SysTime()
	end
	bg.Paint = function( self, w, h )
		Derma_DrawBackgroundBlur( self, self.startTime )
		
		draw.RoundedBox( 0, 0, 0, w, h, Color( 224, 224, 224, 255 ) )
		draw.RoundedBox( 0, 1, 1, w - 2, h - 2, Color( 250, 250, 250, 255 ) )
		
		draw.RoundedBox( 0, 0, 0, w, 50, Color( 62, 67, 77 ) )
		
		draw.SimpleText( text1, "boxtitlef", 20, 15, Color( 255, 255, 255, 255 ) )
		draw.SimpleText( text2, "boxmainf", w / 2, 62, Color( 167, 167, 167, 255 ), TEXT_ALIGN_CENTER )
		
		surface.SetDrawColor( Color( 84, 89, 100, 255 ) )
		surface.DrawLine( 1, 1, w - 1, 1 )
		surface.DrawLine( 1, 1, 1, 50 )
	end
	textOpen = true
	
	local cl = vgui.Create( "DButton", bg )
	cl:SetSize( 50, 20 )
	cl:SetPos( bg:GetWide() - 60, 0 )
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
		bg:Close()
		textOpen = false
	end
	cl.OnCursorEntered = function( self )
		self.hover = true
	end
	cl.OnCursorExited = function( self )
		self.hover = false
	end
	
	local hl = vgui.Create( "DComboBox", bg)
	hl:SetPos(bg:GetWide() / 2 - 100, 85)
	hl:SetSize( 200, 20 )
	for k,v in pairs(player.GetAll()) do
			hl:AddChoice( v:Name() )
	end
	
	hl.OnSelect = function( panel, index, value, data )
		target = string.Explode( " ", value )[1]
	end
	
	local ybut = vgui.Create( "DButton", bg )
	ybut:SetSize( 50, 20 )
	ybut:SetPos( bg:GetWide() / 2 - 20, bg:GetTall() - 34 )
	ybut:SetText( "Accept" )
	ybut:SetFont( "fontclose" )
	ybut:SetTextColor( Color(255,255,255) )
	ybut.Paint = function( self, w, h )
		local gcol
		if self.hover then
			gcol = Color( 36, 190, 255 )
		else
			gcol = Color( 36, 165, 221 )
		end
		draw.RoundedBox( 0, 0, 0, w, h, Color( 16, 96, 130 ) )
		draw.RoundedBox( 0, 1, 1, w - 2, h - 2, gcol )
	end
	ybut.DoClick = function()
		local str = cmd.." "..target
		if target then
			RunConsoleCommand( "say", str )
		end
		bg:Close()
		textOpen = false
	end
	ybut.OnCursorEntered = function( self )
		self.hover = true
	end
	ybut.OnCursorExited = function( self )
		self.hover = false
	end
end

function OpenPlyReasonBox( text1, text2, text3, cmd )
	
	local bg = vgui.Create( "DFrame" )
	bg:SetSize( 500, 218 )
	bg:Center()
	bg:MakePopup()
	bg:SetTitle( "" )
	bg:ShowCloseButton( false )
	bg.Init = function(self)
		self.startTime = SysTime()
	end
	bg.Paint = function( self, w, h )
		Derma_DrawBackgroundBlur( self, self.startTime )
		
		draw.RoundedBox( 0, 0, 0, w, h, Color( 224, 224, 224, 255 ) )
		draw.RoundedBox( 0, 1, 1, w - 2, h - 2, Color( 250, 250, 250, 255 ) )
		
		draw.RoundedBox( 0, 0, 0, w, 50, Color( 62, 67, 77 ) )
		
		draw.SimpleText( text1, "boxtitlef", 20, 15, Color( 255, 255, 255, 255 ) )
		draw.SimpleText( text2, "boxmainf", w / 2, 60, Color( 167, 167, 167, 255 ), TEXT_ALIGN_CENTER )
		draw.SimpleText( text3, "boxmainf", w / 2, 120, Color( 167, 167, 167, 255 ), TEXT_ALIGN_CENTER )
		
		surface.SetDrawColor( Color( 84, 89, 100, 255 ) )
		surface.DrawLine( 1, 1, w - 1, 1 )
		surface.DrawLine( 1, 1, 1, 50 )
	end
	textOpen = true
	
	local cl = vgui.Create( "DButton", bg )
	cl:SetSize( 50, 20 )
	cl:SetPos( bg:GetWide() - 60, 0 )
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
		bg:Close()
		textOpen = false
	end
	cl.OnCursorEntered = function( self )
		self.hover = true
	end
	cl.OnCursorExited = function( self )
		self.hover = false
	end
	
	local target
	
	local hl = vgui.Create( "DComboBox", bg)
	hl:SetPos(bg:GetWide() / 2 - 100, 85)
	hl:SetSize( 200, 20 )
	for k,v in pairs(player.GetAll()) do
			hl:AddChoice( v:Name() )
	end
	
	hl.OnSelect = function( panel, index, value, data )
		target = string.Explode( " ", value )[1]
	end
	
	local myText = vgui.Create("DTextEntry", bg)
	myText:SetText("")
	myText:SetPos( bg:GetWide() / 2 - 100, bg:GetTall() - 74 )
	myText:SetSize( 200, 20	)
	myText.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color(230,230,230))
		draw.RoundedBox( 0, 1, 1, w-2, h-2, Color(255,255,255))
		self:DrawTextEntryText(Color(30, 30, 30), Color(149, 240, 193), Color(0, 0, 0))
	end
	
	local ybut = vgui.Create( "DButton", bg )
	ybut:SetSize( 50, 20 )
	ybut:SetPos( bg:GetWide() / 2 - 20, bg:GetTall() - 34 )
	ybut:SetText( "Accept" )
	ybut:SetFont( "fontclose" )
	ybut:SetTextColor( Color(255,255,255) )
	ybut.Paint = function( self, w, h )
		local gcol
		if self.hover then
			gcol = Color( 36, 190, 255 )
		else
			gcol = Color( 36, 165, 221 )
		end
		draw.RoundedBox( 0, 0, 0, w, h, Color( 16, 96, 130 ) )
		draw.RoundedBox( 0, 1, 1, w - 2, h - 2, gcol )
	end
	ybut.DoClick = function()
		local amt = myText:GetValue()
		local str = cmd.." "..target.." "..amt
		if amt and target then
			RunConsoleCommand( "say", str )
		end
		bg:Close()
		textOpen = false
	end
	ybut.OnCursorEntered = function( self )
		self.hover = true
	end
	ybut.OnCursorExited = function( self )
		self.hover = false
	end
end

local entOpen

function WrapText(text, width, font) -- Credit goes to BKU for this function!
        surface.SetFont(font)

        -- Any wrapping required?
        local w, _ = surface.GetTextSize(text)
        if w < width then
                return {text} -- Nope, but wrap in table for uniformity
        end
   
        local words = string.Explode(" ", text) -- No spaces means you're screwed

        local lines = {""}
        for i, wrd in pairs(words) do
                local l = #lines
                local added = lines[l] .. " " .. wrd
                if l == 0 then
                        added = wrd
                end
                w, _ = surface.GetTextSize(added)

                if w > width then
                        -- New line needed
                        table.insert(lines, wrd)
                else
                        -- Safe to tack it on
                        lines[l] = added
                end
        end

        return lines
end



/*---------------------------------------------------------------------------
F4 tab sheet
---------------------------------------------------------------------------*/
local function MakeButtons( )
	local man = vgui.Create( "DFrame" )
	man:SetSize( 500, 140 )
	man:Center()
	man:MakePopup()
end

function Pass()
	return
end
local isOpen = false

local function HasStuff( list )
			local stuff = #list:GetItems()
			if stuff > 0 then
				return true
			elseif not stuff then
				return false
			end
		end
		
local BACKGROUND

function OpenRPMenu()

	isOpen = true

	local jobs = team.GetAllTeams()
	
	local bg = vgui.Create( "DFrame" )
	bg:SetSize( 800, 500 )
	bg:Center()
	bg:MakePopup()
	bg:SetDraggable( false )
	bg.Init = function(self)
		self.startTime = SysTime()
	end
	bg.Paint = function(self, w, h)
		Derma_DrawBackgroundBlur( self, self.startTime )
	end
	
	BACKGROUND = bg
	
	local cf = vgui.Create( "Panel", bg )
	cf:SetSize( 200, bg:GetTall() )
	cf.Paint = function( self, w, h )
		draw.RoundedBoxEx( 4, 0, 0, w - 1, h - 2, Color( 83, 88, 100, 255 ), true, false, true, false )
		draw.RoundedBoxEx( 0, 0, 0, w, h, Color( 51, 54, 58, 255 ), true, false, true, false )
		draw.RoundedBoxEx( 4, 1, 224, w - 1, h - 225, Color( 83, 88, 100, 255 ), false, false, true, false )
		
		surface.SetDrawColor( Color( 92, 98, 109, 255 ) )
		surface.DrawLine( 1, 224, 1, bg:GetTall() )
	end
	
	local cp = vgui.Create( "DFrame", bg )
	cp:SetSize( bg:GetWide() - 200, bg:GetTall() )
	cp:SetPos( 200, 0 )
	cp:ShowCloseButton( false )
	cp:SetTitle( "" )
	cp.Paint = function( self, w, h )
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
	
	local cl = vgui.Create( "DButton", cp )
	cl:SetSize( 50, 20 )
	cl:SetPos( cp:GetWide() - 60, 0 )
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
		bg:Close()
		isOpen = false
		textOpen = false
	end
	cl.OnCursorEntered = function( self )
		self.hover = true
	end
	cl.OnCursorExited = function( self )
		self.hover = false
	end
	
	local bbs
	
	local dp = vgui.Create( "Panel", cf )
	dp:SetSize( cp:GetWide(), 24 )
	dp:SetPos( 0, 224 )
	dp.Paint = function( self, w, h )
		
		draw.RoundedBox( 0, 0, 0, w, h, Color( 60, 63, 71 ) )
		
		surface.SetDrawColor( Color( 72, 77, 84, 255 ) )
		surface.DrawLine( 1, 1, 200, 1 )
		surface.DrawLine( 1, 1, 1, 54 )
		
		draw.RoundedBox( 0, 2, 2, w - 4, h - 3, Color( 63, 68, 77 ) )
		
	end
	
	local jcol = Color( 92, 97, 111, 255 )
	
	local mbg
	local jbg
	local ebg
	
	local function OpenCmds()
		mbg = vgui.Create( "DFrame", cp )
		mbg:SetSize( bg:GetWide() - 200 - 60, bg:GetTall() - 50 )
		mbg:SetPos( 30, 30 )
		mbg:ShowCloseButton( false )
		mbg:SetTitle( "" )
		mbg.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 232, 234, 236, 255 ) )
		end
		
		local main = vgui.Create( "DPanelList", mbg )
		main:SetSize( mbg:GetWide(), mbg:GetTall() )
		main:SetPos( 0, 0 )
		main:EnableVerticalScrollbar( true )
		main.Paint = function( s, w, h )
			draw.RoundedBox( 4, 3, 13, 8, h-24, Color(0,0,0,70))
			draw.RoundedBox( 4, 0, 0, w, h, Color( 232, 234, 236, 255 ))
		end
		main.VBar.Paint = function( s, w, h )
			draw.RoundedBox( 4, 3, 13, 8, h-24, Color(0,0,0,70))
		end
		main.VBar.btnUp.Paint = function( s, w, h ) end
		main.VBar.btnDown.Paint = function( s, w, h ) end
		main.VBar.btnGrip.Paint = function( s, w, h )
			draw.RoundedBox( 4, 5, 0, 4, h+22, Color(0,0,0,70))
		end
		
		local monpan = vgui.Create( "DCollapsibleCategory", main )
		monpan:SetSize( main:GetWide(), 100 )
		monpan:SetExpanded( true )
		monpan:SetLabel( "Weapons" )
		monpan.PaintOver = function( self, w, h )
			--draw.RoundedBox( 0, 0, 0, w, h, Color( 224, 224, 224, 255 ) )
			--draw.RoundedBox( 0, 1, 1, w - 2, h - 2, Color( 250, 250, 250, 255 ) )
			
			surface.SetDrawColor( Color( 224, 224, 224, 255 ) )
			surface.DrawLine( 0, 20, w, 20 )
			
			draw.RoundedBox( 0, 0, 0, w, 20, Color( 51, 54, 58, 255 ) )
			
			draw.RoundedBox( 0, 1, 1, w - 2, 20 - 2, Color( 62, 67, 77 ) )
			
			surface.SetDrawColor( Color( 84, 89, 100, 255 ) )
			surface.DrawLine( 1, 1, w - 1, 1 )
			surface.DrawLine( 1, 1, 1, 20 )
			surface.DrawLine( 1, 18, w - 1, 18 )
			surface.DrawLine( w - 2, 1, w - 2, 20 )
			
			draw.SimpleText( SSK.FirstCommandsTitle, "CategoryTitle", 10, 3, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT )
		end
		
		local monlist = vgui.Create( "DPanelList", monpan )
		monlist:SetWide( main:GetWide() )
		monlist:SetAutoSize( true )
		monlist:SetSpacing( 2 )
		monlist:SetPos( 0, 20 )
		monlist:EnableVerticalScrollbar( false )
		monlist.Paint = function( s, w, h )
			draw.RoundedBox( 4, 3, 13, 8, h-24, Color(0,0,0,70))
			
			draw.RoundedBox( 0, 0, 0, w, h, Color(232,234,236,255))
		end
		
		local rppan = vgui.Create( "DCollapsibleCategory", main )
		rppan:SetSize( main:GetWide(), 100 )
		rppan:SetExpanded( true )
		rppan:SetLabel( "Weapons" )
		rppan.PaintOver = function( self, w, h )
			--draw.RoundedBox( 0, 0, 0, w, h, Color( 224, 224, 224, 255 ) )
			--draw.RoundedBox( 0, 1, 1, w - 2, h - 2, Color( 250, 250, 250, 255 ) )
			
			surface.SetDrawColor( Color( 224, 224, 224, 255 ) )
			surface.DrawLine( 0, 20, w, 20 )
			
			draw.RoundedBox( 0, 0, 0, w, 20, Color( 51, 54, 58, 255 ) )
			
			draw.RoundedBox( 0, 1, 1, w - 2, 20 - 2, Color( 62, 67, 77 ) )
			
			surface.SetDrawColor( Color( 84, 89, 100, 255 ) )
			surface.DrawLine( 1, 1, w - 1, 1 )
			surface.DrawLine( 1, 1, 1, 20 )
			surface.DrawLine( 1, 18, w - 1, 18 )
			surface.DrawLine( w - 2, 1, w - 2, 20 )
			
			draw.SimpleText( SSK.SecondCommandsTitle, "CategoryTitle", 10, 3, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT )
		end
		
		local rplist = vgui.Create( "DPanelList", rppan )
		rplist:SetWide( main:GetWide() )
		rplist:SetAutoSize( true )
		rplist:SetSpacing( 2 )
		rplist:SetPos( 0, 20 )
		rplist:EnableVerticalScrollbar( false )
		rplist.Paint = function( s, w, h )
			draw.RoundedBox( 4, 3, 13, 8, h-24, Color(0,0,0,70))
			draw.RoundedBox( 0, 0, 0, w, h, Color(232,234,236,255))
		end
		
		local otpan = vgui.Create( "DCollapsibleCategory", main )
		otpan:SetSize( main:GetWide(), 100 )
		otpan:SetExpanded( true )
		otpan:SetLabel( "Weapons" )
		otpan.PaintOver = function( self, w, h )
			--draw.RoundedBox( 0, 0, 0, w, h, Color( 224, 224, 224, 255 ) )
			--draw.RoundedBox( 0, 1, 1, w - 2, h - 2, Color( 250, 250, 250, 255 ) )
			
			surface.SetDrawColor( Color( 224, 224, 224, 255 ) )
			surface.DrawLine( 0, 20, w, 20 )
			
			draw.RoundedBox( 0, 0, 0, w, 20, Color( 51, 54, 58, 255 ) )
			
			draw.RoundedBox( 0, 1, 1, w - 2, 20 - 2, Color( 62, 67, 77 ) )
			
			surface.SetDrawColor( Color( 84, 89, 100, 255 ) )
			surface.DrawLine( 1, 1, w - 1, 1 )
			surface.DrawLine( 1, 1, 1, 20 )
			surface.DrawLine( 1, 18, w - 1, 18 )
			surface.DrawLine( w - 2, 1, w - 2, 20 )
			
			draw.SimpleText( SSK.ThirdCommandsTitle, "CategoryTitle", 10, 3, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT )
		end
		
		local otlist = vgui.Create( "DPanelList", otpan )
		otlist:SetWide( main:GetWide() )
		otlist:SetAutoSize( true )
		otlist:SetSpacing( 2 )
		otlist:SetPos( 0, 20 )
		otlist:EnableVerticalScrollbar( false )
		otlist.Paint = function( s, w, h )
			draw.RoundedBox( 4, 3, 13, 8, h-24, Color(0,0,0,70))
			draw.RoundedBox( 0, 0, 0, w, h, Color(232,234,236,255))
		end
		
		main:AddItem( monpan )
		main:AddItem( rppan )
		main:AddItem( otpan )
		
		local cplist
		local maylist
		local cppan
		local yyp
		
		local function OpenCPCmds()
			cppan = vgui.Create( "DCollapsibleCategory", main )
			cppan:SetSize( main:GetWide(), 100 )
			cppan:SetExpanded( true )
			cppan:SetLabel( "Weapons" )
			cppan.PaintOver = function( self, w, h )
				--draw.RoundedBox( 0, 0, 0, w, h, Color( 224, 224, 224, 255 ) )
				--draw.RoundedBox( 0, 1, 1, w - 2, h - 2, Color( 250, 250, 250, 255 ) )
			
				surface.SetDrawColor( Color( 224, 224, 224, 255 ) )
				surface.DrawLine( 0, 20, w, 20 )
			
				draw.RoundedBox( 0, 0, 0, w, 20, Color( 51, 54, 58, 255 ) )
			
				draw.RoundedBox( 0, 1, 1, w - 2, 20 - 2, Color( 62, 67, 77 ) )
			
				surface.SetDrawColor( Color( 84, 89, 100, 255 ) )
				surface.DrawLine( 1, 1, w - 1, 1 )
				surface.DrawLine( 1, 1, 1, 20 )
				surface.DrawLine( 1, 18, w - 1, 18 )
				surface.DrawLine( w - 2, 1, w - 2, 20 )
			
				draw.SimpleText( SSK.CPCommandsTitle, "CategoryTitle", 10, 3, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT )
			end
		
			cplist = vgui.Create( "DPanelList", cppan )
			cplist:SetWide( main:GetWide() )
			cplist:SetAutoSize( true )
			cplist:SetSpacing( 2 )
			cplist:SetPos( 0, 20 )
			cplist:EnableVerticalScrollbar( false )
			cplist.Paint = function( s, w, h )
				draw.RoundedBox( 4, 3, 13, 8, h-24, Color(0,0,0,70))
				draw.RoundedBox( 0, 0, 0, w, h, Color(232,234,236,255))
			end
			
			main:AddItem( cppan )
			
			for k, v in pairs( CPCMD_BUTTONS ) do
			local gtl = vgui.Create( "DButton", mcmdp )
			--gtl:SetPos( 20, 62 + ( 26 * (k - 1) ) + ( ( k - 1 ) * 6 ) )
			gtl:SetSize( mbg:GetWide() - 40, 30 )
			gtl:SetText( "" )
			gtl.Paint = function( self, w, h )
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
				surface.DrawLine( 1, 1, 1, 30 )
				surface.DrawLine( 1, 28, w - 1, 28 )
				surface.DrawLine( w - 2, 1, w - 2, 30 )
				draw.SimpleText( v.NAME, "buttontextfont", w / 2, 7, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER )
			end
			gtl.DoClick = function()
				v.FUNC()
			end
			gtl.OnCursorEntered = function( self )
				self.hover = true
			end
			gtl.OnCursorExited = function( self )
				self.hover = false
			end
			
			cplist:AddItem( gtl )
		end
		end
		
		local function OpenMayorCmds()
			local ypp = vgui.Create( "DCollapsibleCategory", main )
			ypp:SetSize( main:GetWide(), 314 )
			ypp:SetExpanded( true )
			ypp:SetLabel( "" )
			ypp:SetPos( 0, 466 )
			ypp.Paint = function( self, w, h )
				--draw.RoundedBox( 0, 0, 0, w, h, Color( 224, 224, 224, 255 ) )
				--draw.RoundedBox( 0, 1, 1, w - 2, h - 2, Color( 250, 250, 250, 255 ) )
			
				surface.SetDrawColor( Color( 224, 224, 224, 255 ) )
				surface.DrawLine( 0, 20, w, 20 )
			
				draw.RoundedBox( 0, 0, 0, w, 20, Color( 51, 54, 58, 255 ) )
			
				draw.RoundedBox( 0, 1, 1, w - 2, 20 - 2, Color( 62, 67, 77 ) )
			
				surface.SetDrawColor( Color( 84, 89, 100, 255 ) )
				surface.DrawLine( 1, 1, w - 1, 1 )
				surface.DrawLine( 1, 1, 1, 20 )
				surface.DrawLine( 1, 18, w - 1, 18 )
				surface.DrawLine( w - 2, 1, w - 2, 20 )
			
				draw.SimpleText( SSK.MayorCommandsTitle, "CategoryTitle", 10, 3, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT )
			end
			
			local maylist = vgui.Create( "DPanelList", ypp )
			maylist:SetWide( main:GetWide() )
			maylist:SetAutoSize( true )
			maylist:SetSpacing( 2 )
			maylist:SetPos( 0, 20 )
			maylist:EnableVerticalScrollbar( false )
			maylist.Paint = function( s, w, h )
				draw.RoundedBox( 4, 3, 13, 8, h-24, Color(0,0,0,70))
				draw.RoundedBox( 0, 0, 0, w, h, Color(232,234,236,255))
			end
			
			main:AddItem( ypp )
			
			local ypc
			
			for k, v in pairs( MAYORCMD_BUTTONS ) do
			ypc = vgui.Create( "DButton", kfdjdk )
			ypc:SetSize( main:GetWide() - 40, 30 )
			ypc:SetText( "" )
			ypc.Paint = function( self, w, h )
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
				surface.DrawLine( 1, 1, 1, 30 )
				surface.DrawLine( 1, 28, w - 1, 28 )
				surface.DrawLine( w - 2, 1, w - 2, 30 )
				draw.SimpleText( v.NAME, "buttontextfont", w / 2, 7, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER )
			end
			ypc.DoClick = function()
				v.FUNC()
			end
			ypc.OnCursorEntered = function( self )
				self.hover = true
			end
			ypc.OnCursorExited = function( self )
				self.hover = false
			end
			maylist:AddItem( ypc )
			end
		end
		
		if table.HasValue( AccessToCPCmds, team.GetName(LocalPlayer():Team()) ) then
			OpenCPCmds()
		elseif table.HasValue( AccessToMayorCmds, team.GetName(LocalPlayer():Team()) ) then
			OpenMayorCmds()
		end
		
		--Money Commands
		for k, v in pairs( MONEYCMD_BUTTONS ) do
			local gtl = vgui.Create( "DButton", mcmdp )
			--gtl:SetPos( 20, 62 + ( 26 * (k - 1) ) + ( ( k - 1 ) * 6 ) )
			gtl:SetSize( mbg:GetWide() - 40, 30 )
			gtl:SetText( "" )
			gtl.Paint = function( self, w, h )
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
				surface.DrawLine( 1, 1, 1, 30 )
				surface.DrawLine( 1, 28, w - 1, 28 )
				surface.DrawLine( w - 2, 1, w - 2, 30 )
				draw.SimpleText( v.NAME, "buttontextfont", w / 2, 7, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER )
			end
			gtl.DoClick = function()
				v.FUNC()
			end
			gtl.OnCursorEntered = function( self )
				self.hover = true
			end
			gtl.OnCursorExited = function( self )
				self.hover = false
			end
			
			monlist:AddItem( gtl )
		end
		
		for k, v in pairs( RPCMD_BUTTONS ) do
			local crp = vgui.Create( "DButton", rpp )
			--crp:SetPos( 20, 64 + ( 26 * (k - 1) ) + ( ( k - 1 ) * 6 ) )
			crp:SetSize( mbg:GetWide() - 40, 30 )
			crp:SetText( "" )
			crp.Paint = function( self, w, h )
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
				surface.DrawLine( 1, 1, 1, 30 )
				surface.DrawLine( 1, 28, w - 1, 28 )
				surface.DrawLine( w - 2, 1, w - 2, 30 )
				draw.SimpleText( v.NAME, "buttontextfont", w / 2, 7, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER )
			end
			crp.DoClick = function()
				v.FUNC()
			end
			crp.OnCursorEntered = function( self )
				self.hover = true
			end
			crp.OnCursorExited = function( self )
				self.hover = false
			end
			
			rplist:AddItem( crp )
		end
		
		for k, v in pairs( OTHERCMD_BUTTONS ) do
			local gtl = vgui.Create( "DButton", mcmdp )
			gtl:SetSize( mbg:GetWide() - 40, 30 )
			gtl:SetText( "" )
			gtl.Paint = function( self, w, h )
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
				surface.DrawLine( 1, 1, 1, 30 )
				surface.DrawLine( 1, 28, w - 1, 28 )
				surface.DrawLine( w - 2, 1, w - 2, 30 )
				draw.SimpleText( v.NAME, "buttontextfont", w / 2, 7, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER )
			end
			gtl.DoClick = function()
				v.FUNC()
			end
			gtl.OnCursorEntered = function( self )
				self.hover = true
			end
			gtl.OnCursorExited = function( self )
				self.hover = false
			end
			
			otlist:AddItem( gtl )
		end
		
		local monHas = HasStuff( monlist )
		local rpHas = HasStuff( rplist )
		local otHas = HasStuff( otlist )
		
		
		monpan:SetExpanded( monHas )
		rppan:SetExpanded( rpHas )
		otpan:SetExpanded( otHas )
		
	end
	
	local function OpenJobs()
		jbg = vgui.Create( "DFrame", cp )
		jbg:SetSize( bg:GetWide() - 200 - 60, bg:GetTall() - 50 )
		jbg:SetPos( 30, 30 )
		jbg:ShowCloseButton( false )
		jbg:SetTitle( "" )
		jbg.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 232, 234, 236, 255 ) )
		end
		
		local main = vgui.Create( "DPanelList", jbg )
		main:SetSize( jbg:GetWide(), jbg:GetTall() )
		main:SetSpacing( 0 )
		main:SetPos( 0, 0 )
		main:EnableVerticalScrollbar( true )
		main.Paint = function( s, w, h )
			draw.RoundedBox( 4, 3, 13, 8, h-24, Color(0,0,0,70))
		end
		main.VBar.Paint = function( s, w, h )
			draw.RoundedBox( 4, 3, 13, 8, h-24, Color(0,0,0,70))
		end
		main.VBar.btnUp.Paint = function( s, w, h ) end
		main.VBar.btnDown.Paint = function( s, w, h ) end
		main.VBar.btnGrip.Paint = function( s, w, h )
			draw.RoundedBox( 4, 5, 0, 4, h+22, Color(0,0,0,70))
		end
		/*main.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 224, 224, 224, 255 ) )
			draw.RoundedBox( 0, 1, 1, w - 2, h - 2, Color( 250, 250, 250, 255 ) )
			
			surface.SetDrawColor( Color( 224, 224, 224, 255 ) )
			surface.DrawLine( 0, 50, w, 50 )
			
			draw.RoundedBox( 0, 0, 0, w, 50, Color( 51, 54, 58, 255 ) )
			
			draw.RoundedBox( 0, 1, 1, w - 2, 50 - 2, Color( 62, 67, 77 ) )
			
			surface.SetDrawColor( Color( 84, 89, 100, 255 ) )
			surface.DrawLine( 1, 1, w - 1, 1 )
			surface.DrawLine( 1, 1, 1, 50 )
			
			draw.SimpleText( "MONEY COMMANDS", "boxtitlef", 26, 15, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT )
		end*/
		
		--Money Commands
		local function AddJobPanel( v )
			
			local dc = string.Implode( " ", string.Explode( " ", v.description))
			local real
			
			if string.len( dc ) > 320 then
				real = string.sub( dc, 1, 320 )..".."
			else
				real = dc
			end
		
		
			local jobc = vgui.Create( "DFrame", main )
			jobc:SetSize( main:GetWide(), 120 )
			jobc:SetTitle( "" )
			jobc:ShowCloseButton( false )
			jobc:SetDraggable( false )
			jobc.Paint = function( self, w, h )
				draw.RoundedBox( 0, 0, 0, w, h + 20, Color( 224, 224, 224, 255 ) )
				draw.RoundedBox( 0, 1, 1, w - 2, h - 2, Color( 250, 250, 250, 255 ) )
				
				local x2, y2 = main:LocalToScreen( 0, 0 )
				local w2, h2 = main:GetSize()
				render.SetScissorRect( x2, y2, x2 + w2, y2 + h2, true )

		
				render.SetScissorRect( 0, 0, 0, 0, false )
			end

			local total = team.NumPlayers( v.team )
			
			local lab = vgui.Create( "DLabel", jobc )
			lab:SetPos( 9, 6 )
			lab:SetText( v.name.." - Salary: $"..v.salary.." ("..total.."/"..v.max..")" )
			lab:SetFont( "jobtitlef" )
			lab:SetTextColor( Color( 0, 0, 0, 255 ) )
			lab:SizeToContents()
			
			local desc = vgui.Create( "DLabel", jobc )
			desc:SetPos( 10, 34 )
			desc:SetSize( jobc:GetWide() - 200, jobc:GetTall() )
			desc:SetTextColor( Color( 0, 0, 0, 200 ) )
			desc:SetWrap( true )
			desc:SetFont( "jobmainf" )
			
			desc:SetText( real )
			desc:SetAutoStretchVertical( true )
			
			local icon = vgui.Create("DModelPanel", jobc)
			icon:SetPos( jobc:GetWide() - 148, 10 )
			local IconModel = v.model
			if type(v.model) == "table" then
				IconModel = v.model[math.random(#v.model)]
			end
			icon:SetModel(IconModel)
			icon:SetSize( 100, 100 )
			local ent = icon:GetEntity()
            ent:SetEyeTarget(Vector(20, 00, 65)) -- otherwise the model will have its eyes pointing down
			icon:SetCamPos(Vector(30, 10, 75))
                       
            icon:SetAnimated(false)
            function icon:LayoutEntity() end --disable rotation
			local oldpaint = icon.Paint
			function icon:Paint()
				
				local x2, y2 = main:LocalToScreen( 0, 0 )
				local w2, h2 = main:GetSize()
				render.SetScissorRect( x2, y2, x2 + w2, y2 + h2, true )

				oldpaint( self )
		
				render.SetScissorRect( 0, 0, 0, 0, false )
			end
			
			local afj = vgui.Create( "DButton", jobc )
			afj:SetSize( 90, 20 )
			afj:SetPos( jobc:GetWide() - 142, jobc:GetTall() - 30 )
			afj:SetText( "Choose Job" )
			afj:SetFont( "buyitemfont" )
			afj:SetTextColor( Color( 255, 255, 255, 255 ) )
			afj.Paint = function( self, w, h )
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
				surface.DrawLine( 1, 1, 1, 20 )
				surface.DrawLine( 1, 18, w - 1, 18 )
				surface.DrawLine( w - 2, 1, w - 2, 20 )
			end
			afj.DoClick = function( self )
			
				if type(v.model) == "table" and table.Count( v.model ) > 1 then
					local CH_MAIN = vgui.Create( "DFrame" )
					CH_MAIN:SetSize( 400, 500 )
					CH_MAIN:Center()
					CH_MAIN:MakePopup()
					CH_MAIN:SetTitle( "" )
					CH_MAIN:ShowCloseButton( false )
					CH_MAIN.Init = function(self)
						self.startTime = SysTime()
					end
					CH_MAIN.Paint = function( self, w, h )
						Derma_DrawBackgroundBlur( self, self.startTime )
		
						draw.RoundedBox( 0, 0, 0, w, h, Color( 224, 224, 224, 255 ) )
						draw.RoundedBox( 0, 1, 1, w - 2, h - 2, Color( 250, 250, 250, 255 ) )
		
						draw.RoundedBox( 0, 0, 0, w, 40, Color( 62, 67, 77 ) )
		
						draw.SimpleText( "Choose a model", "boxtitlef", 20, 10, Color( 255, 255, 255, 255 ) )
						draw.SimpleText( "", "boxmainf", w / 2, 60, Color( 167, 167, 167, 255 ), TEXT_ALIGN_CENTER )
		
						surface.SetDrawColor( Color( 84, 89, 100, 255 ) )
						surface.DrawLine( 1, 1, w - 1, 1 )
						surface.DrawLine( 1, 1, 1, 40 )
					end
					
					local cl = vgui.Create( "DButton", CH_MAIN )
					cl:SetSize( 50, 20 )
					cl:SetPos( CH_MAIN:GetWide() - 60, 0 )
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
						CH_MAIN:Close()
						bg:Close()
					end
					cl.OnCursorEntered = function( self )
						self.hover = true
					end
					cl.OnCursorExited = function( self )
						self.hover = false
					end
					
					local curModel = table.GetFirstValue( v.model )
					
					local CH_MODEL = vgui.Create( "DModelPanel", CH_MAIN )
					CH_MODEL:SetSize( 500, 460 )
					CH_MODEL:SetModel( curModel )
					CH_MODEL:Center()
					
					local CH_PREV = vgui.Create( "DButton", CH_MAIN )
					CH_PREV:SetSize( 40, 60 )
					CH_PREV:SetPos( 50, CH_MAIN:GetTall() / 2 - 30 )
					CH_PREV:SetText( "<" )
					CH_PREV:SetFont( "boxtitlef" )
					CH_PREV:SetTextColor( Color( 255, 255, 255, 255 ) )
					CH_PREV.Paint = function( self, w, h )
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
						surface.DrawLine( 1, 1, 1, 100 )
						surface.DrawLine( 1, 98, w - 1, 98 )
						surface.DrawLine( w - 2, 1, w - 2, 100 )
					end
					CH_PREV.DoClick = function()
						local nextModel = table.FindPrev( v.model, curModel )
						CH_MODEL:SetModel( nextModel )
						curModel = nextModel
						
					end
					CH_PREV.OnCursorEntered = function( self )
						self.hover = true
					end
					CH_PREV.OnCursorExited = function( self )
						self.hover = false
					end
					
					local CH_NEXT = vgui.Create( "DButton", CH_MAIN )
					CH_NEXT:SetSize( 40, 60 )
					CH_NEXT:SetPos( CH_MAIN:GetWide() - 90, CH_MAIN:GetTall() / 2 - 30 )
					CH_NEXT:SetText( ">" )
					CH_NEXT:SetFont( "boxtitlef" )
					CH_NEXT:SetTextColor( Color( 255, 255, 255, 255 ) )
					CH_NEXT.Paint = function( self, w, h )
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
						surface.DrawLine( 1, 1, 1, 100 )
						surface.DrawLine( 1, 98, w - 1, 98 )
						surface.DrawLine( w - 2, 1, w - 2, 100 )
					end
					CH_NEXT.DoClick = function()
						local nextModel = table.FindNext( v.model, curModel )
						CH_MODEL:SetModel( nextModel )
						curModel = nextModel
						
					end
					CH_NEXT.OnCursorEntered = function( self )
						self.hover = true
					end
					CH_NEXT.OnCursorExited = function( self )
						self.hover = false
					end
					
					local CH_OKAY = vgui.Create( "DButton", CH_MAIN )
					CH_OKAY:SetSize( 120, 30 )
					CH_OKAY:SetPos( CH_MAIN:GetWide() / 2 - 60, CH_MAIN:GetTall() - 50 )
					CH_OKAY:SetText( "Accept" )
					CH_OKAY:SetFont( "buyitemfont" )
					CH_OKAY:SetTextColor( Color( 255, 255, 255, 255 ) )
					CH_OKAY.Paint = function( self, w, h )
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
						surface.DrawLine( 1, 1, 1, 100 )
						surface.DrawLine( 1, 98, w - 1, 98 )
						surface.DrawLine( w - 2, 1, w - 2, 100 )
					end
					CH_OKAY.DoClick = function()
						CH_MAIN:Close()
						bg:Close()
						if v.vote or v.RequiresVote and v.RequiresVote(LocalPlayer(), v.team) then
							RunConsoleCommand( "say", "/vote" .. v.command )
						else
							RunConsoleCommand( "say", "/"..v.command )
						end
						LocalPlayer():SetModel( curModel )
					end
					CH_OKAY.OnCursorEntered = function( self )
						self.hover = true
					end
					CH_OKAY.OnCursorExited = function( self )
						self.hover = false
					end
				else
					bg:Close()
					if v.vote or v.RequiresVote and v.RequiresVote(LocalPlayer(), v.team) then
						RunConsoleCommand( "say", "/vote" .. v.command )
					else
						RunConsoleCommand( "say", "/"..v.command )
					end
				end
			end
			afj.OnCursorEntered = function( self )
				self.hover = true
			end
			afj.OnCursorExited = function( self )
				self.hover = false
			end
			
			if v.vote or v.RequiresVote and v.RequiresVote(LocalPlayer(), v.team) then
				afj:SetText("Create Vote")
			end
			
			main:AddItem( jobc )
		end

		for key, job in pairs( RPExtraTeams ) do
			local check = job.customCheck or function( ply ) return true end
			
			
		
			if LocalPlayer():Team() == job.NeedToChangeFrom || !job.NeedToChangeFrom then
				if check( LocalPlayer() ) then
					AddJobPanel( job )
				end
			end
		end
		
	end
	
	local function OpenEnts()
		ebg = vgui.Create( "DFrame", cp )
		ebg:SetSize( bg:GetWide() - 200 - 60, bg:GetTall() - 50 )
		ebg:SetPos( 30, 30 )
		ebg:ShowCloseButton( false )
		ebg:SetTitle( "" )
		ebg.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 232, 234, 236, 255 ) )
		end
		
		local main = vgui.Create( "DPanelList", ebg )
		main:SetSize( ebg:GetWide(), ebg:GetTall() )
		main:SetPos( 0, 0 )
		main:EnableVerticalScrollbar( true )
		main.Paint = function( s, w, h )
			draw.RoundedBox( 4, 3, 13, 8, h-24, Color(0,0,0,70))
			draw.RoundedBox( 4, 0, 0, w, h, Color( 232, 234, 236, 255 ))
		end
		main.VBar.Paint = function( s, w, h )
			draw.RoundedBox( 4, 3, 13, 8, h-24, Color(0,0,0,70))
		end
		main.VBar.btnUp.Paint = function( s, w, h ) end
		main.VBar.btnDown.Paint = function( s, w, h ) end
		main.VBar.btnGrip.Paint = function( s, w, h )
			draw.RoundedBox( 4, 5, 0, 4, h+22, Color(0,0,0,70))
		end
		
		local wepan = vgui.Create( "DCollapsibleCategory", main )
		wepan:SetSize( main:GetWide(), 100 )
		wepan:SetExpanded( true )
		wepan:SetLabel( "Weapons" )
		wepan.PaintOver = function( self, w, h )
			--draw.RoundedBox( 0, 0, 0, w, h, Color( 224, 224, 224, 255 ) )
			--draw.RoundedBox( 0, 1, 1, w - 2, h - 2, Color( 250, 250, 250, 255 ) )
			
			surface.SetDrawColor( Color( 224, 224, 224, 255 ) )
			surface.DrawLine( 0, 20, w, 20 )
			
			draw.RoundedBox( 0, 0, 0, w, 20, Color( 51, 54, 58, 255 ) )
			
			draw.RoundedBox( 0, 1, 1, w - 2, 20 - 2, Color( 62, 67, 77 ) )
			
			surface.SetDrawColor( Color( 84, 89, 100, 255 ) )
			surface.DrawLine( 1, 1, w - 1, 1 )
			surface.DrawLine( 1, 1, 1, 20 )
			surface.DrawLine( 1, 18, w - 1, 18 )
			surface.DrawLine( w - 2, 1, w - 2, 20 )
			
			draw.SimpleText( "WEAPONS", "CategoryTitle", 10, 3, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT )
		end
		
		local weplist = vgui.Create( "DPanelList", wepan )
		weplist:SetWide( main:GetWide() )
		weplist:SetAutoSize( true )
		weplist:SetSpacing( 0 )
		weplist:SetPos( 0, 20 )
		weplist:EnableVerticalScrollbar( false )
		weplist.Paint = function( s, w, h )
			draw.RoundedBox( 4, 3, 13, 8, h-24, Color(0,0,0,70))
		end
		
		local ammopan = vgui.Create( "DCollapsibleCategory", main )
		ammopan:SetSize( main:GetWide(), 100 )
		ammopan:SetExpanded( true )
		ammopan:SetLabel( "Weapons" )
		ammopan.PaintOver = function( self, w, h )
			--draw.RoundedBox( 0, 0, 0, w, h, Color( 224, 224, 224, 255 ) )
			--draw.RoundedBox( 0, 1, 1, w - 2, h - 2, Color( 250, 250, 250, 255 ) )
			
			surface.SetDrawColor( Color( 224, 224, 224, 255 ) )
			surface.DrawLine( 0, 20, w, 20 )
			
			draw.RoundedBox( 0, 0, 0, w, 20, Color( 51, 54, 58, 255 ) )
			
			draw.RoundedBox( 0, 1, 1, w - 2, 20 - 2, Color( 62, 67, 77 ) )
			
			surface.SetDrawColor( Color( 84, 89, 100, 255 ) )
			surface.DrawLine( 1, 1, w - 1, 1 )
			surface.DrawLine( 1, 1, 1, 20 )
			surface.DrawLine( 1, 18, w - 1, 18 )
			surface.DrawLine( w - 2, 1, w - 2, 20 )
			
			draw.SimpleText( "AMMO", "CategoryTitle", 10, 3, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT )
		end
		
		local ammolist = vgui.Create( "DPanelList", ammopan )
		ammolist:SetWide( main:GetWide() )
		ammolist:SetAutoSize( true )
		ammolist:SetSpacing( 0 )
		ammolist:SetPos( 0, 20 )
		ammolist:EnableVerticalScrollbar( false )
		ammolist.Paint = function( s, w, h )
			draw.RoundedBox( 4, 3, 13, 8, h-24, Color(0,0,0,70))
		end
		
		local vehpan = vgui.Create( "DCollapsibleCategory", main )
		vehpan:SetSize( main:GetWide(), 100 )
		vehpan:SetExpanded( true )
		vehpan:SetLabel( "Weapons" )
		vehpan.PaintOver = function( self, w, h )
			--draw.RoundedBox( 0, 0, 0, w, h, Color( 224, 224, 224, 255 ) )
			--draw.RoundedBox( 0, 1, 1, w - 2, h - 2, Color( 250, 250, 250, 255 ) )
			
			surface.SetDrawColor( Color( 224, 224, 224, 255 ) )
			surface.DrawLine( 0, 20, w, 20 )
			
			draw.RoundedBox( 0, 0, 0, w, 20, Color( 51, 54, 58, 255 ) )
			
			draw.RoundedBox( 0, 1, 1, w - 2, 20 - 2, Color( 62, 67, 77 ) )
			
			surface.SetDrawColor( Color( 84, 89, 100, 255 ) )
			surface.DrawLine( 1, 1, w - 1, 1 )
			surface.DrawLine( 1, 1, 1, 20 )
			surface.DrawLine( 1, 18, w - 1, 18 )
			surface.DrawLine( w - 2, 1, w - 2, 20 )
			
			draw.SimpleText( "VEHICLES", "CategoryTitle", 10, 3, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT )
		end
		
		local vehlist = vgui.Create( "DPanelList", vehpan )
		vehlist:SetWide( main:GetWide() )
		vehlist:SetAutoSize( true )
		vehlist:SetSpacing( 0 )
		vehlist:SetPos( 0, 20 )
		vehlist.Paint = function( s, w, h )
			draw.RoundedBox( 4, 3, 13, 8, h-24, Color(0,0,0,70))
		end
		
		local otpan = vgui.Create( "DCollapsibleCategory", main )
		otpan:SetSize( main:GetWide(), 100 )
		otpan:SetExpanded( true )
		otpan.PaintOver = function( self, w, h )
			--draw.RoundedBox( 0, 0, 0, w, h, Color( 224, 224, 224, 255 ) )
			--draw.RoundedBox( 0, 1, 1, w - 2, h - 2, Color( 250, 250, 250, 255 ) )
			
			surface.SetDrawColor( Color( 224, 224, 224, 255 ) )
			surface.DrawLine( 0, 20, w, 20 )
			
			draw.RoundedBox( 0, 0, 0, w, 20, Color( 51, 54, 58, 255 ) )
			
			draw.RoundedBox( 0, 1, 1, w - 2, 20 - 2, Color( 62, 67, 77 ) )
			
			surface.SetDrawColor( Color( 84, 89, 100, 255 ) )
			surface.DrawLine( 1, 1, w - 1, 1 )
			surface.DrawLine( 1, 1, 1, 20 )
			surface.DrawLine( 1, 18, w - 1, 18 )
			surface.DrawLine( w - 2, 1, w - 2, 20 )
			
			draw.SimpleText( "OTHER", "CategoryTitle", 10, 3, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT )
		end
		
		local otlist = vgui.Create( "DPanelList", otpan )
		otlist:SetWide( main:GetWide() )
		otlist:SetAutoSize( true )
		otlist:SetSpacing( 0 )
		otlist:SetPos( 0, 20 )
		otlist.Paint = function( s, w, h )
			draw.RoundedBox( 4, 3, 13, 8, h-24, Color(0,0,0,70))
		end
		
		main:AddItem( wepan )
		main:AddItem( ammopan )
		main:AddItem( vehpan )
		main:AddItem( otpan )
		
		local function DrawEntButton( ent, offset )
			if ent.allowed and !table.HasValue(ent.allowed, LocalPlayer():Team()) then
				return
			end
			local jobc = vgui.Create( "DFrame" )
			jobc:SetSize( main:GetWide(), 54 )
			jobc:SetTitle( "" )
			jobc:ShowCloseButton( false )
			jobc:SetDraggable( false )
			jobc.Paint = function( self, w, h )
				draw.RoundedBox( 0, 0, 0, w, h + 20, Color( 224, 224, 224, 255 ) )
				draw.RoundedBox( 0, 1, 1, w - 2, h - 2, Color( 250, 250, 250, 255 ) )
				
				local x2, y2 = main:LocalToScreen( 0, 0 )
				local w2, h2 = main:GetSize()
				render.SetScissorRect( x2, y2, x2 + w2, y2 + h2, true )

		
				render.SetScissorRect( 0, 0, 0, 0, false )
			end
			
			local fx
			local sx
			
			if ent.max then
				fx = ""
			elseif ent.noship == false then
				fx = "Shipment of "
			elseif ent.noship then
				fx = ""
			else
				fx = ""
			end
			
			local lab = vgui.Create( "DLabel", jobc )
			lab:SetPos( 10, 6 )
			lab:SetText( fx..ent.name )
			lab:SetFont( "jobtitlef" )
			lab:SetTextColor( Color( 0, 0, 0, 255 ) )
			lab:SizeToContents()
			
			local desc = vgui.Create( "DLabel", jobc )
			desc:SetPos( 10, 30 )
			desc:SetSize( jobc:GetWide() - 200, jobc:GetTall() )
			desc:SetTextColor( Color( 0, 0, 0, 200 ) )
			desc:SetWrap( true )
			desc:SetFont( "entmainf" )
			
			if ent.noship == false and ent.seperate then
				desc:SetText( "Shipment: $"..ent.price..", Single: $"..ent.pricesep )
			else
				desc:SetText( "Price: $"..ent.price )
			end
			desc:SetAutoStretchVertical( true )
			
			local icon = vgui.Create("SpawnIcon", jobc)
			icon:SetPos( jobc:GetWide() - 208, 0 )
			local IconModel = ent.model
			if type(ent.model) == "table" then
				IconModel = ent.model[math.random(#ent.model)]
			end
			icon:SetModel(IconModel)
			icon:SetSize( 50, 50 )
            --icon:SetCamPos(Vector(20, 0, 65))
                       
            --function icon:LayoutEntity() end --disable rotation
			/*local oldpaint = icon.Paint
			function icon:Paint()
				
				local x2, y2 = main:LocalToScreen( 0, 0 )
				local w2, h2 = main:GetSize()
				render.SetScissorRect( x2, y2, x2 + w2, y2 + h2, true )

				oldpaint( self )
		
				render.SetScissorRect( 0, 0, 0, 0, false )
			end*/
			
			local afj = vgui.Create( "DButton", jobc )
			afj:SetSize( 90, 20 )
			if ent.noship == false and ent.seperate then
				afj:SetPos( jobc:GetWide() - 142, 6 )
				afj:SetText( "Buy Shipment" )
			else
				afj:SetPos( jobc:GetWide() - 142, 17 )
				afj:SetText( "Buy Item" )
			end
			
			afj:SetFont( "buyitemfont" )
			afj:SetTextColor( Color( 255, 255, 255, 255 ) )
			afj.Paint = function( self, w, h )
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
				surface.DrawLine( 1, 1, 1, 20 )
				surface.DrawLine( 1, 18, w - 1, 18 )
				surface.DrawLine( w - 2, 1, w - 2, 20 )
			end
			afj.DoClick = function()
				if ent.max then
					RunConsoleCommand( "DarkRP", ent.cmd )
				elseif ent.noship == false then
					RunConsoleCommand( "say", "/buyshipment "..ent.name )
				elseif ent.noship then
					RunConsoleCommand( "say", "/buy "..ent.name )
				elseif table.HasValue( GAMEMODE.AmmoTypes, ent ) then
					RunConsoleCommand( "say", "/buyammo "..ent.ammoType )
				elseif table.HasValue( CustomVehicles, ent ) then
					RunConsoleCommand( "DarkRP", "buyvehicle", ent.name )
				end
			end
			afj.OnCursorEntered = function( self )
				self.hover = true
			end
			afj.OnCursorExited = function( self )
				self.hover = false
			end

			if ent.noship == false and ent.seperate then
			local single = vgui.Create( "DButton", jobc )
			single:SetSize( 90, 20 )
			single:SetPos( jobc:GetWide() - 142, 28 )
			single:SetText( "Buy Single" )
			single:SetFont( "buyitemfont" )
			single:SetTextColor( Color( 255, 255, 255, 255 ) )
			single.Paint = function( self, w, h )
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
				surface.DrawLine( 1, 1, 1, 20 )
				surface.DrawLine( 1, 18, w - 1, 18 )
				surface.DrawLine( w - 2, 1, w - 2, 20 )
			end
			single.DoClick = function()
				RunConsoleCommand( "say", "/buy "..ent.name )
			end
			single.OnCursorEntered = function( self )
				self.hover = true
			end
			single.OnCursorExited = function( self )
				self.hover = false
			end
		end
			
			if table.HasValue( GAMEMODE.AmmoTypes, ent ) then
				ammolist:AddItem( jobc )
			elseif table.HasValue( CustomShipments, ent ) then
				weplist:AddItem( jobc )
			elseif table.HasValue( CustomVehicles, ent ) then
				vehlist:AddItem( jobc )
			else
				otlist:AddItem( jobc )
			end
		end
		
		local shipments = fn.Filter(fn.Curry(fn.GetValue, 2)("seperate"), CustomShipments)
		local ships = fn.Filter(fn.Compose{fn.Not, fn.Curry(fn.GetValue, 2)("noship")}, CustomShipments)
		
		local allents = {}
		
		for k, v in pairs( DarkRPEntities ) do
			table.insert( allents, v )
		end
		
		for k, v in pairs( CustomShipments ) do
			table.insert( allents, v )
		end
		
		for k, v in pairs( GAMEMODE.AmmoTypes ) do
			table.insert( allents, v )
		end
		
		for k, v in pairs( CustomVehicles ) do
			table.insert( allents, v )
		end
		
		for k, v in pairs( allents ) do
			if !SSK.ShowDonatorEntitiesToAll then
			local hasCheck
			if v.customCheck then
				hasCheck = true
			end
			if hasCheck and v.customCheck( LocalPlayer() ) then
				DrawEntButton( v, k )
			elseif !hasCheck then
				DrawEntButton( v, k )
			end
			else
				DrawEntButton( v, k )
			end
		end
		
		entOpen = true
		
		local wepHas = HasStuff( weplist )
		local ammoHas = HasStuff( ammolist )
		local vehHas = HasStuff( vehlist )
		local otHas = HasStuff( otlist )
		
		wepan:SetExpanded( wepHas )
		ammopan:SetExpanded( ammoHas )
		vehpan:SetExpanded( vehHas )
		otpan:SetExpanded( otHas )
		
	end
	
	local function OpenWebpage( title, webpage )
		local cm = vgui.Create( "DFrame" )
	cm:SetSize( 1040, 640 )
	cm:Center()
	cm:MakePopup()
	cm:SetTitle( "" )
	cm:ShowCloseButton( false )
	cm.Init = function(self)
		self.startTime = SysTime()
	end
	cm.Paint = function( self, w, h )
		Derma_DrawBackgroundBlur( self, self.startTime )
		
		draw.RoundedBox( 0, 0, 0, w, h, Color( 224, 224, 224, 255 ) )
		draw.RoundedBox( 0, 1, 1, w - 2, h - 2, Color( 250, 250, 250, 255 ) )
		
		draw.RoundedBox( 0, 0, 0, w, 50, Color( 62, 67, 77 ) )
		
		draw.SimpleText( title, "boxtitlef", 20, 15, Color( 255, 255, 255, 255 ) )
		
		surface.SetDrawColor( Color( 84, 89, 100, 255 ) )
		surface.DrawLine( 1, 1, w - 1, 1 )
		surface.DrawLine( 1, 1, 1, 50 )
		surface.DrawLine( 1, 48, w - 1, 48 )
		surface.DrawLine( w - 1, 1, w - 1, 48 )
	end
	textOpen = true
	
	local cl = vgui.Create( "DButton", cm )
	cl:SetSize( 50, 20 )
	cl:SetPos( cm:GetWide() - 60, 0 )
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
		cm:Close()
		textOpen = false
	end
	cl.OnCursorEntered = function( self )
		self.hover = true
	end
	cl.OnCursorExited = function( self )
		self.hover = false
	end
		
		HTMLTest = vgui.Create("HTML", cm)
		HTMLTest:SetPos(0,50)
		HTMLTest:SetSize(cm:GetWide(), cm:GetTall() - 50)
		HTMLTest:OpenURL(webpage)
	end
	
	local mclick = false
	local jclick = false
	local eclick = false
	local fclick = false
	local dclick = false
	local mhover = false
	local jhover = false
	local ehover = false
	local fhover = false
	local dhover = false
	
	--Title Panel
	local tp = vgui.Create( "Panel", cf )
	tp:SetPos( 1, 1 )
	tp:SetSize( cf:GetWide(), 62 )
	tp.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 64, 69, 78 ) )
		
		surface.SetDrawColor( Color( 84, 89, 100, 255 ) )
		surface.DrawLine( 0, 0, 200, 0 )
		surface.DrawLine( 0, 0, 0, 64 )
		
		surface.SetDrawColor( Color( 51, 54, 58, 255 ) )
		surface.DrawLine( 0, 61, 200, 61 )
		
		--draw.SimpleText( LocalPlayer():Name(), "sidefont", 60, 20 )
	end
	
	local name = vgui.Create( "DLabel", tp )
	name:SetPos( 54, 14 )
	name:SetSize( 140, 32 )
	name:SetFont( "sidefont" )
	name:SetText( LocalPlayer():Name() )
	name:SetTextColor( Color( 255, 255, 255, 255 ) )
	
	local ava = vgui.Create( "AvatarImage", tp )
	ava:SetPos( 16, 14 )
	ava:SetSize( 32, 32 )
	ava:SetPlayer( LocalPlayer(), 32 )
	
	local cmdOpen = false
	local jobOpen = false
	
	
	--Money/Command Panel
	local mp = vgui.Create( "Panel", cf )
	mp:SetSize( cp:GetWide(), 54 )
	mp:SetPos( 1, 63 )
	mp.Paint = function( self, w, h )	
		if mhover then
			draw.RoundedBox( 0, 0, 0, w, h, Color( 87, 92, 104 ) )
			
			surface.SetDrawColor( Color( 73, 78, 87, 255 ) )
			surface.DrawLine( 1, 0, 200, 0 )
		
			surface.SetDrawColor( Color( 79, 83, 93, 255 ) )
			surface.DrawLine( 1, 1, 200, 1 )
		
			surface.SetDrawColor( Color( 83, 88, 99, 255 ) )
			surface.DrawLine( 1, 2, 200, 2 )
		elseif mclick then
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
		draw.SimpleText( SSK.CommandsTabTitle, "sidefont", 22, 17, Color( 255, 255, 255, 255 ) )
	end
	
	local mb = vgui.Create( "DButton", cf )
	mb:SetSize( cf:GetWide(), 54 )
	mb:SetPos( 1, 63 )
	mb:SetText( "" )
	mb.Paint = function()
	
	end
	mb.DoClick = function()
		mclick = true
		jclick = false
		eclick = false
		fclick = false
		dp:MoveTo( 0, 224, 0.1, 0, 1 )
		if jobOpen then
			jbg:Close()
			jobOpen = false
		end
		/*if entOpen then
			f:Close()
			entOpen = false
		end*/
		if entOpen then
			ebg:Close()
			entOpen = false
		end
		if !cmdOpen then
			OpenCmds()
		end
		cmdOpen = true
	end
	mb.OnCursorEntered = function()
		mhover = true
	end
	mb.OnCursorExited = function()
		mhover = false
	end
	
	local jp = vgui.Create( "Panel", cf )
	jp:SetSize( cp:GetWide(), 54 )
	jp:SetPos( 1, 118 )
	jp.Paint = function( self, w, h )
		if jhover then
			draw.RoundedBox( 0, 0, 0, w, h, Color( 87, 92, 104 ) )
			
			surface.SetDrawColor( Color( 73, 78, 87, 255 ) )
			surface.DrawLine( 1, 0, 200, 0 )
		
			surface.SetDrawColor( Color( 79, 83, 93, 255 ) )
			surface.DrawLine( 1, 1, 200, 1 )
		
			surface.SetDrawColor( Color( 83, 88, 99, 255 ) )
			surface.DrawLine( 1, 2, 200, 2 )
		elseif jclick then
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
			
			surface.SetDrawColor( Color( 93, 99, 111, 255 ) )
			surface.DrawLine( 1, 0, 200, 0 )
		end
		
		draw.SimpleText( SSK.JobsTabTitle, "sidefont", 22, 17, Color( 255, 255, 255, 255 ) )
		
		surface.SetDrawColor( Color( 51, 54, 58, 255 ) )
		surface.DrawLine( 0, 51, 200, 51 )
		
		
	end
	
	local jb = vgui.Create( "DButton", cf )
	jb:SetSize( cf:GetWide(), 54 )
	jb:SetPos( 1, 117 )
	jb:SetText( "" )
	jb.Paint = function()
	
	end
	jb.DoClick = function()
		jclick = true
		mclick = false
		eclick = false
		fclick = false
		dp:MoveTo( 0, 224, 0.1, 0, 1 )
		if cmdOpen then
			mbg:Close()
			cmdOpen = false
		end
		/*if entOpen then
			f:Close()
			entOpen = false
		end*/
		if !jobOpen then
			OpenJobs()
		end
		if entOpen then
			ebg:Close()
			entOpen = false
		end
		jobOpen = true
	end
	jb.OnCursorEntered = function()
		jhover = true
	end
	jb.OnCursorExited = function()
		jhover = false
	end
	
	local ep = vgui.Create( "Panel", cf )
	ep:SetSize( cp:GetWide(), 54 )
	ep:SetPos( 1, 170 )
	ep.Paint = function( self, w, h )
		if ehover then
			draw.RoundedBox( 0, 0, 0, w, h, Color( 87, 92, 104 ) )
			
			surface.SetDrawColor( Color( 73, 78, 87, 255 ) )
			surface.DrawLine( 1, 0, 200, 0 )
		
			surface.SetDrawColor( Color( 79, 83, 93, 255 ) )
			surface.DrawLine( 1, 1, 200, 1 )
		
			surface.SetDrawColor( Color( 83, 88, 99, 255 ) )
			surface.DrawLine( 1, 2, 200, 2 )
		elseif eclick then
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
			
			surface.SetDrawColor( Color( 93, 99, 111, 255 ) )
			surface.DrawLine( 1, 0, 200, 0 )
		end
		
		draw.SimpleText( SSK.EntitiesTabTitle, "sidefont", 22, 17, Color( 255, 255, 255, 255 ) )
		
		
	end
	
	local ep = vgui.Create( "DButton", cf )
	ep:SetSize( cf:GetWide(), 54 )
	ep:SetPos( 1, 170 )
	ep:SetText( "" )
	ep.Paint = function()
	
	end
	ep.DoClick = function()
		jclick = false
		mclick = false
		eclick = true
		fclick = false
		/*if jobOpen then
			jbg:Close()
			jobOpen = false
		end*/
		if cmdOpen then
			mbg:Close()
			cmdOpen = false
		end
		if jobOpen then
			jbg:Close()
			jobOpen = false
		end
		if !entOpen then
			OpenEnts()
		end
		entOpen = true
	end
	ep.OnCursorEntered = function()
		ehover = true
	end
	ep.OnCursorExited = function()
		ehover = false
	end
	
	local fp = vgui.Create( "Panel", cf )
	fp:SetSize( cp:GetWide(), 54 )
	fp:SetPos( 1, 248 )
	fp.Paint = function( self, w, h )
		if fhover then
			draw.RoundedBox( 0, 0, 0, w, h, Color( 87, 92, 104 ) )
			
			surface.SetDrawColor( Color( 73, 78, 87, 255 ) )
			surface.DrawLine( 1, 0, 200, 0 )
		
			surface.SetDrawColor( Color( 79, 83, 93, 255 ) )
			surface.DrawLine( 1, 1, 200, 1 )
		
			surface.SetDrawColor( Color( 83, 88, 99, 255 ) )
			surface.DrawLine( 1, 2, 200, 2 )
		elseif fclick then
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
			
			surface.SetDrawColor( Color( 93, 99, 111, 255 ) )
			surface.DrawLine( 1, 0, 200, 0 )
		end
		
		draw.SimpleText( "Forum", "sidefont", 22, 17, Color( 255, 255, 255, 255 ) )
		
		surface.SetDrawColor( Color( 51, 54, 58, 255 ) )
		surface.DrawLine( 0, 51, 200, 51 )
		
		
	end
	
	local fb = vgui.Create( "DButton", cf )
	fb:SetSize( cf:GetWide(), 54 )
	fb:SetPos( 1, 248 )
	fb:SetText( "" )
	fb.Paint = function()
	
	end
	fb.DoClick = function()
		jclick = false
		mclick = false
		eclick = false
		dclick = false
		OpenWebpage( "Forum Webpage", SSK.ForumURL )
		bg:Close()
	end
	fb.OnCursorEntered = function()
		fhover = true
	end
	fb.OnCursorExited = function()
		fhover = false
	end
	
	local DP = vgui.Create( "Panel", cf )
	DP:SetSize( cp:GetWide(), 54 )
	DP:SetPos( 1, 248 + 52 )
	DP.Paint = function( self, w, h )
		if dhover then
			draw.RoundedBox( 0, 0, 0, w, h, Color( 87, 92, 104 ) )
			
			surface.SetDrawColor( Color( 73, 78, 87, 255 ) )
			surface.DrawLine( 1, 0, 200, 0 )
		
			surface.SetDrawColor( Color( 79, 83, 93, 255 ) )
			surface.DrawLine( 1, 1, 200, 1 )
		
			surface.SetDrawColor( Color( 83, 88, 99, 255 ) )
			surface.DrawLine( 1, 2, 200, 2 )
		elseif dclick then
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
			
			surface.SetDrawColor( Color( 93, 99, 111, 255 ) )
			surface.DrawLine( 1, 0, 200, 0 )
		end
		
		draw.SimpleText( "Donate", "sidefont", 22, 17, Color( 255, 255, 255, 255 ) )
		
		surface.SetDrawColor( Color( 51, 54, 58, 255 ) )
		surface.DrawLine( 0, 51, 200, 51 )
		
		
	end
	
	local db = vgui.Create( "DButton", cf )
	db:SetSize( cf:GetWide(), 54 )
	db:SetPos( 1, 248 + 52 )
	db:SetText( "" )
	db.Paint = function()
	
	end
	db.DoClick = function()
		jclick = false
		mclick = false
		eclick = false
		fclick = false
		dclick = false
		OpenWebpage( "Donate Webpage", SSK.DonateURL )
		bg:Close()
	end
	db.OnCursorEntered = function()
		dhover = true
	end
	db.OnCursorExited = function()
		dhover = false
	end
	
	mclick = true
	jclick = false
	eclick = false
	dclick = false
	fclick = false
	cmdOpen = true
	entOpen = false
	jobOpen = false
	if jobOpen then
		jbg:Close()
		jobOpen = false
	end
	OpenCmds()
	
end

local function MsgDoVote(msg)
	local _, chatY = chat.GetChatBoxPos()

	local question = msg:ReadString()
	local voteid = msg:ReadShort()
	local timeleft = msg:ReadFloat()
	if timeleft == 0 then
		timeleft = 100
	end
	local OldTime = CurTime()
	if not IsValid(LocalPlayer()) then return end -- Sent right before player initialisation

	LocalPlayer():EmitSound("Town.d1_town_02_elevbell1", 100, 100)
	local panel = vgui.Create("DFrame")
	panel:SetPos(3 + PanelNum, chatY - 145)
	panel:SetTitle("Vote")
	panel:SetSize(140, 140)
	panel:SetSizable(false)
	panel.btnClose:SetVisible(false)
	panel:SetDraggable(false)
	function panel:Close()
		PanelNum = PanelNum - 140
		VoteVGUI[voteid .. "vote"] = nil

		local num = 0
		for k,v in SortedPairs(VoteVGUI) do
			v:SetPos(num, ScrH() / 2 - 50)
			num = num + 140
		end

		for k,v in SortedPairs(QuestionVGUI) do
			v:SetPos(num, ScrH() / 2 - 50)
			num = num + 300
		end
		self:Remove()
	end

	function panel:Think()
		self:SetTitle("Time: ".. tostring(math.Clamp(math.ceil(timeleft - (CurTime() - OldTime)), 0, 9999)))
		if timeleft - (CurTime() - OldTime) <= 0 then
			panel:Close()
		end
	end

	panel:SetKeyboardInputEnabled(false)
	panel:SetMouseInputEnabled(true)
	panel:SetVisible(true)

	for i = 22, string.len(question), 22 do
		if not string.find(string.sub(question, i - 20, i), "\n", 1, true) then
			question = string.sub(question, 1, i) .. "\n".. string.sub(question, i + 1, string.len(question))
		end
	end

	local label = vgui.Create("DLabel")
	label:SetParent(panel)
	label:SetPos(5, 25)
	label:SetText(question)
	label:SizeToContents()
	label:SetVisible(true)

	local nextHeight = label:GetTall() > 78 and label:GetTall() - 78 or 0 // make panel taller for divider and buttons
	panel:SetTall(panel:GetTall() + nextHeight)

	local divider = vgui.Create("Divider")
	divider:SetParent(panel)
	divider:SetPos(2, panel:GetTall() - 30)
	divider:SetSize(180, 2)
	divider:SetVisible(true)

	local ybutton = vgui.Create("Button")
	ybutton:SetParent(panel)
	ybutton:SetPos(25, panel:GetTall() - 25)
	ybutton:SetSize(40, 20)
	ybutton:SetCommand("!")
	ybutton:SetText("Yes")
	ybutton:SetVisible(true)
	ybutton.DoClick = function()
		LocalPlayer():ConCommand("vote " .. voteid .. " yea\n")
		panel:Close()
	end

	local nbutton = vgui.Create("Button")
	nbutton:SetParent(panel)
	nbutton:SetPos(70, panel:GetTall() - 25)
	nbutton:SetSize(40, 20)
	nbutton:SetCommand("!")
	nbutton:SetText("No")
	nbutton:SetVisible(true)
	nbutton.DoClick = function()
		LocalPlayer():ConCommand("vote " .. voteid .. " nay\n")
		panel:Close()
	end

	PanelNum = PanelNum + 140
	VoteVGUI[voteid .. "vote"] = panel
	panel:SetSkin(GAMEMODE.Config.DarkRPSkin)
end
usermessage.Hook("DoVote", MsgDoVote)

local KeyFrameVisible = false
local function OpenKeyMenu(um)
	local Vehicle = LocalPlayer():GetEyeTrace().Entity
	Vehicle = IsValid(Vehicle) and Vehicle:IsVehicle()
	if KeyFrameVisible then return end
	local trace = LocalPlayer():GetEyeTrace()
	local Frame = vgui.Create("DFrame")
	KeyFrameVisible = true
	Frame:SetSize(200, 470)
	Frame:Center()
	Frame:SetVisible(true)
	Frame:MakePopup()

	function Frame:Think()
		local ent = LocalPlayer():GetEyeTrace().Entity
		if not IsValid(ent) or (not ent:IsDoor() and not ent:IsVehicle()) or ent:GetPos():Distance(LocalPlayer():GetPos()) > 200 then
			self:Close()
		end
		if (!self.Dragging) then return end
		local x = gui.MouseX() - self.Dragging[1]
		local y = gui.MouseY() - self.Dragging[2]
		x = math.Clamp( x, 0, ScrW() - self:GetWide() )
		y = math.Clamp( y, 0, ScrH() - self:GetTall() )
		self:SetPos( x, y )
	end
	local Entiteh = "door"
	if Vehicle then
		Entiteh = "vehicle"
	end
	Frame:SetTitle(Entiteh .. " options")

	function Frame:Close()
		KeyFrameVisible = false
		self:SetVisible( false )
		self:Remove()
	end

	if not IsValid(trace.Entity) then Frame:Close() return end
	if trace.Entity:OwnedBy(LocalPlayer()) then
		if not trace.Entity.DoorData then return end -- Don't open the menu when the door settings are not loaded yet
		local Owndoor = vgui.Create("DButton", Frame)
		Owndoor:SetPos(10, 30)
		Owndoor:SetSize(180, 100)
		Owndoor:SetText("Sell " .. Entiteh)
		Owndoor.DoClick = function() RunConsoleCommand("darkrp", "/toggleown") Frame:Close() end

		local AddOwner = vgui.Create("DButton", Frame)
		AddOwner:SetPos(10, 140)
		AddOwner:SetSize(180, 100)
		AddOwner:SetText("Add owner")
		AddOwner.DoClick = function()
			local menu = DermaMenu()
			menu.found = false
			for k,v in pairs(player.GetAll()) do
				if not trace.Entity:OwnedBy(v) and not trace.Entity:AllowedToOwn(v) then
					menu.found = true
					menu:AddOption(v:Nick(), function() RunConsoleCommand("darkrp", "/ao", v:SteamID()) end)
				end
			end
			if not menu.found then
				menu:AddOption("Noone available", function() end)
			end
			menu:Open()
		end

		local RemoveOwner = vgui.Create("DButton", Frame)
		RemoveOwner:SetPos(10, 250)
		RemoveOwner:SetSize(180, 100)
		RemoveOwner:SetText("Remove owner")
		RemoveOwner.DoClick = function()
			local menu = DermaMenu()
			for k,v in pairs(player.GetAll()) do
				if (trace.Entity:OwnedBy(v) and not trace.Entity:IsMasterOwner(v)) or trace.Entity:AllowedToOwn(v) then
					menu.found = true
					menu:AddOption(v:Nick(), function() RunConsoleCommand("darkrp", "/ro", v:SteamID()) end)
				end
			end
			if not menu.found then
				menu:AddOption("Noone available", function() end)
			end
			menu:Open()
		end

		local DoorTitle = vgui.Create("DButton", Frame)
		DoorTitle:SetPos(10, 360)
		DoorTitle:SetSize(180, 100)
		DoorTitle:SetText("Set "..Entiteh.." title")
		if not trace.Entity:IsMasterOwner(LocalPlayer()) then
			RemoveOwner.m_bDisabled = true
		end
		DoorTitle.DoClick = function()
			Derma_StringRequest("Set door title", "Set the title of the "..Entiteh.." you're looking at", "", function(text)
				RunConsoleCommand("darkrp", "/title", text)
				if ValidPanel(Frame) then
					Frame:Close()
				end
			end,
			function() end, "OK!", "CANCEL!")
		end

		if (FAdmin and FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "rp_doorManipulation") or LocalPlayer():IsAdmin()) and not Vehicle then
			Frame:SetSize(200, Frame:GetTall() + 110)
			local SetCopsOnly = vgui.Create("DButton", Frame)
			SetCopsOnly:SetPos(10, Frame:GetTall() - 110)
			SetCopsOnly:SetSize(180, 100)
			SetCopsOnly:SetText("Edit Door Group")
			SetCopsOnly.DoClick = function()
				local menu = DermaMenu()
				local groups = menu:AddSubMenu("Door Groups")
				local teams = menu:AddSubMenu("Jobs")
				local add = teams:AddSubMenu("Add")
				local remove = teams:AddSubMenu("Remove")

				menu:AddOption("None", function() RunConsoleCommand("darkrp", "/togglegroupownable") Frame:Close() end)
				for k,v in pairs(RPExtraTeamDoors) do
					groups:AddOption(k, function() RunConsoleCommand("darkrp", "/togglegroupownable", k) Frame:Close() end)
				end

				if not trace.Entity.DoorData then return end

				for k,v in pairs(RPExtraTeams) do
					if not trace.Entity.DoorData.TeamOwn or not trace.Entity.DoorData.TeamOwn[k] then
						add:AddOption( v.name, function() RunConsoleCommand("darkrp", "/toggleteamownable", k) Frame:Close() end )
					else
						remove:AddOption( v.name, function() RunConsoleCommand("darkrp", "/toggleteamownable", k) Frame:Close() end )
					end
				end

				menu:Open()
			end
		end
	elseif not trace.Entity:OwnedBy(LocalPlayer()) and trace.Entity:IsOwnable() and not trace.Entity:IsOwned() and not trace.Entity.DoorData.NonOwnable then
		if not trace.Entity.DoorData.GroupOwn then
			Frame:SetSize(200, 140)
			local Owndoor = vgui.Create("DButton", Frame)
			Owndoor:SetPos(10, 30)
			Owndoor:SetSize(180, 100)
			Owndoor:SetText("Buy " .. Entiteh)
			Owndoor.DoClick = function() RunConsoleCommand("darkrp", "/toggleown") Frame:Close() end
		end

		if (FAdmin and FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "rp_doorManipulation") or LocalPlayer():IsAdmin()) then
			if trace.Entity.DoorData.GroupOwn then
				Frame:SetSize(200, 250)
			else
				Frame:SetSize(200, 360)
			end

			local DisableOwnage = vgui.Create("DButton", Frame)
			DisableOwnage:SetPos(10, Frame:GetTall() - 220)
			DisableOwnage:SetSize(180, 100)
			DisableOwnage:SetText("Disallow ownership")
			DisableOwnage.DoClick = function() Frame:Close() RunConsoleCommand("darkrp", "/toggleownable") end

			local SetCopsOnly = vgui.Create("DButton", Frame)
			SetCopsOnly:SetPos(10, Frame:GetTall() - 110)
			SetCopsOnly:SetSize(180, 100)
			SetCopsOnly:SetText("Edit Door Group")
			SetCopsOnly.DoClick = function()
				local menu = DermaMenu()
				local groups = menu:AddSubMenu("Door Groups")
				local teams = menu:AddSubMenu("Jobs")
				local add = teams:AddSubMenu("Add")
				local remove = teams:AddSubMenu("Remove")

				menu:AddOption("None", function() RunConsoleCommand("darkrp", "/togglegroupownable") Frame:Close() end)
				for k,v in pairs(RPExtraTeamDoors) do
					groups:AddOption(k, function() RunConsoleCommand("darkrp", "/togglegroupownable", k) Frame:Close() end)
				end

				if not trace.Entity.DoorData then return end

				for k,v in pairs(RPExtraTeams) do
					if not trace.Entity.DoorData.TeamOwn or not trace.Entity.DoorData.TeamOwn[k] then
						add:AddOption(v.name, function() RunConsoleCommand("darkrp", "/toggleteamownable", k) if Frame.Close then Frame:Close() end end)
					else
						remove:AddOption(v.name, function() RunConsoleCommand("darkrp", "/toggleteamownable", k) Frame:Close() end)
					end
				end

				menu:Open()
			end
		elseif not trace.Entity.DoorData.GroupOwn then
			RunConsoleCommand("darkrp", "/toggleown")
			Frame:Close()
			KeyFrameVisible = true
			timer.Simple(0.3, function() KeyFrameVisible = false end)
		end
	elseif not trace.Entity:OwnedBy(LocalPlayer()) and trace.Entity:AllowedToOwn(LocalPlayer()) then
		Frame:SetSize(200, 140)
		local Owndoor = vgui.Create("DButton", Frame)
		Owndoor:SetPos(10, 30)
		Owndoor:SetSize(180, 100)
		Owndoor:SetText("Co-own " .. Entiteh)
		Owndoor.DoClick = function() RunConsoleCommand("darkrp", "/toggleown") Frame:Close() end

		if (FAdmin and FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "rp_doorManipulation") or LocalPlayer():IsAdmin()) then
			Frame:SetSize(200, Frame:GetTall() + 110)
			local SetCopsOnly = vgui.Create("DButton", Frame)
			SetCopsOnly:SetPos(10, Frame:GetTall() - 110)
			SetCopsOnly:SetSize(180, 100)
			SetCopsOnly:SetText("Edit Door Group")
			SetCopsOnly.DoClick = function()
				local menu = DermaMenu()
				local groups = menu:AddSubMenu("Door Groups")
				local teams = menu:AddSubMenu("Jobs")
				local add = teams:AddSubMenu("Add")
				local remove = teams:AddSubMenu("Remove")

				menu:AddOption("None", function() RunConsoleCommand("darkrp", "/togglegroupownable") Frame:Close() end)
				for k,v in pairs(RPExtraTeamDoors) do
					groups:AddOption(k, function() RunConsoleCommand("darkrp", "/togglegroupownable", k) Frame:Close() end)
				end

				if not trace.Entity.DoorData then return end

				for k,v in pairs(RPExtraTeams) do
					if not trace.Entity.DoorData.TeamOwn or not trace.Entity.DoorData.TeamOwn[k] then
						add:AddOption( v.name, function() RunConsoleCommand("darkrp", "/toggleteamownable", k) Frame:Close() end )
					else
						remove:AddOption( v.name, function() RunConsoleCommand("darkrp", "/toggleteamownable", k) Frame:Close() end )
					end
				end

				menu:Open()
			end
		else
			RunConsoleCommand("darkrp", "/toggleown")
			Frame:Close()
			KeyFrameVisible = true
			timer.Simple(0.3, function() KeyFrameVisible = false end)
		end
	elseif (FAdmin and FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "rp_doorManipulation") or LocalPlayer():IsAdmin()) and trace.Entity.DoorData.NonOwnable then
		Frame:SetSize(200, 250)
		local EnableOwnage = vgui.Create("DButton", Frame)
		EnableOwnage:SetPos(10, 30)
		EnableOwnage:SetSize(180, 100)
		EnableOwnage:SetText("Allow ownership")
		EnableOwnage.DoClick = function() Frame:Close() RunConsoleCommand("darkrp", "/toggleownable") end

		local DoorTitle = vgui.Create("DButton", Frame)
		DoorTitle:SetPos(10, Frame:GetTall() - 110)
		DoorTitle:SetSize(180, 100)
		DoorTitle:SetText("Set "..Entiteh.." title")
		DoorTitle.DoClick = function()
			Derma_StringRequest("Set door title", "Set the title of the "..Entiteh.." you're looking at", "", function(text) RunConsoleCommand("darkrp", "/title", text) Frame:Close() end, function() end, "OK!", "CANCEL!")
		end
	elseif (FAdmin and FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "rp_doorManipulation") or LocalPlayer():IsAdmin()) and not trace.Entity:OwnedBy(LocalPlayer()) and trace.Entity:IsOwned() and not trace.Entity:AllowedToOwn(LocalPlayer()) then
		Frame:SetSize(200, 250)
		local DisableOwnage = vgui.Create("DButton", Frame)
		DisableOwnage:SetPos(10, 30)
		DisableOwnage:SetSize(180, 100)
		DisableOwnage:SetText("Disallow ownership")
		DisableOwnage.DoClick = function() Frame:Close() RunConsoleCommand("darkrp", "/toggleownable") end

		local SetCopsOnly = vgui.Create("DButton", Frame)
		SetCopsOnly:SetPos(10, Frame:GetTall() - 110)
		SetCopsOnly:SetSize(180, 100)
		SetCopsOnly:SetText("Edit Door Group")
			SetCopsOnly.DoClick = function()
				local menu = DermaMenu()
				local groups = menu:AddSubMenu("Door Groups")
				local teams = menu:AddSubMenu("Jobs")
				local add = teams:AddSubMenu("Add")
				local remove = teams:AddSubMenu("Remove")

				if not trace.Entity.DoorData then return end

				menu:AddOption("None", function() RunConsoleCommand("darkrp", "/togglegroupownable") Frame:Close() end)
				for k,v in pairs(RPExtraTeamDoors) do
					groups:AddOption(k, function() RunConsoleCommand("darkrp", "/togglegroupownable", k) Frame:Close() end)
				end

				for k,v in pairs(RPExtraTeams) do
					if not trace.Entity.DoorData.TeamOwn or not trace.Entity.DoorData.TeamOwn[k] then
						add:AddOption( v.name, function() RunConsoleCommand("darkrp", "/toggleteamownable", k) Frame:Close() end )
					else
						remove:AddOption( v.name, function() RunConsoleCommand("darkrp", "/toggleteamownable", k) Frame:Close() end )
					end
				end

				menu:Open()
			end
	else
		Frame:Close()
	end

	Frame:SetSkin(GAMEMODE.Config.DarkRPSkin)
end

hook.Add( "InitPostEntity", "OverrideVote", function()
	usermessage.Hook("DoVote", MsgDoVote)
	--usermessage.Hook("KeysMenu", OpenKeyMenu)
	GAMEMODE.ShowSpare2 = OpenRPMenu
	--GAMEMODE.ShowTeam = OpenKeyMenu
end )