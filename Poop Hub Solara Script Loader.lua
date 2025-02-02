local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Poop HUB | Solara Support | Made By Yuzupi",
   LoadingTitle = "Poop HUB",
   LoadingSubtitle = "by Yuzupi",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "PoopHUB KetSystem",
      Subtitle = "Key = PoopHUB on Not Best",
      Note = "key system",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"PoopHUB on Not Best"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local PlayerTab = Window:CreateTab("Player", 18372809038) -- Title, Image

local Section = PlayerTab:CreateSection("Movement")

local Slider = PlayerTab:CreateSlider({
   Name = "Walkspeed",
   Range = {16, 1000},
   Increment = 10,
   Suffix = "Walkspeed",
   CurrentValue = 10,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   -- The variable (Value) is a number which correlates to the value the slider is currently at
   end,
})

local Slider = PlayerTab:CreateSlider({
   Name = "Jump power",
   Range = {0, 1000},
   Increment = 10,
   Suffix = "Bananas",
   CurrentValue = 10,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   -- The variable (Value) is a number which correlates to the value the slider is currently at
   end,
})

local Section = PlayerTab:CreateSection("Inf Jump")

local Button = PlayerTab:CreateButton({
   Name = "Inf Jump",
   Callback = function()
        -- スクリプトをプレーヤーのキャラクターに入れます

-- ジャンプボタンが押された時の処理
game:GetService("UserInputService").JumpRequest:Connect(function()
    -- 無限ジャンプのためにCharacterのHumanoidのJump属性をtrueに設定します
    game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end)

   end,
})

local TPTab = Window:CreateTab("TP", 18372809038) -- Title, Image

local Section = TPTab:CreateSection("click tp")

local Button = TPTab:CreateButton({
   Name = "click TP",
   Callback = function()
        -- スクリプトをプレーヤーのキャラクターに入れます

-- マウスがクリックされた時の処理
game:GetService("UserInputService").InputBegan:Connect(function(input)
    -- Ctrlキーが押されたかをチェック
    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.LeftControl then
        -- マウスの位置を取得
        local mouse = game.Players.LocalPlayer:GetMouse()
        local targetPosition = mouse.Hit.p
        
        -- プレーヤーをクリックした場所にテレポートさせる
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(targetPosition))
    end
end)

   end,
})

local Section = TPTab:CreateSection("Player TP")

local Button = TPTab:CreateButton({
   Name = "Player TP GUI",
   Callback = function()
        -- プレイヤーのキャラクター内にスクリプトを入れる

-- GUIを作成
local gui = Instance.new("ScreenGui")
gui.Name = "Poop HUB | TP PLAYER"
gui.ResetOnSpawn = false -- スポーン後もGUIが消えないようにする
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- スクロール可能なフレームを作成
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(0, 200, 0, 300)
scrollFrame.Position = UDim2.new(0.02, 0, 0.2, 0)
scrollFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- 色はお好みで調整してください
scrollFrame.BorderSizePixel = 2
scrollFrame.ScrollBarThickness = 16 -- スクロールバーの太さ
scrollFrame.Parent = gui

-- タイトルを表示するラベルを追加
local title = Instance.new("TextLabel")
title.Text = "Poop HUB | TP PLAYER"
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(70, 70, 70) -- 色はお好みで調整してください
title.BorderSizePixel = 0
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.Parent = scrollFrame

-- プレイヤー情報を取得
local players = game.Players:GetPlayers()

-- プレイヤー名を表示するリストを作成
local yOffset = 30
for i, player in ipairs(players) do
    local button = Instance.new("TextButton")
    button.Text = player.Name
    button.Size = UDim2.new(1, -10, 0, 30)
    button.Position = UDim2.new(0, 5, 0, yOffset)
    button.BackgroundColor3 = Color3.fromRGB(70, 70, 70) -- 色はお好みで調整してください
    button.BorderSizePixel = 0
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Parent = scrollFrame
    
    -- プレイヤー名をクリックした時の処理
    button.MouseButton1Click:Connect(function()
        -- クリックしたプレイヤーの位置にテレポートする
        local targetPlayer = game.Players:FindFirstChild(player.Name)
        if targetPlayer then
            local targetPosition = targetPlayer.Character and targetPlayer.Character.HumanoidRootPart.Position
            if targetPosition then
                game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(targetPosition))
            else
                warn("Target player's position not found.")
            end
        else
            warn("Target player not found.")
        end
    end)
    
    yOffset = yOffset + 35 -- ボタン間のスペース
end

-- スクロールフレームのCanvasSizeを調整する
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, yOffset - 5) -- ボタン間のスペースの分、少し余裕を持たせる

-- GUIのドラッグ移動を実装
local dragging
local dragStart
local startPos

scrollFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = scrollFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

scrollFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        if dragging then
            local delta = input.Position - dragStart
            scrollFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end
end)

   end,
})

local AdminTab = Window:CreateTab("Universal", 18372809038) -- Title, Image

local Section = AdminTab:CreateSection("Admin")

local Button = AdminTab:CreateButton({
   Name = "Nameless Admin",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FD2Team/Nameless-Admin-No-Byfron-Kick/main/Source",true))() 
   end,
})

local Button = AdminTab:CreateButton({
   Name = "infinite yield",
   Callback = function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/yRHbQADj'),true))() 
   end,
})

local Button = AdminTab:CreateButton({
   Name = "System Brooken",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))() 
   end,
})

local Section = AdminTab:CreateSection("Script HUB")

local Button = AdminTab:CreateButton({
   Name = "Bido Skins V1.9",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BidoSkinsYT/BidoSkinsYT/main/Bido%20Skins%20V1.9"))()
   end,
})

local Button = AdminTab:CreateButton({
   Name = "Sky HUB",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/SkyHub.txt"))()
   end,
})

local Button = AdminTab:CreateButton({
   Name = "Ghost HUB",
   Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))()
   end,
})

local Section = AdminTab:CreateSection("Script")

local Button = AdminTab:CreateButton({
   Name = "Freeze",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/creepstu/fuzzy-octo-giggle/main/Source"))()
   end,
})

local Button = AdminTab:CreateButton({
   Name = "Vfly",
   Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/MHE1cbWF"))()
   end,
})

local Button = AdminTab:CreateButton({
   Name = "Fly GUI v3",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
   end,
})

local Section = AdminTab:CreateSection("Aim Bot")

