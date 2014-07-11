function OpenCmds()
	mbg = vgui.Create( "DFrame", SLEEK_MAIN )
	mbg:SetSize( F4Menu:GetWide() - 200 - 60, F4Menu:GetTall() - 50 )
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
	
	mbg:SetVisible( true )
	
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
	
	if table.HasValue( SSK.AccessToCPCmds, LocalPlayer():Team() ) then
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
	
	if table.HasValue( SSK.AccessToMayorCmds, LocalPlayer():Team() ) then
	
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
	
end