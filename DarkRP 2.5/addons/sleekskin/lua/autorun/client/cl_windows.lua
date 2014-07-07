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