local Button = AdminTab:CreateButton({
   Name = "DeleteMob",
   Callback = function()
        -- Yes, I know This Is Shit.
local PLAYER = game.Players.LocalPlayer
local CurrentCam  = game.Workspace.CurrentCamera
local UIS = game:GetService("UserInputService")-- Made By Mick Gordon
local WorldToViewportPoint = CurrentCam.WorldToViewportPoint
local mouseLocation = UIS.GetMouseLocation

game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Made By Mick Gordon", Text = "Enjoy !"})

local DeleteMob ={
    GUi = {
        OpenNCloseButton = true; -- Have A Button For It
        KeybindEnable = false; -- If You Want A Bind For The Menu
        Keybind = "z"; -- Menu Key Bind
    };
	Aimbot= {
        Keybind = "MouseButton2"; -- Change Aim Bot Key Bind Here !!! No Capitals, Unless it is MouseButton1 or MouseButton2
------------------------------------------------------------------------------------------
		Enabled = false; -- No Need To Change Anything Here As It Is On The GUI
		TeamCheck = false;
		WallCheck = false;
		ShowFov = false;
		Fov = 0;
		Smoothing = 0;
		AimPart = "Head";
		Thickness = 1;
		FovFillColor = Color3.fromRGB(100,0,100);
		FovColor = Color3.fromRGB(100,0,100);
		FovFillTransparency = 1;
		FovTransparenct = 0;
        IsAimKeyDown = false;
	};
	ESP ={
		Box = {
			Box = false;
			Name = false;
			Distance = false;
			Health = false;

			TeamCheck = false;

			HealthType = "Bar";

			BoxColor = Color3.fromRGB(75,0,10);
		};
		OutLines = {
			Enabled = false;
			TeamCheck = false;
			TeamColor = false;

			AllwaysShow = true;

			FillCollor = Color3.fromRGB(75,0,10);
			FillTrancparenct = 0;

			OutlineColor = Color3.fromRGB(0,0,0);
			OutlineTrancparency = 0;
		};
		Tracers = {
			Enabled = false;
			TeamCheck = false;
			TeamColor = false;

			Color = Color3.fromRGB(75,0,10);
		}
	}-- Made By Mick Gordon
}

-- Made By Mick Gordon
local Fov = Instance.new("ScreenGui")Fov.Name = "Fov" Fov.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui") Fov.ZIndexBehavior = Enum.ZIndexBehavior.Sibling Fov.ResetOnSpawn = false-- i miss you synapse fov
local TracersG = Instance.new("ScreenGui")TracersG.Name = "Tracers" TracersG.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui") TracersG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling TracersG.ResetOnSpawn = false
local FOVFFrame = Instance.new("Frame")FOVFFrame.Parent = Fov FOVFFrame.Name = "FOVFFrame" FOVFFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) FOVFFrame.BorderColor3 = Color3.fromRGB(0, 0, 0) FOVFFrame.BorderSizePixel = 0 FOVFFrame.BackgroundTransparency = 1 FOVFFrame.AnchorPoint = Vector2.new(0.5, 0.5) FOVFFrame.Position = UDim2.new(0.5, 0,0.5, 0) FOVFFrame.Size = UDim2.new(0, DeleteMob.Aimbot.Fov, 0, DeleteMob.Aimbot.Fov) FOVFFrame.BackgroundTransparency = 1 
local UICorner = Instance.new("UICorner")UICorner.CornerRadius = UDim.new(1, 0) UICorner.Parent = FOVFFrame -- Made By Mick Gordon
local UIStroke = Instance.new("UIStroke")UIStroke.Color = Color3.fromRGB(100,0,100) UIStroke.Parent = FOVFFrame UIStroke.Thickness = 1 UIStroke.ApplyStrokeMode = "Border" game:GetService("StarterGui"):SetCore("SendNotification", {Title = "https://discord.gg/FsApQ7YNTq", Text = "The Discord For More!"})
local BoxC = Instance.new("ScreenGui", game.Workspace) BoxC.Name = "Box"
local Higlight = Instance.new("ScreenGui",game.Workspace)
local connections = {}
-- Made By Mick Gordon
local function AddHighlight(plr)
	local Highlight = Instance.new("Highlight")
	Highlight.Parent = Higlight
	Highlight.Name = plr.Name
	Highlight.Enabled = DeleteMob.ESP.OutLines.Enabled
	local plrchar = plr.Character
	if plrchar then
		Highlight.Adornee = plrchar
	end
	connections[plr] = plr.CharacterAdded:Connect(function(char)
		Highlight.Adornee = char
	end)
	local co = coroutine.create(function()
		while wait(.1) do
			if plr ~= PLAYER and plr and plr.Character and plr.Character.FindFirstChild(plr.Character, "Humanoid") and plr.Character.Humanoid.Health > 0 then

				if DeleteMob.ESP.OutLines.Enabled == true then
					if DeleteMob.ESP.OutLines.TeamCheck == true and plr.TeamColor == PLAYER.TeamColor then
						Highlight.Enabled = false
					else
						Highlight.Enabled = true
					end
				else-- Made By Mick Gordon
					Highlight.Enabled = false
				end

				if DeleteMob.ESP.OutLines.TeamColor == true then
					Highlight.FillColor = plr.TeamColor.Color 
				else
					Highlight.FillColor = DeleteMob.ESP.OutLines.FillCollor
				end

				if DeleteMob.ESP.OutLines.AllwaysShow == true then
					Highlight.DepthMode = "AlwaysOnTop" 
				else
					Highlight.DepthMode = "Occluded" 
				end-- Made By Mick Gordon

				Highlight.OutlineTransparency = DeleteMob.ESP.OutLines.OutlineTrancparency
				Highlight.OutlineColor = DeleteMob.ESP.OutLines.OutlineColor
				Highlight.FillTransparency = DeleteMob.ESP.OutLines.FillTrancparenct

				if not (game:GetService"Players":FindFirstChild(plr.Name)) then
					Higlight:FindFirstChild(plr.Name):Destroy()
					coroutine.yield()
				end
			else
				Highlight.Enabled = false
			end
		end
	end)
	coroutine.resume(co)
end
-- Made By Mick Gordon
local function AddBox(player) -- Saves FPS 
	local bbg = Instance.new("BillboardGui", BoxC)
	bbg.Name = player.Name
	bbg.AlwaysOnTop = true
	bbg.Size = UDim2.new(4,0,5.4,0)
	bbg.ClipsDescendants = false
	bbg.Enabled = false

	local outlines = Instance.new("Frame", bbg)
	outlines.Size = UDim2.new(1,0,1,0)
	outlines.BorderSizePixel = 1
	outlines.BackgroundTransparency = 1
	local left = Instance.new("Frame", outlines)
	left.BorderSizePixel = 1
	left.Size = UDim2.new(0,(1),1,0)
	local right = left:Clone()
	right.Parent = outlines
	right.Size = UDim2.new(0,-(1),1,0)   
	right.Position = UDim2.new(1,0,0,0)
	local up = left:Clone()-- Made By Mick Gordon
	up.Parent = outlines
	up.Size = UDim2.new(1,0,0,(1))
	local down = left:Clone()
	down.Parent = outlines
	down.Size = UDim2.new(1,0,0,-(1))
	down.Position = UDim2.new(0,0,1,0)

	local info = Instance.new("BillboardGui", bbg)
	info.Name = "info"
	info.Size = UDim2.new(3,0,0,54)
	info.StudsOffset = Vector3.new(3.6,-3,0)
	info.AlwaysOnTop = true
	info.ClipsDescendants = false
	info.Enabled = false
	local namelabel = Instance.new("TextLabel", info)
	namelabel.Name = "namelabel"
	namelabel.BackgroundTransparency = 1
	namelabel.TextStrokeTransparency = 0
	namelabel.TextXAlignment = Enum.TextXAlignment.Left
	namelabel.Size = UDim2.new(0,100,0,18)
	namelabel.Position = UDim2.new(0,0,0,0)
	namelabel.Text = player.Name
	local distancel = Instance.new("TextLabel", info)
	distancel.Name = "distancelabel"
	distancel.BackgroundTransparency = 1-- Made By Mick Gordon
	distancel.TextStrokeTransparency = 0
	distancel.TextXAlignment = Enum.TextXAlignment.Left
	distancel.Size = UDim2.new(0,100,0,18)
	distancel.Position = UDim2.new(0,0,0,18)
	local healthl = Instance.new("TextLabel", info)
	healthl.Name = "healthlabel"
	healthl.BackgroundTransparency = 1
	healthl.TextStrokeTransparency = 0
	healthl.TextXAlignment = Enum.TextXAlignment.Left
	healthl.Size = UDim2.new(0,100,0,18)
	healthl.Position = UDim2.new(0,0,0,36)

	local uill = Instance.new("UIListLayout", info)

	local forhealth = Instance.new("BillboardGui", bbg)
	forhealth.Name = "forhealth"
	forhealth.Size = UDim2.new(4.5,0,6,0)
	forhealth.AlwaysOnTop = true
	forhealth.ClipsDescendants = false
	forhealth.Enabled = false

	local healthbar = Instance.new("Frame", forhealth)
	healthbar.Name = "healthbar"
	healthbar.BackgroundColor3 = Color3.fromRGB(40,40,40)
	healthbar.BorderColor3 = Color3.fromRGB(0,0,0)
	healthbar.Size = UDim2.new(0.04,0,0.9,0)
	healthbar.Position = UDim2.new(0,0,0.05,0)
	local bar = Instance.new("Frame", healthbar)
	bar.Name = "bar"
	bar.BorderSizePixel = 0
	bar.BackgroundColor3 = Color3.fromRGB(94,255,69)
	bar.AnchorPoint = Vector2.new(0,1)
	bar.Position = UDim2.new(0,0,1,0)
	bar.Size = UDim2.new(1,0,1,0)

	-- Made By Mick Gordon
	local co = coroutine.create(function()
		while wait(0.1) do
			if player ~= PLAYER and player and player.Character and player.Character.FindFirstChild(player.Character, "Humanoid") and player.Character.Humanoid.Health > 0 then
				bbg.Adornee = player.Character.HumanoidRootPart
				info.Adornee = player.Character.HumanoidRootPart
				forhealth.Adornee = player.Character.HumanoidRootPart

				if DeleteMob.ESP.Box.Box == true then
					outlines.Visible = true
				else
					outlines.Visible = false
				end

				outlines.BackgroundTransparency = 1

				if DeleteMob.ESP.Box.Health == true then
					if player.Character:FindFirstChild("Humanoid") ~= nil then
						healthl.Text = "Health: "..math.floor(player.Character:FindFirstChild"Humanoid".Health)
						healthbar.bar.Size = UDim2.new(1,0,player.Character:FindFirstChild"Humanoid".Health/player.Character:FindFirstChild"Humanoid".MaxHealth,0)
					end
					if DeleteMob.ESP.Box.HealthType == "Text" then
						healthbar.Visible = false
						healthl.Visible = true
					end-- Made By Mick Gordon
					if DeleteMob.ESP.Box.HealthType == "Bar" then
						healthl.Visible = false
						healthbar.Visible = true
					end
					if DeleteMob.ESP.Box.HealthType == "Both" then
						healthl.Visible = true
						healthbar.Visible = true
					end
				else
					healthl.Visible = false
					healthbar.Visible = false
				end


				if DeleteMob.ESP.Box.Name then
					namelabel.Visible = true
				else
					namelabel.Visible = false
				end

				-- Made By Mick Gordon
				if DeleteMob.ESP.Box.Distance == true then
					distancel.Visible = true
					if PLAYER.Character and PLAYER.Character:FindFirstChild("HumanoidRootPart") ~= nil then
						distancel.Text = "Distance: "..math.floor(0.5+(PLAYER.Character:FindFirstChild"HumanoidRootPart".Position - player.Character:FindFirstChild"HumanoidRootPart".Position).magnitude)
					end
				else
					distancel.Visible = false
				end


				if DeleteMob.ESP.Box.TeamCheck == true and player.TeamColor == PLAYER.TeamColor then
					bbg.Enabled = false
					info.Enabled = false
					forhealth.Enabled = false
				else
					bbg.Enabled = true
					info.Enabled = true
					forhealth.Enabled = true
				end
				-- Made By Mick Gordon

				if DeleteMob.ESP.Box.TeamColor == true then
					left.BackgroundColor3 = player.TeamColor.Color
					right.BackgroundColor3 = player.TeamColor.Color
					up.BackgroundColor3 = player.TeamColor.Color
					down.BackgroundColor3 = player.TeamColor.Color
					outlines.BackgroundColor3 = DeleteMob.ESP.Box.BoxColor
				else
					outlines.BackgroundColor3 = DeleteMob.ESP.Box.BoxColor
					left.BackgroundColor3 = DeleteMob.ESP.Box.BoxColor
					right.BackgroundColor3 = DeleteMob.ESP.Box.BoxColor
					up.BackgroundColor3 = DeleteMob.ESP.Box.BoxColor
					down.BackgroundColor3 = DeleteMob.ESP.Box.BoxColor
					healthl.TextColor3 = DeleteMob.ESP.Box.BoxColor
					distancel.TextColor3 = DeleteMob.ESP.Box.BoxColor
					namelabel.TextColor3 = DeleteMob.ESP.Box.BoxColor
				end

				if not (game:GetService"Players":FindFirstChild(player.Name)) then
					BoxC:FindFirstChild(player.Name):Destroy()
					coroutine.yield()
				end-- Made By Mick Gordon
			else
				bbg.Enabled = false
				bbg.Adornee = nil
				info.Adornee = nil
				info.Enabled = false
				forhealth.Adornee = nil
				forhealth.Enabled = false
			end
		end 
	end)
	coroutine.resume(co)
end


local function AddTracers(Player) -- Tracers Without Lib OMG !!!!
	local tracer = Instance.new("Frame") -- Idk What I Was Smoking When Making This Scrip Hub, It Is Shit And I Will Remake Later 
	tracer.Parent = TracersG
	tracer.Name = Player.Name
	tracer.Active = false
	tracer.AnchorPoint = Vector2.new(.5, .5)
	tracer.Visible = false

	local co = coroutine.create(function()
		game:GetService("RunService").RenderStepped:Connect(function()
			if Player ~= PLAYER and Player and Player.Character and Player.Character.FindFirstChild(Player.Character, "Humanoid") and Player.Character.Humanoid.Health > 0 then
				local TargetPart = Player.Character:FindFirstChild("HumanoidRootPart")
				local ScreenPoint, OnScreen = CurrentCam:WorldToScreenPoint(TargetPart.Position)
				local distance 
				-- Made By Mick Gordon
				distance = math.floor(0.5+(game.Workspace.CurrentCamera.CFrame.Position - Player.Character:WaitForChild("HumanoidRootPart").Position).magnitude)

				local screenpointmain = Vector2.new(ScreenPoint.X, ScreenPoint.Y + (2500 / distance)) --  / distance so it can be at the bottom of the box.
				local posd = UIS:GetMouseLocation()
				local MouseOrigin = Vector2.new(posd.X, posd.Y - 36)
				local Origin = Vector2.new(CurrentCam.ViewportSize.X/2, CurrentCam.ViewportSize.Y - 1)
				local Position = (Origin + screenpointmain) / 2
				local Length = (Origin - screenpointmain).Magnitude
				tracer.Rotation = math.deg(math.atan2(screenpointmain.Y - Origin.Y, screenpointmain.X - Origin.X))


				Position = (Origin + screenpointmain) / 2
				Length = (Origin - screenpointmain).Magnitude
				tracer.Rotation = math.deg(math.atan2(screenpointmain.Y - Origin.Y, screenpointmain.X - Origin.X))


				if OnScreen then
					if DeleteMob.ESP.Tracers.Enabled == true and OnScreen then
						if DeleteMob.ESP.Tracers.TeamCheck == true then
							if Player.TeamColor == PLAYER.TeamColor then
								tracer.Visible = false
							else
								tracer.Visible = true
							end
						else -- Made By Mick Gordon
							tracer.Visible = true
						end
					else
						tracer.Visible = false
					end-- Made By Mick Gordon

					if DeleteMob.ESP.Tracers.TeamColor == true then
						tracer.BackgroundColor3 = Player.TeamColor.Color
					else
						tracer.BackgroundColor3 = DeleteMob.ESP.Tracers.Color
					end

					tracer.BorderColor3 = Color3.fromRGB(27, 42, 53)
					tracer.Position = UDim2.new(0, Position.X, 0, Position.Y)
					tracer.Size = UDim2.new(0, Length, 0, 2)
				else
					tracer.Visible = false
				end

				if not (game:GetService"Players":FindFirstChild(Player.Name)) then
					Fov:FindFirstChild(Player.Name):Destroy()
					coroutine.yield()
				end
			else
				tracer.Visible = false
			end
		end)
	end)
	coroutine.resume(co)-- Made By Mick Gordon
end

function isVisible(p, ...)
	
	if not (DeleteMob.Aimbot.WallCheck == true) then
		return true
	end
	
	return #CurrentCam:GetPartsObscuringTarget({ p }, { CurrentCam, PLAYER.Character, ... }) == 0 
end-- Made By Mick Gordon

function CameraGetClosestToMouse(Fov)
	local AimFov = Fov
	local targetPos = nil

	for i,v in pairs (game:GetService("Players"):GetPlayers()) do
		if v ~= PLAYER then
			if DeleteMob.Aimbot.TeamCheck == true then
				if v.Character and v.Character:FindFirstChild(DeleteMob.Aimbot.AimPart) and v.Character.Humanoid and v.Character.Humanoid.Health > 0 and not (v.Team == PLAYER.Team) then
					local screen_pos, on_screen = WorldToViewportPoint(CurrentCam, v.Character[DeleteMob.Aimbot.AimPart].Position)
					local screen_pos_2D = Vector2.new(screen_pos.X, screen_pos.Y)
					local new_magnitude = (screen_pos_2D - mouseLocation(UIS)).Magnitude
					if on_screen and new_magnitude < AimFov and isVisible(v.Character[DeleteMob.Aimbot.AimPart].Position, v.Character.Head.Parent) then
						AimFov = new_magnitude
						targetPos = v-- Made By Mick Gordon
					end
				end-- Made By Mick Gordon
			else
				if v.Character and v.Character:FindFirstChild(DeleteMob.Aimbot.AimPart) and v.Character.Humanoid and v.Character.Humanoid.Health > 0 then
					local screen_pos, on_screen = WorldToViewportPoint(CurrentCam, v.Character[DeleteMob.Aimbot.AimPart].Position)
					local screen_pos_2D = Vector2.new(screen_pos.X, screen_pos.Y)
					local new_magnitude = (screen_pos_2D - mouseLocation(UIS)).Magnitude
					if on_screen and new_magnitude < AimFov and isVisible(v.Character[DeleteMob.Aimbot.AimPart].Position, v.Character.Head.Parent) then
						AimFov = new_magnitude
						targetPos = v
					end
				end
			end
		end
	end
	return targetPos
end


local function aimAt(pos, smooth)
	local AimPart = pos.Character:FindFirstChild(DeleteMob.Aimbot.AimPart)
	if AimPart then
		local LookAt = nil
		local Distance = math.floor(0.5+(PLAYER.Character:FindFirstChild"HumanoidRootPart".Position - pos.Character:FindFirstChild"HumanoidRootPart".Position).magnitude)
		if Distance > 100  then
			local distChangeBig = Distance / 10
			LookAt = CurrentCam.CFrame:PointToWorldSpace(Vector3.new(0,0,-smooth * distChangeBig)):Lerp(AimPart.Position,.01) -- No one esle do camera smoothing ? tf
		else-- Made By Mick Gordon
			local distChangeSmall = Distance / 10
			LookAt = CurrentCam.CFrame:PointToWorldSpace(Vector3.new(0,0,-smooth * distChangeSmall)):Lerp(AimPart.Position,.01) -- No one esle do camera smoothing ? tf
		end
		CurrentCam.CFrame = CFrame.lookAt(CurrentCam.CFrame.Position, LookAt)
	end
end

-- Cant Be Botherd To Clean This Up
local CheatEngineDeleteMob = Instance.new("ScreenGui")
local DeleteMobF = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local Name = Instance.new("TextLabel")
local Line = Instance.new("Frame")
local Line_2 = Instance.new("Frame")
local AimBotSection = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local ABE = Instance.new("TextButton")
local ABWC = Instance.new("TextButton")
local ABTC = Instance.new("TextButton")
local ABSF = Instance.new("TextButton")
local Frame = Instance.new("Frame")
local Slider3 = Instance.new("Frame")-- Made By Mick Gordon
local UICorner = Instance.new("UICorner")
local Fill1 = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local TriggerFov = Instance.new("TextButton")
local Numbers = Instance.new("TextLabel")
local TextLabel = Instance.new("TextLabel")
local Frame_2 = Instance.new("Frame")
local Slider4 = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local Fill2 = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")
local UIGradient_2 = Instance.new("UIGradient")
local TriggerSmoothing = Instance.new("TextButton")-- Made By Mick Gordon
local Numbers_2 = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local TextLabel_3 = Instance.new("TextLabel")
local Allways_Show = Instance.new("TextButton")
local TextLabel_4 = Instance.new("TextLabel")
local ESPSection = Instance.new("Frame")
local UIListLayout_2 = Instance.new("UIListLayout")
local BBE = Instance.new("TextButton")
local BTC = Instance.new("TextButton")
local BBN = Instance.new("TextButton")
local BBD = Instance.new("TextButton")
local BBH = Instance.new("TextButton")
local TextLabel_5 = Instance.new("TextLabel")
local BBHT = Instance.new("TextButton")
local TextLabel_6 = Instance.new("TextLabel")
local TextLabel_7 = Instance.new("TextLabel")
local Frame_3 = Instance.new("Frame")
local UIListLayout_3 = Instance.new("UIListLayout")
local Box_R = Instance.new("TextBox")
local Box_G = Instance.new("TextBox")
local Box_B = Instance.new("TextBox")
local TextLabel_8 = Instance.new("TextLabel")
local ESPSection_2 = Instance.new("Frame")
local UIListLayout_4 = Instance.new("UIListLayout")
local OE = Instance.new("TextButton")
local OTC = Instance.new("TextButton")-- Made By Mick Gordon
local Frame_4 = Instance.new("Frame")
local Slider1 = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local Fill3 = Instance.new("Frame")
local UICorner_6 = Instance.new("UICorner")
local UIGradient_3 = Instance.new("UIGradient")
local TriggerOutTans = Instance.new("TextButton")
local Numbers_3 = Instance.new("TextLabel")
local TextLabel_9 = Instance.new("TextLabel")
local Frame_5 = Instance.new("Frame")
local Slider2 = Instance.new("Frame")
local UICorner_7 = Instance.new("UICorner")
local Fill4 = Instance.new("Frame")
local UICorner_8 = Instance.new("UICorner")
local UIGradient_4 = Instance.new("UIGradient")
local TriggerFill = Instance.new("TextButton")
local Numbers_4 = Instance.new("TextLabel")
local TextLabel_10 = Instance.new("TextLabel")
local TextLabel_11 = Instance.new("TextLabel")
local Frame_6 = Instance.new("Frame")
local UIListLayout_5 = Instance.new("UIListLayout")
local Outlines_R = Instance.new("TextBox")
local Outlines_G = Instance.new("TextBox")
local Outlines_B = Instance.new("TextBox")
local TextLabel_12 = Instance.new("TextLabel")
local Frame_7 = Instance.new("Frame")
local UIListLayout_6 = Instance.new("UIListLayout")
local FillOutlines_R = Instance.new("TextBox")
local FillOutlines_G = Instance.new("TextBox")
local FillOutlines_B = Instance.new("TextBox")
local Tracerssection = Instance.new("Frame")
local UIListLayout_7 = Instance.new("UIListLayout")
local TE = Instance.new("TextButton")
local TTC = Instance.new("TextButton")
local TTCOlor = Instance.new("TextButton")
local Frame_8 = Instance.new("Frame")
local UIListLayout_8 = Instance.new("UIListLayout")
local Tracers_R = Instance.new("TextBox")
local Tracers_G = Instance.new("TextBox")
local Tracers_B = Instance.new("TextBox")-- Made By Mick Gordon
local Unknown = Instance.new("Frame")
local UIListLayout_9 = Instance.new("UIListLayout")
local TextLabel_13 = Instance.new("TextLabel")
local TextLabel_14 = Instance.new("TextLabel")
local Open = Instance.new("Frame")
local TextButton = Instance.new("TextButton")

--Properties:

CheatEngineDeleteMob.Name = "CheatEngineDeleteMob"
CheatEngineDeleteMob.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
CheatEngineDeleteMob.Enabled = true
CheatEngineDeleteMob.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
CheatEngineDeleteMob.DisplayOrder = 10
CheatEngineDeleteMob.ResetOnSpawn = false
-- Made By Mick Gordon
DeleteMobF.Name = "DeleteMobF"
DeleteMobF.Parent = CheatEngineDeleteMob
DeleteMobF.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
DeleteMobF.BorderColor3 = Color3.fromRGB(255, 255, 255)
DeleteMobF.Position = UDim2.new(0.144998878, 0, 0.328040659, 0)
DeleteMobF.Size = UDim2.new(0, 1213, 0, 398)
DeleteMobF.ZIndex = 10
DeleteMobF.Draggable = true
DeleteMobF.Active = true

TextBox.Parent = DeleteMobF
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundTransparency = 1.000
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.791149139, 0, 0.0127403988, 0)
TextBox.Size = UDim2.new(0, 200, 0, 23)
TextBox.ClearTextOnFocus = false
TextBox.Font = Enum.Font.Roboto
TextBox.PlaceholderText = "https://discord.gg/FsApQ7YNTq"
TextBox.Text = "https://discord.gg/FsApQ7YNTq - Double Click Me"
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 14.000

