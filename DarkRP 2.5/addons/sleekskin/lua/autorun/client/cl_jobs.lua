function OpenJobs()
	jbg = vgui.Create( "DFrame", SLEEK_MAIN )
	jbg:SetSize( F4Menu:GetWide() - 200 - 60, F4Menu:GetTall() - 50 )
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
		--icon:SetCamPos(Vector(0, 0, 0))
		--ent:SetEyeTarget(Vector(20, 00, 65))
				   
		icon:SetAnimated(true)
		--function icon:LayoutEntity() end
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
				local CH_BG = vgui.Create( "DFrame" )
				CH_BG:SetSize( ScrW(), ScrH() )
				CH_BG:SetPos( 0, 0 )
				CH_BG:MakePopup()
				CH_BG.Paint = function()
				
				end
			
				local CH_MAIN = vgui.Create( "DFrame", CH_BG )
				CH_MAIN:SetSize( 400, 500 )
				CH_MAIN:Center()
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
					CH_BG:Close()
					--F4Menu:Close()
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
					if v.vote then
                            if ((v.admin == 0 and LocalPlayer():IsAdmin()) or (v.admin == 1 and LocalPlayer():IsSuperAdmin())) then
                                    local menu = DermaMenu( CH_BG )
                                    menu:AddOption("Vote", function() RunCmd("/vote"..v.command) CH_BG:Close()
										F4Menu:Remove()
									end)
                                    menu:AddOption("Do not vote", function() RunCmd("/"..v.command)
										CH_BG:Close()
										F4Menu:Remove() 
									end)
                                    menu:Open()
                            else
                                    RunCmd("/vote" .. v.command)
                                    F4Menu:Remove()
                            end
                    else
						RunCmd("/" .. v.command)
						CH_BG:Close()
						F4Menu:Remove()
                    end
					RunConsoleCommand("rp_playermodel", curModel)
					RunConsoleCommand("_rp_ChosenModel", curModel)
				end
				CH_OKAY.OnCursorEntered = function( self )
					self.hover = true
				end
				CH_OKAY.OnCursorExited = function( self )
					self.hover = false
				end
			else
				if v.vote then
					if ((v.admin == 0 and LocalPlayer():IsAdmin()) or (v.admin == 1 and LocalPlayer():IsSuperAdmin())) then
							local menu = DermaMenu( CH_MAIN )
							menu:AddOption("Vote", function() RunCmd("/vote"..v.command) F4Menu:Remove() end)
							menu:AddOption("Do not vote", function() RunCmd("/"..v.command) F4Menu:Remove() end)
							menu:Open()
					else
							RunCmd("/vote" .. v.command)
							F4Menu:Remove()
					end
				else
					RunCmd("/" .. v.command)
					F4Menu:Remove()
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
			afj:SetText(DarkRP.getPhrase("create_vote_for_job"))
		end

		main:AddItem( jobc )
	end

	for key, v in pairs( RPExtraTeams ) do
		
		local show = true
		if LocalPlayer():Team() == k then
			show = false
		elseif v.admin == 1 and not LocalPlayer():IsAdmin() then
			show = false
		end
		if v.admin > 1 and not LocalPlayer():IsSuperAdmin() then
			show = false
		end
		if v.customCheck and not v.customCheck(LocalPlayer()) then
			show = false
		end
		if (type(v.NeedToChangeFrom) == "number" and pt ~= v.NeedToChangeFrom) or (type(v.NeedToChangeFrom) == "table" and not table.HasValue(v.NeedToChangeFrom, pt)) then
			show = false
		end
		
		if not SSK.ShowVIPJobsToAll then
			if show then
				AddJobPanel( v )
			end
		else
			AddJobPanel( v )
		end
	end
	
	jbg:SetVisible( false )

end