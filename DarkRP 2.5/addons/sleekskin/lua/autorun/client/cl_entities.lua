function OpenEnts()
	ebg = vgui.Create( "DFrame", SLEEK_MAIN )
	ebg:SetSize( F4Menu:GetWide() - 200 - 60, F4Menu:GetTall() - 50 )
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
				RunConsoleCommand( "DarkRP", "buyshipment", ent.name )
			elseif ent.noship then
				RunConsoleCommand( "say", "/buy "..ent.name )
			elseif table.HasValue( GAMEMODE.AmmoTypes, ent ) then
				RunConsoleCommand( "DarkRP", "buyammo", ent.ammoType )
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
	
	ebg:SetVisible( false )

end