Name.Name = "Name"
Name.Parent = DeleteMobF
Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name.BackgroundTransparency = 1.000
Name.BorderColor3 = Color3.fromRGB(0, 0, 0)
Name.BorderSizePixel = 0
Name.Position = UDim2.new(0.0178597774, 0, 0.00456260797, 0)
Name.Size = UDim2.new(0, 200, 0, 31)
Name.Font = Enum.Font.Gotham
Name.Text = "DeleteMob | Cheat Engine"
Name.TextColor3 = Color3.fromRGB(17, 223, 255)
Name.TextSize = 19.000

Line.Name = "Line"
Line.Parent = DeleteMobF
Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
Line.BorderSizePixel = 0
Line.Position = UDim2.new(0, 0, 0.0804020092, 0)
Line.Size = UDim2.new(0, 1213, 0, 1)

Line_2.Name = "Line"
Line_2.Parent = DeleteMobF
Line_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Line_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Line_2.BorderSizePixel = 0
Line_2.Position = UDim2.new(0.205276027, 0, 0.0828348249, 0)
Line_2.Size = UDim2.new(0, 1, 0, 365)
-- Made By Mick Gordon
AimBotSection.Name = "AimBotSection"
AimBotSection.Parent = DeleteMobF
AimBotSection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AimBotSection.BackgroundTransparency = 1.000
AimBotSection.BorderColor3 = Color3.fromRGB(0, 0, 0)
AimBotSection.BorderSizePixel = 0
AimBotSection.Position = UDim2.new(0.0604648069, 0, 0.160724282, 0)
AimBotSection.Size = UDim2.new(0, 100, 0, 334)

UIListLayout.Parent = AimBotSection
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

ABE.Name = "ABE"
ABE.Parent = AimBotSection
ABE.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
ABE.BorderColor3 = Color3.fromRGB(255, 255, 255)
ABE.Position = UDim2.new(0.234439835, 0, 0.139479905, 0)
ABE.Size = UDim2.new(0, 164, 0, 29)
ABE.Font = Enum.Font.Gotham
ABE.Text = "Enable"
ABE.TextColor3 = Color3.fromRGB(255, 255, 255)
ABE.TextSize = 16.000

ABWC.Name = "ABWC"
ABWC.Parent = AimBotSection
ABWC.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
ABWC.BorderColor3 = Color3.fromRGB(255, 255, 255)
ABWC.Position = UDim2.new(0.234439835, 0, 0.139479905, 0)
ABWC.Size = UDim2.new(0, 164, 0, 29)
ABWC.Font = Enum.Font.Gotham
ABWC.Text = "Wall Check"
ABWC.TextColor3 = Color3.fromRGB(255, 255, 255)
ABWC.TextSize = 16.000

ABTC.Name = "ABTC"
ABTC.Parent = AimBotSection
ABTC.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
ABTC.BorderColor3 = Color3.fromRGB(255, 255, 255)
ABTC.Position = UDim2.new(0.234439835, 0, 0.139479905, 0)
ABTC.Size = UDim2.new(0, 164, 0, 29)
ABTC.Font = Enum.Font.Gotham
ABTC.Text = "Team Check"
ABTC.TextColor3 = Color3.fromRGB(255, 255, 255)
ABTC.TextSize = 16.000

ABSF.Name = "ABSF"
ABSF.Parent = AimBotSection
ABSF.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
ABSF.BorderColor3 = Color3.fromRGB(255, 255, 255)
ABSF.Position = UDim2.new(0.234439835, 0, 0.139479905, 0)
ABSF.Size = UDim2.new(0, 164, 0, 29)
ABSF.Font = Enum.Font.Gotham
ABSF.Text = "Show Fov"
ABSF.TextColor3 = Color3.fromRGB(255, 255, 255)
ABSF.TextSize = 16.000

Frame.Parent = AimBotSection
Frame.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
Frame.BackgroundTransparency = 0.700
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(-0.550000012, 0, 0.739130437, 0)
Frame.Size = UDim2.new(0, 230, 0, 50)

Slider3.Name = "Slider3"
Slider3.Parent = Frame
Slider3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Slider3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Slider3.BorderSizePixel = 0
Slider3.Position = UDim2.new(0.0629399866, 0, 0.45120728, 0)
Slider3.Size = UDim2.new(0, 200, 0, 15)

UICorner.Parent = Slider3

Fill1.Name = "Fill1"
Fill1.Parent = Slider3
Fill1.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Fill1.BackgroundTransparency = 0.200
Fill1.BorderColor3 = Color3.fromRGB(0, 0, 0)
Fill1.BorderSizePixel = 0
Fill1.Size = UDim2.new(0, 100, 0, 15)

UICorner_2.Parent = Fill1

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(17, 223, 255)), ColorSequenceKeypoint.new(0.29, Color3.fromRGB(17, 223, 255)), ColorSequenceKeypoint.new(0.43, Color3.fromRGB(18, 218, 249)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(52, 52, 52))}
UIGradient.Parent = Fill1
-- Made By Mick Gordon
TriggerFov.Name = "TriggerFov"
TriggerFov.Parent = Slider3
TriggerFov.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TriggerFov.BackgroundTransparency = 1.000
TriggerFov.BorderColor3 = Color3.fromRGB(0, 0, 0)
TriggerFov.BorderSizePixel = 0
TriggerFov.Size = UDim2.new(1, 0, 1, 0)
TriggerFov.Font = Enum.Font.SourceSans
TriggerFov.Text = ""
TriggerFov.TextColor3 = Color3.fromRGB(0, 0, 0)
TriggerFov.TextSize = 14.000

Numbers.Name = "Numbers"
Numbers.Parent = Frame
Numbers.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Numbers.BackgroundTransparency = 1.000
Numbers.BorderColor3 = Color3.fromRGB(255, 255, 255)
Numbers.BorderSizePixel = 0
Numbers.Position = UDim2.new(0.79130435, 0, 0, 0)
Numbers.Size = UDim2.new(0, 50, 0, 23)
Numbers.Font = Enum.Font.Gotham
Numbers.Text = "350"
Numbers.TextColor3 = Color3.fromRGB(255, 255, 255)
Numbers.TextSize = 14.000

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.0608695634, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 50, 0, 23)
TextLabel.Font = Enum.Font.Gotham
TextLabel.Text = "Fov"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 14.000

Frame_2.Parent = AimBotSection
Frame_2.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
Frame_2.BackgroundTransparency = 0.700
Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(-0.550000012, 0, 0.739130437, 0)
Frame_2.Size = UDim2.new(0, 230, 0, 50)

Slider4.Name = "Slider4"
Slider4.Parent = Frame_2
Slider4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Slider4.BorderColor3 = Color3.fromRGB(0, 0, 0)
Slider4.BorderSizePixel = 0
Slider4.Position = UDim2.new(0.0629399866, 0, 0.45120728, 0)
Slider4.Size = UDim2.new(0, 200, 0, 15)

UICorner_3.Parent = Slider4

Fill2.Name = "Fill2"
Fill2.Parent = Slider4
Fill2.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Fill2.BackgroundTransparency = 0.200
Fill2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Fill2.BorderSizePixel = 0
Fill2.Size = UDim2.new(0, 0, 0, 15)

UICorner_4.Parent = Fill2

UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(17, 223, 255)), ColorSequenceKeypoint.new(0.29, Color3.fromRGB(17, 223, 255)), ColorSequenceKeypoint.new(0.43, Color3.fromRGB(18, 218, 249)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(52, 52, 52))}-- Made By Mick Gordon
UIGradient_2.Parent = Fill2

TriggerSmoothing.Name = "TriggerSmoothing"
TriggerSmoothing.Parent = Slider4
TriggerSmoothing.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TriggerSmoothing.BackgroundTransparency = 1.000
TriggerSmoothing.BorderColor3 = Color3.fromRGB(0, 0, 0)
TriggerSmoothing.BorderSizePixel = 0
TriggerSmoothing.Size = UDim2.new(1, 0, 1, 0)
TriggerSmoothing.Font = Enum.Font.SourceSans
TriggerSmoothing.Text = ""
TriggerSmoothing.TextColor3 = Color3.fromRGB(0, 0, 0)
TriggerSmoothing.TextSize = 14.000
-- Made By Mick Gordon
Numbers_2.Name = "Numbers"
Numbers_2.Parent = Frame_2
Numbers_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Numbers_2.BackgroundTransparency = 1.000
Numbers_2.BorderColor3 = Color3.fromRGB(255, 255, 255)
Numbers_2.BorderSizePixel = 0
Numbers_2.Position = UDim2.new(0.79130435, 0, 0, 0)
Numbers_2.Size = UDim2.new(0, 50, 0, 23)
Numbers_2.Font = Enum.Font.Gotham
Numbers_2.Text = "0"
Numbers_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Numbers_2.TextSize = 14.000

