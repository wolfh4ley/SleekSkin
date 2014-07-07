local QuestionVGUI = {}
local PanelNum = 0
local VoteVGUI = {}

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
	panel:SetPos(30 + PanelNum, chatY - 145)
	panel:SetTitle("")
	panel:SetSize(150, 150)
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
		if timeleft - (CurTime() - OldTime) <= 0 then
			panel:Close()
		end
	end
	panel.Paint = function( self, w, h )

		draw.RoundedBox( 0, 0, 0, w, h, Color( 224, 224, 224, 255 ) )
		draw.RoundedBox( 0, 1, 1, w - 2, h - 2, Color( 250, 250, 250, 255 ) )

		draw.RoundedBox( 0, 0, 0, w, 36, Color( 62, 67, 77 ) )

		draw.SimpleText( "Job Vote", "VoteFont", 6, 7, Color( 255, 255, 255, 255 ) )

		surface.SetDrawColor( Color( 84, 89, 100, 255 ) )
		surface.DrawLine( 1, 1, w - 1, 1 )
		surface.DrawLine( 1, 1, 1, 20 )
		surface.DrawLine( 1, 34, w - 1, 34 )
		surface.DrawLine( w - 1, 1, w - 1, 34 )

		local time = "Time: ".. tostring(math.Clamp(math.ceil(timeleft - (CurTime() - OldTime)), 0, 9999))
		draw.SimpleText( time, "VoteFont", w - 6, 7, Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT )
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
	label:SetPos(5, 42)
	label:SetFont( "QuestionFont" )
	label:SetText(question)
	label:SetTextColor( Color( 0, 0, 0, 255 ) )
	label:SizeToContents()
	label:SetVisible(true)

	local nextHeight = label:GetTall() > 78 and label:GetTall() - 78 or 0 // make panel taller for divider and buttons
	panel:SetTall(panel:GetTall() + nextHeight)

	local ybutton = vgui.Create("Button")
	ybutton:SetParent(panel)
	ybutton:SetPos(panel:GetWide() / 2 - 40 - 5, panel:GetTall() - 25)
	ybutton:SetSize(40, 20)
	ybutton:SetCommand("!")
	ybutton:SetText(DarkRP.getPhrase("yes"))
	ybutton:SetVisible(true)
	ybutton:SetFont( "YNButtonFont" )
	ybutton:SetTextColor( Color(255,255,255) )
	ybutton.DoClick = function()
		LocalPlayer():ConCommand("vote " .. voteid .. " yea\n")
		panel:Close()
	end
	ybutton.Paint = function( self, w, h )
		local gcol
		if self.hover then
			gcol = Color( 36, 190, 255 )
		else
			gcol = Color( 36, 165, 221 )
		end
		draw.RoundedBox( 0, 0, 0, w, h, Color( 16, 96, 130 ) )
		draw.RoundedBox( 0, 1, 1, w - 2, h - 2, gcol )
	end
	ybutton.OnCursorEntered = function( self )
		self.hover = true
	end
	ybutton.OnCursorExited = function( self )
		self.hover = false
	end

	local nbutton = vgui.Create("Button")
	nbutton:SetParent(panel)
	nbutton:SetPos(panel:GetWide() / 2 + 5, panel:GetTall() - 25)
	nbutton:SetSize(40, 20)
	nbutton:SetCommand("!")
	nbutton:SetText(DarkRP.getPhrase("no"))
	nbutton:SetVisible(true)
	nbutton:SetFont( "YNButtonFont" )
	nbutton:SetTextColor( Color(255,255,255) )
	nbutton.DoClick = function()
		LocalPlayer():ConCommand("vote " .. voteid .. " nay\n")
		panel:Close()
	end
	nbutton.Paint = function( self, w, h )
		local gcol
		if self.hover then
			gcol = Color( 36, 190, 255 )
		else
			gcol = Color( 36, 165, 221 )
		end
		draw.RoundedBox( 0, 0, 0, w, h, Color( 16, 96, 130 ) )
		draw.RoundedBox( 0, 1, 1, w - 2, h - 2, gcol )
	end
	nbutton.OnCursorEntered = function( self )
		self.hover = true
	end
	nbutton.OnCursorExited = function( self )
		self.hover = false
	end

	PanelNum = PanelNum + 140
	VoteVGUI[voteid .. "vote"] = panel
	panel:SetSkin(GAMEMODE.Config.DarkRPSkin)
end

timer.Simple( 0.7, function()
	usermessage.Hook("DoVote", MsgDoVote)
end ) 