TextLabel_2.Parent = Frame_2
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0.0608695634, 0, 0, 0)
TextLabel_2.Size = UDim2.new(0, 50, 0, 23)
TextLabel_2.Font = Enum.Font.Gotham
TextLabel_2.Text = "Smoothing"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextSize = 14.000

TextLabel_3.Parent = AimBotSection
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(0.0700000003, 0, 0.20869565, 0)
TextLabel_3.Size = UDim2.new(0, 100, 0, 17)
TextLabel_3.Font = Enum.Font.Gotham
TextLabel_3.Text = "Aim Part"
TextLabel_3.TextColor3 = Color3.fromRGB(17, 223, 255)
TextLabel_3.TextSize = 21.000

Allways_Show.Name = "Allways_Show"
Allways_Show.Parent = AimBotSection
Allways_Show.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
Allways_Show.BorderColor3 = Color3.fromRGB(255, 255, 255)
Allways_Show.Position = UDim2.new(0.234439835, 0, 0.139479905, 0)
Allways_Show.Size = UDim2.new(0, 164, 0, 29)
Allways_Show.Font = Enum.Font.Gotham
Allways_Show.Text = "HEAD, torso"
Allways_Show.TextColor3 = Color3.fromRGB(255, 255, 255)
Allways_Show.TextSize = 16.000

TextLabel_4.Parent = DeleteMobF
TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.BackgroundTransparency = 1.000
TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_4.BorderSizePixel = 0
TextLabel_4.Position = UDim2.new(0.00569662312, 0, 0.100655407, 0)
TextLabel_4.Size = UDim2.new(0, 100, 0, 17)
TextLabel_4.Font = Enum.Font.Gotham
TextLabel_4.Text = "Aim Bot"
TextLabel_4.TextColor3 = Color3.fromRGB(17, 223, 255)
TextLabel_4.TextSize = 18.000
TextLabel_4.TextXAlignment = Enum.TextXAlignment.Left

ESPSection.Name = "ESPSection"
ESPSection.Parent = DeleteMobF
ESPSection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ESPSection.BackgroundTransparency = 1.000
ESPSection.BorderColor3 = Color3.fromRGB(0, 0, 0)
ESPSection.BorderSizePixel = 0
ESPSection.Position = UDim2.new(0.26986298, 0, 0.160724282, 0)
ESPSection.Size = UDim2.new(0, 100, 0, 334)
-- Made By Mick Gordon
UIListLayout_2.Parent = ESPSection
UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.Padding = UDim.new(0, 5)

BBE.Name = "BBE"
BBE.Parent = ESPSection
BBE.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
BBE.BorderColor3 = Color3.fromRGB(255, 255, 255)
BBE.Position = UDim2.new(0.234439835, 0, 0.139479905, 0)
BBE.Size = UDim2.new(0, 164, 0, 29)
BBE.Font = Enum.Font.Gotham
BBE.Text = "Box"
BBE.TextColor3 = Color3.fromRGB(255, 255, 255)
BBE.TextSize = 16.000

BBN.Name = "BBN"
BBN.Parent = ESPSection
BBN.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
BBN.BorderColor3 = Color3.fromRGB(255, 255, 255)
BBN.Position = UDim2.new(0.234439835, 0, 0.139479905, 0)
BBN.Size = UDim2.new(0, 164, 0, 29)
BBN.Font = Enum.Font.Gotham
BBN.Text = "Name"
BBN.TextColor3 = Color3.fromRGB(255, 255, 255)
BBN.TextSize = 16.000
-- Made By Mick Gordon
BBD.Name = "BBD"
BBD.Parent = ESPSection
BBD.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
BBD.BorderColor3 = Color3.fromRGB(255, 255, 255)
BBD.Position = UDim2.new(0.234439835, 0, 0.139479905, 0)
BBD.Size = UDim2.new(0, 164, 0, 29)
BBD.Font = Enum.Font.Gotham
BBD.Text = "Distance"
BBD.TextColor3 = Color3.fromRGB(255, 255, 255)
BBD.TextSize = 16.000

BBH.Name = "BBH"
BBH.Parent = ESPSection
BBH.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
BBH.BorderColor3 = Color3.fromRGB(255, 255, 255)
BBH.Position = UDim2.new(0.234439835, 0, 0.139479905, 0)
BBH.Size = UDim2.new(0, 164, 0, 29)
BBH.Font = Enum.Font.Gotham
BBH.Text = "Health"
BBH.TextColor3 = Color3.fromRGB(255, 255, 255)
BBH.TextSize = 16.000

BTC.Name = "BBE"
BTC.Parent = ESPSection
BTC.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
BTC.BorderColor3 = Color3.fromRGB(255, 255, 255)
BTC.Position = UDim2.new(0.234439835, 0, 0.139479905, 0)
BTC.Size = UDim2.new(0, 164, 0, 29)
BTC.Font = Enum.Font.Gotham
BTC.Text = "Team Check"
BTC.TextColor3 = Color3.fromRGB(255, 255, 255)
BTC.TextSize = 16.000

TextLabel_5.Parent = ESPSection
TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_5.BackgroundTransparency = 1.000
TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_5.BorderSizePixel = 0
TextLabel_5.Position = UDim2.new(0.0700000003, 0, 0.20869565, 0)
TextLabel_5.Size = UDim2.new(0, 100, 0, 17)
TextLabel_5.Font = Enum.Font.Gotham
TextLabel_5.Text = "Health Type"
TextLabel_5.TextColor3 = Color3.fromRGB(17, 223, 255)
TextLabel_5.TextSize = 21.000
-- Made By Mick Gordon
BBHT.Name = "BBHT"
BBHT.Parent = ESPSection
BBHT.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
BBHT.BorderColor3 = Color3.fromRGB(255, 255, 255)
BBHT.Position = UDim2.new(0.234439835, 0, 0.139479905, 0)
BBHT.Size = UDim2.new(0, 164, 0, 29)
BBHT.Font = Enum.Font.Gotham
BBHT.Text = "BAR, text, both"
BBHT.TextColor3 = Color3.fromRGB(255, 255, 255)
BBHT.TextSize = 16.000

TextLabel_6.Parent = ESPSection
TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_6.BackgroundTransparency = 1.000
TextLabel_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_6.BorderSizePixel = 0-- Made By Mick Gordon
TextLabel_6.Position = UDim2.new(0.0700000003, 0, 0.20869565, 0)
TextLabel_6.Size = UDim2.new(0, 100, 0, 17)
TextLabel_6.Font = Enum.Font.Gotham
TextLabel_6.Text = "Box Color"
TextLabel_6.TextColor3 = Color3.fromRGB(17, 223, 255)
TextLabel_6.TextSize = 21.000

TextLabel_7.Parent = ESPSection
TextLabel_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_7.BackgroundTransparency = 1.000
TextLabel_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_7.BorderSizePixel = 0
TextLabel_7.Position = UDim2.new(0.0700000003, 0, 0.20869565, 0)
TextLabel_7.Size = UDim2.new(0, 100, 0, 17)
TextLabel_7.Font = Enum.Font.Gotham
TextLabel_7.Text = "R,G,B"
TextLabel_7.TextColor3 = Color3.fromRGB(17, 223, 255)
TextLabel_7.TextSize = 21.000

Frame_3.Parent = ESPSection
Frame_3.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_3.BorderSizePixel = 0
Frame_3.Position = UDim2.new(0.0909090936, 0, 0.600000739, 0)
Frame_3.Size = UDim2.new(0, 100, 0, 30)

UIListLayout_3.Parent = Frame_3
UIListLayout_3.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_3.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout_3.Padding = UDim.new(0, 5)

Box_R.Name = "Box_R"
Box_R.Parent = Frame_3
Box_R.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
Box_R.BorderColor3 = Color3.fromRGB(255, 255, 255)
Box_R.Size = UDim2.new(0, 75, 0, 24)
Box_R.ClearTextOnFocus = false
Box_R.Font = Enum.Font.Gotham
Box_R.PlaceholderText = "255 - 0"
Box_R.Text = "75"
Box_R.TextColor3 = Color3.fromRGB(255, 255, 255)
Box_R.TextSize = 14.000

Box_G.Name = "Box_G"
Box_G.Parent = Frame_3
Box_G.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
Box_G.BorderColor3 = Color3.fromRGB(255, 255, 255)
Box_G.Size = UDim2.new(0, 75, 0, 24)
Box_G.ClearTextOnFocus = false
Box_G.Font = Enum.Font.Gotham
Box_G.PlaceholderText = "255 - 0"
Box_G.Text = "0" 
Box_G.TextColor3 = Color3.fromRGB(255, 255, 255)
Box_G.TextSize = 14.000
-- Made By Mick Gordon
Box_B.Name = "Box_B"
Box_B.Parent = Frame_3
Box_B.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
Box_B.BorderColor3 = Color3.fromRGB(255, 255, 255)
Box_B.Size = UDim2.new(0, 75, 0, 24)
Box_B.ClearTextOnFocus = false
Box_B.Font = Enum.Font.Gotham
Box_B.PlaceholderText = "255 - 0"
Box_B.Text = "10"
Box_B.TextColor3 = Color3.fromRGB(255, 255, 255)
Box_B.TextSize = 14.000

TextLabel_8.Parent = DeleteMobF
TextLabel_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_8.BackgroundTransparency = 1.000
TextLabel_8.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_8.BorderSizePixel = 0
TextLabel_8.Position = UDim2.new(0.215919182, 0, 0.100655407, 0)
TextLabel_8.Size = UDim2.new(0, 100, 0, 17)
TextLabel_8.Font = Enum.Font.Gotham
TextLabel_8.Text = "ESP"
TextLabel_8.TextColor3 = Color3.fromRGB(17, 223, 255)
TextLabel_8.TextSize = 18.000
TextLabel_8.TextXAlignment = Enum.TextXAlignment.Left

ESPSection_2.Name = "ESPSection"
ESPSection_2.Parent = DeleteMobF
ESPSection_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ESPSection_2.BackgroundTransparency = 1.000
ESPSection_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ESPSection_2.BorderSizePixel = 0
ESPSection_2.Position = UDim2.new(0.475963563, 0, 0.160724282, 0)
ESPSection_2.Size = UDim2.new(0, 100, 0, 334)

UIListLayout_4.Parent = ESPSection_2
UIListLayout_4.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_4.Padding = UDim.new(0, 5)

OE.Name = "OE"
OE.Parent = ESPSection_2
OE.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
OE.BorderColor3 = Color3.fromRGB(255, 255, 255)
OE.Position = UDim2.new(0.234439835, 0, 0.139479905, 0)
OE.Size = UDim2.new(0, 164, 0, 29)
OE.Font = Enum.Font.Gotham
OE.Text = "Outlines"
OE.TextColor3 = Color3.fromRGB(255, 255, 255)
OE.TextSize = 16.000

OTC.Name = "OTC"
OTC.Parent = ESPSection_2
OTC.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
OTC.BorderColor3 = Color3.fromRGB(255, 255, 255)
OTC.Position = UDim2.new(0.234439835, 0, 0.139479905, 0)
OTC.Size = UDim2.new(0, 164, 0, 29)
OTC.Font = Enum.Font.Gotham
OTC.Text = "Team Check"
OTC.TextColor3 = Color3.fromRGB(255, 255, 255)
OTC.TextSize = 16.000

Frame_4.Parent = ESPSection_2
Frame_4.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
Frame_4.BackgroundTransparency = 0.700
Frame_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_4.BorderSizePixel = 0
Frame_4.Position = UDim2.new(-0.550000012, 0, 0.739130437, 0)
Frame_4.Size = UDim2.new(0, 230, 0, 50)

Slider1.Name = "Slider1"
Slider1.Parent = Frame_4
Slider1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Slider1.BorderColor3 = Color3.fromRGB(0, 0, 0)
Slider1.BorderSizePixel = 0
Slider1.Position = UDim2.new(0.0629399866, 0, 0.45120728, 0)
Slider1.Size = UDim2.new(0, 200, 0, 15)

UICorner_5.Parent = Slider1

Fill3.Name = "Fill3"
Fill3.Parent = Slider1
Fill3.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Fill3.BackgroundTransparency = 0.200
Fill3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Fill3.BorderSizePixel = 0
Fill3.Size = UDim2.new(0, 100, 0, 15)
-- Made By Mick Gordon
UICorner_6.Parent = Fill3

UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(17, 223, 255)), ColorSequenceKeypoint.new(0.29, Color3.fromRGB(17, 223, 255)), ColorSequenceKeypoint.new(0.43, Color3.fromRGB(18, 218, 249)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(52, 52, 52))}
UIGradient_3.Parent = Fill3

TriggerOutTans.Name = "TriggerOutTans"
TriggerOutTans.Parent = Slider1
TriggerOutTans.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TriggerOutTans.BackgroundTransparency = 1.000
TriggerOutTans.BorderColor3 = Color3.fromRGB(0, 0, 0)
TriggerOutTans.BorderSizePixel = 0
TriggerOutTans.Size = UDim2.new(1, 0, 1, 0)
TriggerOutTans.Font = Enum.Font.SourceSans
TriggerOutTans.Text = ""
TriggerOutTans.TextColor3 = Color3.fromRGB(0, 0, 0)
TriggerOutTans.TextSize = 14.000

Numbers_3.Name = "Numbers"
Numbers_3.Parent = Frame_4
Numbers_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Numbers_3.BackgroundTransparency = 1.000
Numbers_3.BorderColor3 = Color3.fromRGB(255, 255, 255)
Numbers_3.BorderSizePixel = 0
Numbers_3.Position = UDim2.new(0.79130435, 0, 0, 0)
Numbers_3.Size = UDim2.new(0, 50, 0, 23)
Numbers_3.Font = Enum.Font.Gotham
Numbers_3.Text = "50"
Numbers_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Numbers_3.TextSize = 14.000

TextLabel_9.Parent = Frame_4
TextLabel_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_9.BackgroundTransparency = 1.000
TextLabel_9.BorderColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_9.BorderSizePixel = 0
TextLabel_9.Position = UDim2.new(0.0608695634, 0, 0, 0)
TextLabel_9.Size = UDim2.new(0, 125, 0, 23)
TextLabel_9.Font = Enum.Font.Gotham
TextLabel_9.Text = "Outlines Transparency"
TextLabel_9.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_9.TextSize = 14.000

Frame_5.Parent = ESPSection_2
Frame_5.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
Frame_5.BackgroundTransparency = 0.700
Frame_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_5.BorderSizePixel = 0
Frame_5.Position = UDim2.new(-0.550000012, 0, 0.739130437, 0)
Frame_5.Size = UDim2.new(0, 230, 0, 50)

Slider2.Name = "Slider2"
Slider2.Parent = Frame_5
Slider2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Slider2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Slider2.BorderSizePixel = 0
Slider2.Position = UDim2.new(0.0629399866, 0, 0.45120728, 0)
Slider2.Size = UDim2.new(0, 200, 0, 15)

UICorner_7.Parent = Slider2

Fill4.Name = "Fill4"
Fill4.Parent = Slider2
Fill4.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Fill4.BackgroundTransparency = 0.200
Fill4.BorderColor3 = Color3.fromRGB(0, 0, 0)
Fill4.BorderSizePixel = 0
Fill4.Size = UDim2.new(0, 100, 0, 15)
-- Made By Mick Gordon
UICorner_8.Parent = Fill4

UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(17, 223, 255)), ColorSequenceKeypoint.new(0.29, Color3.fromRGB(17, 223, 255)), ColorSequenceKeypoint.new(0.43, Color3.fromRGB(18, 218, 249)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(52, 52, 52))}
UIGradient_4.Parent = Fill4

TriggerFill.Name = "TriggerFill"
TriggerFill.Parent = Slider2
TriggerFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TriggerFill.BackgroundTransparency = 1.000
TriggerFill.BorderColor3 = Color3.fromRGB(0, 0, 0)
TriggerFill.BorderSizePixel = 0
TriggerFill.Size = UDim2.new(1, 0, 1, 0)
TriggerFill.Font = Enum.Font.SourceSans
TriggerFill.Text = ""
TriggerFill.TextColor3 = Color3.fromRGB(0, 0, 0)
TriggerFill.TextSize = 14.000

Numbers_4.Name = "Numbers"
Numbers_4.Parent = Frame_5
Numbers_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Numbers_4.BackgroundTransparency = 1.000
Numbers_4.BorderColor3 = Color3.fromRGB(255, 255, 255)
Numbers_4.BorderSizePixel = 0
Numbers_4.Position = UDim2.new(0.79130435, 0, 0, 0)
Numbers_4.Size = UDim2.new(0, 50, 0, 23)
Numbers_4.Font = Enum.Font.Gotham
Numbers_4.Text = "50"
Numbers_4.TextColor3 = Color3.fromRGB(255, 255, 255)
Numbers_4.TextSize = 14.000

TextLabel_10.Parent = Frame_5
TextLabel_10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_10.BackgroundTransparency = 1.000
TextLabel_10.BorderColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_10.BorderSizePixel = 0
TextLabel_10.Position = UDim2.new(0.104347825, 0, 0, 0)
TextLabel_10.Size = UDim2.new(0, 133, 0, 23)
TextLabel_10.Font = Enum.Font.Gotham
TextLabel_10.Text = "Fill Outlines Transparency"
TextLabel_10.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_10.TextSize = 14.000
-- Made By Mick Gordon
TextLabel_11.Parent = ESPSection_2
TextLabel_11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_11.BackgroundTransparency = 1.000
TextLabel_11.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_11.BorderSizePixel = 0
TextLabel_11.Position = UDim2.new(0.0700000003, 0, 0.20869565, 0)
TextLabel_11.Size = UDim2.new(0, 100, 0, 17)
TextLabel_11.Font = Enum.Font.Gotham
TextLabel_11.Text = "Outlines"
TextLabel_11.TextColor3 = Color3.fromRGB(17, 223, 255)
TextLabel_11.TextSize = 21.000

Frame_6.Parent = ESPSection_2
Frame_6.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
Frame_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_6.BorderSizePixel = 0
Frame_6.Position = UDim2.new(0.0909090936, 0, 0.600000739, 0)
Frame_6.Size = UDim2.new(0, 100, 0, 30)

UIListLayout_5.Parent = Frame_6
UIListLayout_5.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_5.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_5.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout_5.Padding = UDim.new(0, 5)

Outlines_R.Name = "Outlines_R"
Outlines_R.Parent = Frame_6
Outlines_R.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
Outlines_R.BorderColor3 = Color3.fromRGB(255, 255, 255)
Outlines_R.Size = UDim2.new(0, 75, 0, 24)
Outlines_R.ClearTextOnFocus = false
Outlines_R.Font = Enum.Font.Gotham
Outlines_R.PlaceholderText = "255 - 0"
Outlines_R.Text = "255"
Outlines_R.TextColor3 = Color3.fromRGB(255, 255, 255)
Outlines_R.TextSize = 14.000

Outlines_G.Name = "Outlines_G"
Outlines_G.Parent = Frame_6
Outlines_G.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
Outlines_G.BorderColor3 = Color3.fromRGB(255, 255, 255)
Outlines_G.Size = UDim2.new(0, 75, 0, 24)
Outlines_G.ClearTextOnFocus = false
Outlines_G.Font = Enum.Font.Gotham
Outlines_G.PlaceholderText = "255 - 0"
Outlines_G.Text = "255"
Outlines_G.TextColor3 = Color3.fromRGB(255, 255, 255)
Outlines_G.TextSize = 14.000

Outlines_B.Name = "Outlines_B"
Outlines_B.Parent = Frame_6
Outlines_B.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
Outlines_B.BorderColor3 = Color3.fromRGB(255, 255, 255)
Outlines_B.Size = UDim2.new(0, 75, 0, 24)
Outlines_B.ClearTextOnFocus = false
Outlines_B.Font = Enum.Font.Gotham
Outlines_B.PlaceholderText = "255 - 0"
Outlines_B.Text = "255"
Outlines_B.TextColor3 = Color3.fromRGB(255, 255, 255)
Outlines_B.TextSize = 14.000
-- Made By Mick Gordon
TextLabel_12.Parent = ESPSection_2
TextLabel_12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_12.BackgroundTransparency = 1.000
TextLabel_12.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_12.BorderSizePixel = 0
TextLabel_12.Position = UDim2.new(0.0700000003, 0, 0.20869565, 0)
TextLabel_12.Size = UDim2.new(0, 100, 0, 17)
TextLabel_12.Font = Enum.Font.Gotham
TextLabel_12.Text = "Fill Outlines"
TextLabel_12.TextColor3 = Color3.fromRGB(17, 223, 255)
TextLabel_12.TextSize = 21.000

Frame_7.Parent = ESPSection_2
Frame_7.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
Frame_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_7.BorderSizePixel = 0
Frame_7.Position = UDim2.new(0.0909090936, 0, 0.600000739, 0)
Frame_7.Size = UDim2.new(0, 100, 0, 30)

UIListLayout_6.Parent = Frame_7
UIListLayout_6.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_6.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_6.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_6.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout_6.Padding = UDim.new(0, 5)

FillOutlines_R.Name = "FillOutlines_R"
FillOutlines_R.Parent = Frame_7
FillOutlines_R.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
FillOutlines_R.BorderColor3 = Color3.fromRGB(255, 255, 255)
FillOutlines_R.Size = UDim2.new(0, 75, 0, 24)
FillOutlines_R.ClearTextOnFocus = false
FillOutlines_R.Font = Enum.Font.Gotham
FillOutlines_R.PlaceholderText = "255 - 0"
FillOutlines_R.Text = "255"
FillOutlines_R.TextColor3 = Color3.fromRGB(255, 255, 255)
FillOutlines_R.TextSize = 14.000

FillOutlines_G.Name = "FillOutlines_G"
FillOutlines_G.Parent = Frame_7
FillOutlines_G.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
FillOutlines_G.BorderColor3 = Color3.fromRGB(255, 255, 255)
FillOutlines_G.Size = UDim2.new(0, 75, 0, 24)
FillOutlines_G.ClearTextOnFocus = false
FillOutlines_G.Font = Enum.Font.Gotham
FillOutlines_G.PlaceholderText = "255 - 0"
FillOutlines_G.Text = "255"
FillOutlines_G.TextColor3 = Color3.fromRGB(255, 255, 255)
FillOutlines_G.TextSize = 14.000

FillOutlines_B.Name = "FillOutlines_B"
FillOutlines_B.Parent = Frame_7
FillOutlines_B.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
FillOutlines_B.BorderColor3 = Color3.fromRGB(255, 255, 255)
FillOutlines_B.Size = UDim2.new(0, 75, 0, 24)
FillOutlines_B.ClearTextOnFocus = false
FillOutlines_B.Font = Enum.Font.Gotham
FillOutlines_B.PlaceholderText = "255 - 0"
FillOutlines_B.Text = "255"
FillOutlines_B.TextColor3 = Color3.fromRGB(255, 255, 255)
FillOutlines_B.TextSize = 14.000
-- Made By Mick Gordon
Tracerssection.Name = "Tracers section"
Tracerssection.Parent = DeleteMobF
Tracerssection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Tracerssection.BackgroundTransparency = 1.000
Tracerssection.BorderColor3 = Color3.fromRGB(0, 0, 0)
Tracerssection.BorderSizePixel = 0
Tracerssection.Position = UDim2.new(0.682779849, 0, 0.158000082, 0)
Tracerssection.Size = UDim2.new(0, 100, 0, 334)

UIListLayout_7.Parent = Tracerssection
UIListLayout_7.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_7.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_7.Padding = UDim.new(0, 5)

TE.Name = "TE"
TE.Parent = Tracerssection
TE.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
TE.BorderColor3 = Color3.fromRGB(255, 255, 255)
TE.Position = UDim2.new(0.234439835, 0, 0.139479905, 0)
TE.Size = UDim2.new(0, 164, 0, 29)
TE.Font = Enum.Font.Gotham
TE.Text = "Tracers"
TE.TextColor3 = Color3.fromRGB(255, 255, 255)
TE.TextSize = 16.000

TTC.Name = "TTC"
TTC.Parent = Tracerssection
TTC.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
TTC.BorderColor3 = Color3.fromRGB(255, 255, 255)
TTC.Position = UDim2.new(0.234439835, 0, 0.139479905, 0)
TTC.Size = UDim2.new(0, 164, 0, 29)
TTC.Font = Enum.Font.Gotham
TTC.Text = "Team Check"
TTC.TextColor3 = Color3.fromRGB(255, 255, 255)
TTC.TextSize = 16.000

TTCOlor.Name = "TTCOlor"
TTCOlor.Parent = Tracerssection
TTCOlor.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
TTCOlor.BorderColor3 = Color3.fromRGB(255, 255, 255)
TTCOlor.Position = UDim2.new(0.234439835, 0, 0.139479905, 0)
TTCOlor.Size = UDim2.new(0, 164, 0, 29)
TTCOlor.Font = Enum.Font.Gotham
TTCOlor.Text = "Team Color"
TTCOlor.TextColor3 = Color3.fromRGB(255, 255, 255)
TTCOlor.TextSize = 16.000

Frame_8.Parent = Tracerssection
Frame_8.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
Frame_8.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_8.BorderSizePixel = 0
Frame_8.Position = UDim2.new(0.0909090936, 0, 0.600000739, 0)
Frame_8.Size = UDim2.new(0, 100, 0, 40)

UIListLayout_8.Parent = Frame_8
UIListLayout_8.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_8.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_8.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_8.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout_8.Padding = UDim.new(0, 5)

Tracers_R.Name = "Tracers_R"
Tracers_R.Parent = Frame_8
Tracers_R.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
Tracers_R.BorderColor3 = Color3.fromRGB(255, 255, 255)
Tracers_R.Size = UDim2.new(0, 75, 0, 24)
Tracers_R.ClearTextOnFocus = false
Tracers_R.Font = Enum.Font.Gotham
Tracers_R.PlaceholderText = "255 - 0"
Tracers_R.Text = "75" 
Tracers_R.TextColor3 = Color3.fromRGB(255, 255, 255)
Tracers_R.TextSize = 14.000

Tracers_G.Name = "Tracers_G"
Tracers_G.Parent = Frame_8
Tracers_G.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
Tracers_G.BorderColor3 = Color3.fromRGB(255, 255, 255)
Tracers_G.Size = UDim2.new(0, 75, 0, 24)
Tracers_G.ClearTextOnFocus = false
Tracers_G.Font = Enum.Font.Gotham
Tracers_G.PlaceholderText = "255 - 0"
Tracers_G.Text = "0"
Tracers_G.TextColor3 = Color3.fromRGB(255, 255, 255)
Tracers_G.TextSize = 14.000

Tracers_B.Name = "Tracers_B"
Tracers_B.Parent = Frame_8
Tracers_B.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
Tracers_B.BorderColor3 = Color3.fromRGB(255, 255, 255)
Tracers_B.Size = UDim2.new(0, 75, 0, 24)
Tracers_B.ClearTextOnFocus = false
Tracers_B.Font = Enum.Font.Gotham
Tracers_B.PlaceholderText = "255 - 0"
Tracers_B.Text = "10"
Tracers_B.TextColor3 = Color3.fromRGB(255, 255, 255)
Tracers_B.TextSize = 14.000
-- Made By Mick Gordon
Unknown.Name = "Unknown"
Unknown.Parent = DeleteMobF
Unknown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Unknown.BackgroundTransparency = 1.000
Unknown.BorderColor3 = Color3.fromRGB(0, 0, 0)
Unknown.BorderSizePixel = 0
Unknown.Position = UDim2.new(0.882285178, 0, 0.158000082, 0)
Unknown.Size = UDim2.new(0, 100, 0, 334)

UIListLayout_9.Parent = Unknown
UIListLayout_9.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_9.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_9.Padding = UDim.new(0, 5)

TextLabel_13.Parent = Unknown
TextLabel_13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_13.BackgroundTransparency = 1.000
TextLabel_13.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_13.BorderSizePixel = 0
TextLabel_13.Position = UDim2.new(0.0700000003, 0, 0.20869565, 0)
TextLabel_13.Size = UDim2.new(0, 100, 0, 17)
TextLabel_13.Font = Enum.Font.Gotham
TextLabel_13.Text = "More Options"
TextLabel_13.TextColor3 = Color3.fromRGB(17, 223, 255)
TextLabel_13.TextSize = 21.000

TextLabel_14.Parent = Unknown
TextLabel_14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_14.BackgroundTransparency = 1.000
TextLabel_14.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_14.BorderSizePixel = 0
TextLabel_14.Position = UDim2.new(0.215919182, 0, 0.100655407, 0)
TextLabel_14.Size = UDim2.new(0, 100, 0, 17)
TextLabel_14.Font = Enum.Font.Gotham
TextLabel_14.Text = "Later"
TextLabel_14.TextColor3 = Color3.fromRGB(17, 223, 255)
TextLabel_14.TextSize = 18.000

Open.Name = "Open"
Open.Parent = CheatEngineDeleteMob
Open.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
Open.BorderColor3 = Color3.fromRGB(255, 255, 255)
Open.Position = UDim2.new(0.5, 0, 0.0199999996, 0)
Open.Size = UDim2.new(0, 150, 0, 50)
Open.ZIndex = 10
Open.Visible = DeleteMob.GUi.OpenNCloseButton
Open.Draggable = true
Open.Active = true

TextButton.Parent = Open
TextButton.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
TextButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
TextButton.Position = UDim2.new(0, 0, 0.319999933, 0)
TextButton.Size = UDim2.new(0, 150, 0, 34)
TextButton.Font = Enum.Font.Gotham
TextButton.Text = "open / Close"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 14.000

PLAYER:GetMouse().KeyDown:Connect(function(KeyPressed) -- What The Fuck
	if KeyPressed == (DeleteMob.GUi.Keybind) and DeleteMob.GUi.KeybindEnable then
        if DeleteMobF.Visible == true then
            DeleteMobF.Visible = false
        else
            DeleteMobF.Visible = true
        end
    end
    if KeyPressed == (DeleteMob.Aimbot.Keybind) and DeleteMob.Aimbot.Enabled then
        DeleteMob.Aimbot.IsAimKeyDown = true
    end
end)
PLAYER:GetMouse().KeyUp:Connect(function(KeyPressed) 
    if KeyPressed == (DeleteMob.Aimbot.Keybind) and DeleteMob.Aimbot.Enabled then
        DeleteMob.Aimbot.IsAimKeyDown = false
    end
end)

PLAYER:GetMouse().Button1Down:Connect(function()
    if DeleteMob.Aimbot.Keybind == "MouseButton1" and DeleteMob.Aimbot.Enabled then
        DeleteMob.Aimbot.IsAimKeyDown = true
    end
end)
PLAYER:GetMouse().Button1Up:Connect(function()
    if DeleteMob.Aimbot.Keybind == "MouseButton1" and DeleteMob.Aimbot.Enabled then
        DeleteMob.Aimbot.IsAimKeyDown = false
    end
end)
PLAYER:GetMouse().Button2Down:Connect(function()
    if DeleteMob.Aimbot.Keybind == "MouseButton2" and DeleteMob.Aimbot.Enabled then
        DeleteMob.Aimbot.IsAimKeyDown = true
    end
end)
PLAYER:GetMouse().Button2Up:Connect(function()
    if DeleteMob.Aimbot.Keybind == "MouseButton2" and DeleteMob.Aimbot.Enabled then
        DeleteMob.Aimbot.IsAimKeyDown = false
    end
end)

-- Made By Mick Gordon
ABE.MouseButton1Click:Connect(function()
	if ABE.BackgroundColor3 == Color3.fromRGB(52, 52, 52) then
		ABE.BackgroundColor3 = Color3.fromRGB(2, 54, 8)
		DeleteMob.Aimbot.Enabled = true
	else
		ABE.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
		DeleteMob.Aimbot.Enabled = false	
	end
end)

ABSF.MouseButton1Click:Connect(function()
	if ABSF.BackgroundColor3 == Color3.fromRGB(52, 52, 52) then
		ABSF.BackgroundColor3 = Color3.fromRGB(2, 54, 8)
		DeleteMob.Aimbot.ShowFov = true
	else
		ABSF.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
		DeleteMob.Aimbot.ShowFov = false	
	end
end)

ABTC.MouseButton1Click:Connect(function()
	if ABTC.BackgroundColor3 == Color3.fromRGB(52, 52, 52) then
		ABTC.BackgroundColor3 = Color3.fromRGB(2, 54, 8)
		DeleteMob.Aimbot.TeamCheck = true
	else
		ABTC.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
		DeleteMob.Aimbot.TeamCheck = false	
	end
end)

ABWC.MouseButton1Click:Connect(function()
	if ABWC.BackgroundColor3 == Color3.fromRGB(52, 52, 52) then
		ABWC.BackgroundColor3 = Color3.fromRGB(2, 54, 8)
		DeleteMob.Aimbot.WallCheck = true
	else
		ABWC.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
		DeleteMob.Aimbot.WallCheck = false	
	end
end)

Allways_Show.MouseButton1Click:Connect(function()
	if DeleteMob.Aimbot.AimPart == "Head" then
		Allways_Show.Text = "head, TORSO"
		DeleteMob.Aimbot.AimPart = "HumanoidRootPart"
	else
		Allways_Show.Text = "HEAD, torso"
		DeleteMob.Aimbot.AimPart = "Head"
	end
end)

-- Box ESP

BBD.MouseButton1Click:Connect(function()
	if BBD.BackgroundColor3 == Color3.fromRGB(52, 52, 52) then
		BBD.BackgroundColor3 = Color3.fromRGB(2, 54, 8)
		DeleteMob.ESP.Box.Distance = true
	else
		BBD.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
		DeleteMob.ESP.Box.Distance = false	
	end
end)

BBE.MouseButton1Click:Connect(function()
	if BBE.BackgroundColor3 == Color3.fromRGB(52, 52, 52) then
		BBE.BackgroundColor3 = Color3.fromRGB(2, 54, 8)
		DeleteMob.ESP.Box.Box = true
	else
		BBE.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
		DeleteMob.ESP.Box.Box = false	
	end
end)

BBH.MouseButton1Click:Connect(function()
	if BBH.BackgroundColor3 == Color3.fromRGB(52, 52, 52) then
		BBH.BackgroundColor3 = Color3.fromRGB(2, 54, 8)
		DeleteMob.ESP.Box.Health = true
	else
		BBH.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
		DeleteMob.ESP.Box.Health = false	
	end
end)

BBHT.MouseButton1Click:Connect(function()
	if DeleteMob.ESP.Box.HealthType == "Bar" then
		BBHT.Text = "bar, TEXT, both"
		DeleteMob.ESP.Box.HealthType = "Text"
	elseif DeleteMob.ESP.Box.HealthType == "Text" then
		BBHT.Text = "bar, text, BOTH"
		DeleteMob.ESP.Box.HealthType = "Both"
	elseif DeleteMob.ESP.Box.HealthType == "Both" then
		BBHT.Text = "BAR, text, both"
		DeleteMob.ESP.Box.HealthType = "Bar"
	end
end)

BBN.MouseButton1Click:Connect(function()
	if BBN.BackgroundColor3 == Color3.fromRGB(52, 52, 52) then
		BBN.BackgroundColor3 = Color3.fromRGB(2, 54, 8)
		DeleteMob.ESP.Box.Name = true
	else
		BBN.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
		DeleteMob.ESP.Box.Name = false	
	end
end)

BTC.MouseButton1Click:Connect(function()
	if BTC.BackgroundColor3 == Color3.fromRGB(52, 52, 52) then
		BTC.BackgroundColor3 = Color3.fromRGB(2, 54, 8)
		DeleteMob.ESP.Box.TeamCheck = true
	else
		BTC.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
		DeleteMob.ESP.Box.TeamCheck = false	
	end
end)
-- Outlines

OE.MouseButton1Click:Connect(function()
	if OE.BackgroundColor3 == Color3.fromRGB(52, 52, 52) then
		OE.BackgroundColor3 = Color3.fromRGB(2, 54, 8)
		DeleteMob.ESP.OutLines.Enabled = true
	else
		OE.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
		DeleteMob.ESP.OutLines.Enabled = false	
	end
end)

OTC.MouseButton1Click:Connect(function()
	if OTC.BackgroundColor3 == Color3.fromRGB(52, 52, 52) then
		OTC.BackgroundColor3 = Color3.fromRGB(2, 54, 8)
		DeleteMob.ESP.OutLines.TeamCheck = true
	else
		OTC.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
		DeleteMob.ESP.OutLines.TeamCheck = false	
	end
end)

-- Tracers

TE.MouseButton1Click:Connect(function()
	if TE.BackgroundColor3 == Color3.fromRGB(52, 52, 52) then
		TE.BackgroundColor3 = Color3.fromRGB(2, 54, 8)
		DeleteMob.ESP.Tracers.Enabled = true
	else
		TE.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
		DeleteMob.ESP.Tracers.Enabled = false	
	end
end)

TTC.MouseButton1Click:Connect(function()
	if TTC.BackgroundColor3 == Color3.fromRGB(52, 52, 52) then
		TTC.BackgroundColor3 = Color3.fromRGB(2, 54, 8)
		DeleteMob.ESP.Tracers.TeamCheck = true
	else
		TTC.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
		DeleteMob.ESP.Tracers.TeamCheck = false	
	end
end)

TTCOlor.MouseButton1Click:Connect(function()
	if TTCOlor.BackgroundColor3 == Color3.fromRGB(52, 52, 52) then
		TTCOlor.BackgroundColor3 = Color3.fromRGB(2, 54, 8)
		DeleteMob.ESP.Tracers.TeamColor = true
	else
		TTCOlor.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
		DeleteMob.ESP.Tracers.TeamColor = false	
	end
end)

-- UI Toggle

TextButton.MouseButton1Click:Connect(function()
	if DeleteMobF.Visible == true then
		DeleteMobF.Visible = false
	else
		DeleteMobF.Visible = true
	end
end)


-- Scripts:

local function LDTZWMY_fake_script() -- Slider3.Script1 
	local Mouse = game.Players.LocalPlayer:GetMouse()
	local Slider = Slider3
	local Fill = Fill1
	local Trigger = TriggerFov
	local TextNumbers = Numbers
	
	local maxvalue = 7 or 700/700
	local startingvalue = 0 or 0/100
	
	Fill.Size = UDim2.fromScale(DeleteMob.Aimbot.Fov,1)
	TextNumbers.Text = tostring(math.round(DeleteMob.Aimbot.Fov*100))
	
	local TweenService = game:GetService("TweenService")
	local TweenStyle =  TweenInfo.new(0.25, Enum.EasingStyle.Exponential)
	
	local function UpdateSlider()
		local OutPut = math.clamp(((Vector2.new(Mouse.X,Mouse.Y)-Slider.AbsolutePosition)/Slider.AbsoluteSize).X,0,1)
		
		if DeleteMob.Aimbot.Fov ~= OutPut then
			TweenService:Create(Fill,TweenStyle,{Size = UDim2.fromScale(OutPut,1)}):Play()
		end
		
		DeleteMob.Aimbot.Fov = (startingvalue +(OutPut*(maxvalue-startingvalue)))*100
		TextNumbers.Text = tostring(math.round(DeleteMob.Aimbot.Fov*100))
	end
	
	Fill:GetPropertyChangedSignal("Size"):Connect(function()
		TextNumbers.Text = tostring(math.round(DeleteMob.Aimbot.Fov*100))
	end)
	
	local SliderActive = false
	
	local function ActivateSlider()
		SliderActive = true
		while SliderActive do
			UpdateSlider()
			task.wait()
		end
	end
	
	Trigger.MouseButton1Down:Connect(ActivateSlider)
	
	game:GetService("UserInputService").InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			SliderActive = false
		end
	end)
end
coroutine.wrap(LDTZWMY_fake_script)()

local function YEOE_fake_script() -- Slider4.Script2 
	local Mouse = game.Players.LocalPlayer:GetMouse()
	local Slider = Slider4
	local Fill = Fill2
	local Trigger = TriggerSmoothing
	local TextNumbers = Numbers_2
	
	local maxvalue = 3 or 30/30
	local startingvalue = 0 or 0/100
	
	Fill.Size = UDim2.fromScale(DeleteMob.Aimbot.Smoothing,1)
	TextNumbers.Text = tostring(math.round(DeleteMob.Aimbot.Smoothing*100))
	
	local TweenService = game:GetService("TweenService")
	local TweenStyle =  TweenInfo.new(0.25, Enum.EasingStyle.Exponential)
	
	local function UpdateSlider()
		local OutPut = math.clamp(((Vector2.new(Mouse.X,Mouse.Y)-Slider.AbsolutePosition)/Slider.AbsoluteSize).X,0,1)
		
		if DeleteMob.Aimbot.Smoothing ~= OutPut then
			TweenService:Create(Fill,TweenStyle,{Size = UDim2.fromScale(OutPut,1)}):Play()
		end
		
		DeleteMob.Aimbot.Smoothing = startingvalue +(OutPut*(maxvalue-startingvalue))
		TextNumbers.Text = tostring(math.round(DeleteMob.Aimbot.Smoothing*100))
	end
	
	Fill:GetPropertyChangedSignal("Size"):Connect(function()
		TextNumbers.Text = tostring(math.round(DeleteMob.Aimbot.Smoothing*100))
	end)
	
	local SliderActive = false
	
	local function ActivateSlider()
		SliderActive = true
		while SliderActive do
			UpdateSlider()
			task.wait()
		end
	end
	
	Trigger.MouseButton1Down:Connect(ActivateSlider)
	
	game:GetService("UserInputService").InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			SliderActive = false
		end
	end)
	
end
coroutine.wrap(YEOE_fake_script)()
local function GOUU_fake_script() -- Slider1.Script3 
	local Mouse = game.Players.LocalPlayer:GetMouse()
	local Slider = Slider1
	local Fill = Fill3
	local Trigger = TriggerOutTans
	local TextNumbers = Numbers_3
	
	local maxvalue = 1 or 100/100
	local startingvalue = 0 or 0/100
	
	Fill.Size = UDim2.fromScale(DeleteMob.ESP.OutLines.OutlineTrancparency,1)
	TextNumbers.Text = tostring(math.round(DeleteMob.ESP.OutLines.OutlineTrancparency*100))
	
	local TweenService = game:GetService("TweenService")
	local TweenStyle =  TweenInfo.new(0.25, Enum.EasingStyle.Exponential)
	
	local function UpdateSlider()
		local OutPut = math.clamp(((Vector2.new(Mouse.X,Mouse.Y)-Slider.AbsolutePosition)/Slider.AbsoluteSize).X,0,1)
		
		if DeleteMob.ESP.OutLines.OutlineTrancparency ~= OutPut then
			TweenService:Create(Fill,TweenStyle,{Size = UDim2.fromScale(OutPut,1)}):Play()
		end
		
		DeleteMob.ESP.OutLines.OutlineTrancparency = startingvalue +(OutPut*(maxvalue-startingvalue))
		TextNumbers.Text = tostring(math.round(DeleteMob.ESP.OutLines.OutlineTrancparency*100))
	end
	
	Fill:GetPropertyChangedSignal("Size"):Connect(function()
		TextNumbers.Text = tostring(math.round(DeleteMob.ESP.OutLines.OutlineTrancparency*100))
	end)
	
	local SliderActive = false
	
	local function ActivateSlider()
		SliderActive = true
		while SliderActive do
			UpdateSlider()
			task.wait()
		end
	end
	
	Trigger.MouseButton1Down:Connect(ActivateSlider)
	
	game:GetService("UserInputService").InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			SliderActive = false
		end
	end)
	
end
coroutine.wrap(GOUU_fake_script)()
local function MMUKLB_fake_script() -- Slider2.Script4 
	local Mouse = game.Players.LocalPlayer:GetMouse()
	local Slider = Slider2
	local Fill = Fill4
	local Trigger = TriggerFill
	local TextNumbers = Numbers_4
	
	local maxvalue = 1 or 100/100
	local startingvalue = 0 or 0/100
	
	Fill.Size = UDim2.fromScale(DeleteMob.ESP.OutLines.FillTrancparenct,1)
	TextNumbers.Text = tostring(math.round(DeleteMob.ESP.OutLines.FillTrancparenct*100))
	
	local TweenService = game:GetService("TweenService")
	local TweenStyle =  TweenInfo.new(0.25, Enum.EasingStyle.Exponential)
	
	local function UpdateSlider()
		local OutPut = math.clamp(((Vector2.new(Mouse.X,Mouse.Y)-Slider.AbsolutePosition)/Slider.AbsoluteSize).X,0,1)
		
		if DeleteMob.ESP.OutLines.FillTrancparenct ~= OutPut then
			TweenService:Create(Fill,TweenStyle,{Size = UDim2.fromScale(OutPut,1)}):Play()
		end
		
		DeleteMob.ESP.OutLines.FillTrancparenct = startingvalue +(OutPut*(maxvalue-startingvalue))
		TextNumbers.Text = tostring(math.round(DeleteMob.ESP.OutLines.FillTrancparenct*100))
	end
	
	Fill:GetPropertyChangedSignal("Size"):Connect(function()
		TextNumbers.Text = tostring(math.round(DeleteMob.ESP.OutLines.FillTrancparenct*100))
	end)
	
	local SliderActive = false
	
	local function ActivateSlider()
		SliderActive = true
		while SliderActive do
			UpdateSlider()
			task.wait()
		end
	end
	
	Trigger.MouseButton1Down:Connect(ActivateSlider)
	
	game:GetService("UserInputService").InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			SliderActive = false
		end
	end)
	
end
coroutine.wrap(MMUKLB_fake_script)()


game:GetService('RunService').RenderStepped:connect(function()

	-- Aimbot Check
	if DeleteMob.Aimbot.IsAimKeyDown then
        local _pos = CameraGetClosestToMouse(DeleteMob.Aimbot.Fov)
        if _pos then
            aimAt(_pos, DeleteMob.Aimbot.Smoothing)
        end
    end

	-- Fov
	local acc = DeleteMob.Aimbot.Smoothing / 2	
	local posd = UIS:GetMouseLocation() 
	FOVFFrame.Position = UDim2.new(0, posd.X, 0, posd.Y - 36)
	FOVFFrame.Size = UDim2.new(0, DeleteMob.Aimbot.Fov + acc, 0, DeleteMob.Aimbot.Fov + acc)
	FOVFFrame.Visible = DeleteMob.Aimbot.ShowFov
	FOVFFrame.BackgroundColor3 = DeleteMob.Aimbot.FovFillColor
	FOVFFrame.Transparency = DeleteMob.Aimbot.FovFillTransparency

	UIStroke.Color = DeleteMob.Aimbot.FovFillColor
	UIStroke.Transparency = DeleteMob.Aimbot.FovTransparenct
	UIStroke.Thickness = DeleteMob.Aimbot.Thickness
	
	-- Colors 
	
	DeleteMob.ESP.Box.BoxColor = Color3.fromRGB(tonumber(Box_R.Text), tonumber(Box_G.Text), tonumber(Box_B.Text))
	DeleteMob.ESP.OutLines.FillCollor = Color3.fromRGB(tonumber(FillOutlines_R.Text), tonumber(FillOutlines_G.Text), tonumber(FillOutlines_B.Text))
	DeleteMob.ESP.OutLines.OutlineColor = Color3.fromRGB(tonumber(Outlines_R.Text), tonumber(Outlines_G.Text), tonumber(Outlines_B.Text))
	DeleteMob.ESP.Tracers.Color = Color3.fromRGB(tonumber(Tracers_R.Text), tonumber(Tracers_G.Text), tonumber(Tracers_B.Text))
end)


task.wait()

for i,plr in pairs(game.Players:GetChildren()) do
	AddHighlight(plr)
	AddBox(plr)
	AddTracers(plr)
end

game.Players.PlayerAdded:Connect(function(plr)
	AddHighlight(plr)
	AddBox(plr)
	AddTracers(plr)
end)
   end,
})

local Button = AdminTab:CreateButton({
   Name = "AirHuB",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/AirHub/main/AirHub.lua"))()
   end,
})

local Section = AdminTab:CreateSection("ESP")

local Button = AdminTab:CreateButton({
   Name = "ESP",
   Callback = function()
        --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
-- ESP Module
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

-- Cache services
local LocalPlayer = Players.LocalPlayer
local LocalCharacter = LocalPlayer and LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local LocalHumanoidRootPart = LocalCharacter:WaitForChild("HumanoidRootPart")

local ESP = {}
ESP.__index = ESP

function ESP.new()
    local self = setmetatable({}, ESP)
    self.espCache = {}
    return self
end

function ESP:createDrawing(type, properties)
    local drawing = Drawing.new(type)
    for prop, val in pairs(properties) do
        drawing[prop] = val
    end
    return drawing
end

function ESP:createComponents()
    return {
        Box = self:createDrawing("Square", {
            Thickness = 1,
            Transparency = 1,
            Color = Color3.fromRGB(255, 255, 255),
            Filled = false
        }),
        Tracer = self:createDrawing("Line", {
            Thickness = 1,
            Transparency = 1,
            Color = Color3.fromRGB(255, 255, 255)
        }),
        DistanceLabel = self:createDrawing("Text", {
            Size = 18,
            Center = true,
            Outline = true,
            Color = Color3.fromRGB(255, 255, 255),
            OutlineColor = Color3.fromRGB(0, 0, 0)
        }),
        NameLabel = self:createDrawing("Text", {
            Size = 18,
            Center = true,
            Outline = true,
            Color = Color3.fromRGB(255, 255, 255),
            OutlineColor = Color3.fromRGB(0, 0, 0)
        }),
        HealthBar = {
            Outline = self:createDrawing("Square", {
                Thickness = 1,
                Transparency = 1,
                Color = Color3.fromRGB(0, 0, 0),
                Filled = false
            }),
            Health = self:createDrawing("Square", {
                Thickness = 1,
                Transparency = 1,
Color = Color3.fromRGB(0, 255, 0),
                Filled = true
            })
        },
        ItemLabel = self:createDrawing("Text", {
            Size = 18,
            Center = true,
            Outline = true,
            Color = Color3.fromRGB(255, 255, 255),
            OutlineColor = Color3.fromRGB(0, 0, 0)
        }),
        SkeletonLines = {}
    }
end

local bodyConnections = {
    R15 = {
        {"Head", "UpperTorso"},
        {"UpperTorso", "LowerTorso"},
        {"LowerTorso", "LeftUpperLeg"},
        {"LowerTorso", "RightUpperLeg"},
        {"LeftUpperLeg", "LeftLowerLeg"},
        {"LeftLowerLeg", "LeftFoot"},
        {"RightUpperLeg", "RightLowerLeg"},
        {"RightLowerLeg", "RightFoot"},
        {"UpperTorso", "LeftUpperArm"},
        {"UpperTorso", "RightUpperArm"},
        {"LeftUpperArm", "LeftLowerArm"},
        {"LeftLowerArm", "LeftHand"},
        {"RightUpperArm", "RightLowerArm"},
        {"RightLowerArm", "RightHand"}
    },
    R6 = {
        {"Head", "Torso"},
        {"Torso", "Left Arm"},
        {"Torso", "Right Arm"},
        {"Torso", "Left Leg"},
        {"Torso", "Right Leg"}
    }
}

function ESP:updateComponents(components, character, player)
    local hrp = character:FindFirstChild("HumanoidRootPart")
    local humanoid = character:FindFirstChild("Humanoid")

    if hrp and humanoid then
        local hrpPosition, onScreen = Camera:WorldToViewportPoint(hrp.Position)
        local mousePosition = Camera:WorldToViewportPoint(LocalPlayer:GetMouse().Hit.p)

        if onScreen then
            local screenWidth, screenHeight = Camera.ViewportSize.X, Camera.ViewportSize.Y
            local factor = 1 / (hrpPosition.Z * math.tan(math.rad(Camera.FieldOfView * 0.5)) * 2) * 100
            local width, height = math.floor(screenHeight / 25 * factor), math.floor(screenWidth / 27 * factor)
            local distanceFromPlayer = math.floor((LocalHumanoidRootPart.Position - hrp.Position).magnitude)
-- Box properties
            components.Box.Size = Vector2.new(width, height)
            components.Box.Position = Vector2.new(hrpPosition.X - width / 2, hrpPosition.Y - height / 2)
            components.Box.Visible = true

            -- Tracer properties
            components.Tracer.From = Vector2.new(mousePosition.X, mousePosition.Y)
            components.Tracer.To = Vector2.new(hrpPosition.X, hrpPosition.Y + height / 2)
            components.Tracer.Visible = true

            -- Distance label properties
            components.DistanceLabel.Text = string.format("[%dM]", distanceFromPlayer)
            components.DistanceLabel.Position = Vector2.new(hrpPosition.X, hrpPosition.Y + height / 2 + 15)
            components.DistanceLabel.Visible = true

            -- Name label properties
            components.NameLabel.Text = string.format("[%s]", player.Name)
            components.NameLabel.Position = Vector2.new(hrpPosition.X, hrpPosition.Y - height / 2 - 15)
            components.NameLabel.Visible = true

            -- Health bar properties
            local healthBarHeight = height
            local healthBarWidth = 5
            local healthFraction = humanoid.Health / humanoid.MaxHealth

            components.HealthBar.Outline.Size = Vector2.new(healthBarWidth, healthBarHeight)
            components.HealthBar.Outline.Position = Vector2.new(components.Box.Position.X - healthBarWidth - 2, components.Box.Position.Y)
            components.HealthBar.Outline.Visible = true

            components.HealthBar.Health.Size = Vector2.new(healthBarWidth - 2, healthBarHeight * healthFraction)
            components.HealthBar.Health.Position = Vector2.new(components.HealthBar.Outline.Position.X + 1, components.HealthBar.Outline.Position.Y + healthBarHeight * (1 - healthFraction))
            components.HealthBar.Health.Visible = true

            -- Item label properties
            local backpack = player.Backpack
local tool = backpack:FindFirstChildOfClass("Tool") or character:FindFirstChildOfClass("Tool")
            if tool then
                components.ItemLabel.Text = string.format("[Holding: %s]", tool.Name)
            else
                components.ItemLabel.Text = "[Holding: No tool]"
            end
            components.ItemLabel.Position = Vector2.new(hrpPosition.X, hrpPosition.Y + height / 2 + 35)
            components.ItemLabel.Visible = true

            -- Skeleton properties
            local connections = bodyConnections[humanoid.RigType.Name] or {}
            for _, connection in ipairs(connections) do
                local partA = character:FindFirstChild(connection[1])
                local partB = character:FindFirstChild(connection[2])
                if partA and partB then
                    local line = components.SkeletonLines[connection[1] .. "-" .. connection[2]] or self:createDrawing("Line", {Thickness = 1, Color = Color3.fromRGB(255, 255, 255)})
                    local posA, onScreenA = Camera:WorldToViewportPoint(partA.Position)
                    local posB, onScreenB = Camera:WorldToViewportPoint(partB.Position)
                    if onScreenA and onScreenB then
                        line.From = Vector2.new(posA.X, posA.Y)
                        line.To = Vector2.new(posB.X, posB.Y)
                        line.Visible = true
                        components.SkeletonLines[connection[1] .. "-" .. connection[2]] = line
                    else
                        line.Visible = false
                    end
                end
            end
        else
            self:hideComponents(components)
        end
    else
        self:hideComponents(components)
    end
end

function ESP:hideComponents(components)
    components.Box.Visible = false
    components.Tracer.Visible = false
    components.DistanceLabel.Visible = false
    components.NameLabel.Visible = false
    components.HealthBar.Outline.Visible = false
    components.HealthBar.Health.Visible = false
    components.ItemLabel.Visible = false

    for _, line in pairs(components.SkeletonLines) do
        line.Visible = false
    end
end

function ESP:removeEsp(player)
    local components = self.espCache[player]
    if components then
        components.Box:Remove()
        components.Tracer:Remove()
        components.DistanceLabel:Remove()
        components.NameLabel:Remove()
        components.HealthBar.Outline:Remove()
        components.HealthBar.Health:Remove()
        components.ItemLabel:Remove()
        for _, line in pairs(components.SkeletonLines) do
            line:Remove()
        end
        self.espCache[player] = nil
    end
end

local espInstance = ESP.new()

RunService.RenderStepped:Connect(function()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local character = player.Character
            if character then
                if not espInstance.espCache[player] then
                    espInstance.espCache[player] = espInstance:createComponents()
                end
                espInstance:updateComponents(espInstance.espCache[player], character, player)
            else
                if espInstance.espCache[player] then
                    espInstance:hideComponents(espInstance.espCache[player])
                end
            end
        end
    end
end)

Players.PlayerRemoving:Connect(function(player)
    espInstance:removeEsp(player)
end)
   end,
})

local tab1Tab = Window:CreateTab("Bloxfruit", 18372809038) -- Title, Image

local Section = tab1Tab:CreateSection("BloxFruit script")

local Button = tab1Tab:CreateButton({
   Name = "BKHAX HUB",
   Callback = function()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/koonpeatch/PeatEX/master/BKHAX/BloxFruits"),true))()
   end,
})

local Button = tab1Tab:CreateButton({
   Name = "PeatEX",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/PerdHub/Blosfruitscript/main/PerdLoader"))()
   end,
})

local Button = tab1Tab:CreateButton({
   Name = "Fiend HUB",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Fiend1sh/FiendMain/main/FiendMainLoader", true))()
   end,
})

local Button = tab1Tab:CreateButton({
   Name = "Matsune HUB V2",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SkibidiSupremacy/Loader.xyz/main/Loader.Blurk%20ST%20%3A%20G"))()
   end,
})

local Button = tab1Tab:CreateButton({
   Name = "YagoX HUB",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/pokelok/yagoX/main/main"))()
   end,
})

local tab2Tab = Window:CreateTab("Fling things and people", 18372809038) -- Title, Image

local Section = tab2Tab:CreateSection("Fling things and people script")

local Section = tab2Tab:CreateSection("HUB")

local Button = tab2Tab:CreateButton({
   Name = "Fling things and people | Bliz_T HUB",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BlizTBr/scripts/main/FTAP.lua"))()
   end,
})

local Section = tab2Tab:CreateSection("Server lag | Key is SG-BestClan")

local Button = tab2Tab:CreateButton({
   Name = "Server lag",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Oxwoey/vexeksSG/d807962787f2a647e55762837812ff897e7ce070/oxwoey.lua"))()
   end,
})

local tab3Tab = Window:CreateTab("Prison Life", 18372809038) -- Title, Image

local Section = tab3Tab:CreateSection("Prison Life script")

local Button = tab3Tab:CreateButton({
   Name = "PRISONWARE V1.3",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/PRISONWARE_v1.3.txt"))()
   end,
})

local Button = tab3Tab:CreateButton({
   Name = "Prison Breaker HuB V7.2",
   Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/HelloRobloxSalt/SCRIPTS/main/V7.2'))()
   end,
})

local Section = tab3Tab:CreateSection("Admin")

local Button = tab3Tab:CreateButton({
   Name = "Prison Admib HuB",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Juanko-Scripts/Roblox-scripts/main/Prision%20Admin%20Hub%20irufwjskwidiuxejw8uddjjwjdnnwjwjdbb"))()
   end,
})

local Section = tab3Tab:CreateSection("Fe")

local Button = tab3Tab:CreateButton({
   Name = "Fe Bypass Gui",
   Callback = function()
        loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\103\48\48\108\88\112\108\111\105\116\101\114\47\103\48\48\108\88\112\108\111\105\116\101\114\47\109\97\105\110\47\70\101\37\50\48\98\121\112\97\115\115\34\44\32\116\114\117\101\41\41\40\41\10")()
   end,
})

local tab4Tab = Window:CreateTab("AutoPiano", 18372809038) -- Title, Image

local Section = tab4Tab:CreateSection("Piano script")

local Button = tab4Tab:CreateButton({
   Name = "Auti Piano",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JxcExploit/Sad/main/NoKey"))()
   end,
})

local tab5Tab = Window:CreateTab("Evade", 18372809038) -- Title, Image

local Section = tab5Tab:CreateSection("Evade script")

local Button = tab5Tab:CreateButton({
   Name = "King HuB",
   Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/zReal-King/Evade/main/Main.lua'))()
   end,
})

local Button = tab5Tab:CreateButton({
   Name = "Tbao143 hUb",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubEvade"))()
   end,
})

local tab6Tab = Window:CreateTab("Blade Ball", 18372809038) -- Title, Image

local Section = tab6Tab:CreateSection("Blade Ball script")

local Button = tab6Tab:CreateButton({
   Name = "FFJ HUB",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/BladeBallV3.lua"))()
   end,
})

local Button = tab6Tab:CreateButton({
   Name = "Visual",
   Callback = function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/0aefed07fd25b2369e282001ca3c2838.lua"))()
   end,
})

local Button = tab6Tab:CreateButton({
   Name = "Nurysium Hub",
   Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/flezzpe/Nurysium/main/nury_source.lua'))
   end,
})

local tab6Tab = Window:CreateTab("Slap battle", 18372809038) -- Title, Image

local Section = tab6Tab:CreateSection("Slap battle script")

local Button = tab6Tab:CreateButton({
   Name = "Slap Battles hub that exists",
   Callback = function()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Slap%20Battles")))()
   end,
})

local tab7Tab = Window:CreateTab("Brook Haven", 18372809038) -- Title, Image

local Section = tab7Tab:CreateSection("Brool Hacen script")

local Button = tab7Tab:CreateButton({
   Name = "Sander Hub",
   Callback = function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/sXPiterXs1111/9dc6d9529c1e983a0fa2e3b687aaf0a7/raw/183fb20a34a37cd66597bf69251af54f962dbe3f/sanderhub.lua"))() 
   end,
})

local tab8Tab = Window:CreateTab("Arsenal", 18372809038) -- Title, Imagelocal tab8Tab = Window:CreateTab("", 4483362458) -- Title, Image

local Section = tab8Tab:CreateSection("Arsenal script")

local Button = tab8Tab:CreateButton({
   Name = "Thunder Client Lite",
   Callback = function()
        -- StarterGui内にScreenGuiを追加
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- ButtonをScreenGui内に追加
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 200, 0, 50)  -- サイズを設定
button.Position = UDim2.new(0, 10, 0.5, -25)  -- 画面左側に配置
button.Text = "クリックしてスクリプトを実行"
button.Parent = screenGui

-- レインボーカラーのアニメーション関数
local function rainbowText()
    while true do
        for hue = 0, 1, 0.01 do
            local color = Color3.fromHSV(hue, 1, 1)
            button.TextColor3 = color
            wait(0.05)
        end
    end
end

-- レインボーカラーアニメーションを開始
spawn(rainbowText)

-- ボタンのクリックイベントを設定
button.MouseButton1Click:Connect(function()
    print("ボタンがクリックされました。スクリプトを実行します。")
    
    -- 指定されたURLからスクリプトを取得して実行
    local scriptUrl = "https://api.luarmor.net/files/v3/loaders/b95e8fecdf824e41f4a030044b055add.lua"
    local response = game:HttpGet(scriptUrl)
    
    -- スクリプトを実行
    local loadFunction, errorMessage = loadstring(response)
    if loadFunction then
        loadFunction()
        print("スクリプトが正常に実行されました。")
    else
        warn("スクリプトの実行中にエラーが発生しました: " .. errorMessage)
    end
end)

   end,
})

local Button = tab8Tab:CreateButton({
	Name = "CAS HUB",
	Callback = function()
	    loadstring(game:HttpGet("https://raw.githubusercontent.com/cris123452/my/main/cas",true))()
	end,
 })

 local Button = tab8Tab:CreateButton({
	Name = "QP HUB",
	Callback = function()
	    loadstring(game:HttpGet("https://raw.githubusercontent.com/QPScript/Script/main/Arsenal.txt"))()
	end,
 })

 local Button = tab8Tab:CreateButton({
	Name = "AirHuB",
	Callback = function()
	    loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/AirHub/main/AirHub.lua"))()
	end,
 })

local tab9Tab = Window:CreateTab("Zombie attack", 18372809038) -- Title, Image

local Section = tab9Tab:CreateSection("Zombie attack script")

local Button = tab9Tab:CreateButton({
   Name = "ski hub",
   Callback = function()
        loadstring(game:HttpGet(("https://pastebin.com/raw/mT10xnt7"), true))()
   end,
})

local Button = tab9Tab:CreateButton({
   Name = "VoidzHUB",
   Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/RTrade/Voidz/main/Games.lua'),true))()
   end,
})

local tab10Tab = Window:CreateTab("BedWars", 18372809038) -- Title, Image

local Section = tab10Tab:CreateSection("BedWars script")

local Button = tab10Tab:CreateButton({
   Name = "icecat v2",
   Callback = function()
        loadstring(game:HttpGet(('https://github.com/Baconontop/bedwarsV2/raw/main/IcecatBedwars'),true))()
   end,
})

local Button = tab10Tab:CreateButton({
   Name = "Flame X V2",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FlamingDrey/Flame-X-v2/main/Flame%20X%20Bedwars%20V2"))()
   end,
})

local Button = tab10Tab:CreateButton({
   Name = "Autumn",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/0x0xLol/Autumn/main/MainScript.lua", true))()
   end,
})

local tab11Tab = Window:CreateTab("DOORS", 18372809038) -- Title, Image

local Section = tab11Tab:CreateSection("DOOR Script")

local Button = tab11Tab:CreateButton({
	Name = "FFJ HUB",
	Callback = function()
	    loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/Loader.lua"))()
	end,
 })

 local Button = tab11Tab:CreateButton({
	Name = "Doors HUB",
	Callback = function()
	    loadstring(game:HttpGet("https://pastebin.com/raw/M4mpGErb",true))()
	end,
 })

 local tab12Tab = Window:CreateTab("Bee Swarm Simulater", 18372809038) -- Title, Image

 local Section = tab12Tab:CreateSection("Bee Swarm Simulater Script")

 local Button = tab12Tab:CreateButton({
	Name = "Histy HUB",
	Callback = function()
	    loadstring(game:HttpGet("https://raw.githubusercontent.com/Historia00012/HISTORIAHUB/main/BSS%20FREE"))()
	end,
 })

 local tab13Tab = Window:CreateTab("Big Paintball", 18372809038) -- Title, Image

 local Section = tab13Tab:CreateSection("Big PaintBall")

 local Button = tab13Tab:CreateButton({
	Name = "ski hub",
	Callback = function()
	    loadstring(game:HttpGet(("https://pastebin.com/raw/mT10xnt7"), true))()
	end,
 })

 local tab14Tab = Window:CreateTab("Auto clicker", 18372809038) -- Title, Image

 local Section = tab14Tab:CreateSection("Auto clicker script")

 local Button = tab14Tab:CreateButton({
	Name = "Auto Cliker",
	Callback = function()
		loadstring(game:HttpGetAsync('https://pastebin.com/raw/WgkcDYUs'))()
	end,
 })
