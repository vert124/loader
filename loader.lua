-- Services
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = game:GetService("Players").LocalPlayer

local scriptActive = true -- Controls if progress runs

-- Remove CoreGui elements
local elementsToRemove = {"PlayerList", "Chat", "Microphone", "RobloxGui"}
for _, el in pairs(elementsToRemove) do
	local obj = CoreGui:FindFirstChild(el)
	if obj then pcall(function() obj:Destroy() end) end
end

-- GUI
local Loading = Instance.new("ScreenGui")
Loading.Name = "Loading"
Loading.Parent = CoreGui
Loading.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Loading.ResetOnSpawn = false
Loading.IgnoreGuiInset = true

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = Loading
MainFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0,0,0,0)
MainFrame.Size = UDim2.new(1,0,1,0)

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.2,0,0.2,0)
Title.Size = UDim2.new(0.6,0,0.2,0)
Title.Font = Enum.Font.FredokaOne
Title.Text = "Athena Hub: Duping " .. (_G.brainrot or "")
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.TextScaled = true
Title.TextWrapped = true

local Subtitle = Instance.new("TextLabel")
Subtitle.Name = "Subtitle"
Subtitle.Parent = MainFrame
Subtitle.BackgroundTransparency = 1
Subtitle.Position = UDim2.new(0.2,0,0.35,0)
Subtitle.Size = UDim2.new(0.6,0,0.1,0)
Subtitle.Font = Enum.Font.FredokaOne
Subtitle.Text = "Steal a Brainrot 🧠"
Subtitle.TextColor3 = Color3.fromRGB(255,255,255)
Subtitle.TextScaled = true
Subtitle.TextWrapped = true
Subtitle.TextXAlignment = Enum.TextXAlignment.Center

-- Progress Bar
local Bar = Instance.new("Frame")
Bar.Name = "Bar"
Bar.Parent = MainFrame
Bar.BackgroundColor3 = Color3.fromRGB(40,40,40)
Bar.BorderSizePixel = 0
Bar.Position = UDim2.new(0.22,0,0.76,0)
Bar.Size = UDim2.new(0.56,0,0.036,0)
Instance.new("UICorner", Bar).CornerRadius = UDim.new(0.5,0)

local Bar2 = Instance.new("Frame")
Bar2.Name = "Bar2"
Bar2.Parent = Bar
Bar2.BackgroundColor3 = Color3.fromRGB(60,60,60)
Bar2.BorderSizePixel = 0
Bar2.Size = UDim2.new(0,0,1,0)
Instance.new("UICorner", Bar2).CornerRadius = UDim.new(0.5,0)

local Percentage = Instance.new("TextLabel")
Percentage.Name = "Percentage"
Percentage.Parent = Bar
Percentage.BackgroundTransparency = 1
Percentage.Position = UDim2.new(0.28,0,0.1,0)
Percentage.Size = UDim2.new(0.44,0,0.8,0)
Percentage.Font = Enum.Font.FredokaOne
Percentage.TextColor3 = Color3.fromRGB(255,255,255)
Percentage.TextScaled = true
Percentage.Text = "0%"
Percentage.TextWrapped = true

local Tip = Instance.new("TextLabel")
Tip.Name = "Tip"
Tip.Parent = MainFrame
Tip.BackgroundTransparency = 1
Tip.Position = UDim2.new(0.28,0,0.717,0)
Tip.Size = UDim2.new(0.44,0,0.03,0)
Tip.Font = Enum.Font.FredokaOne
Tip.TextColor3 = Color3.fromRGB(138,138,138)
Tip.TextScaled = true
Tip.Text = "discord.gg/ppGBEpVPv6"
Tip.TextWrapped = true

-- Dots Animation
local Dots = Instance.new("Frame")
Dots.Name = "Dots"
Dots.Parent = MainFrame
Dots.BackgroundTransparency = 1
Dots.Position = UDim2.new(0.47,0,0.82,0)
Dots.Size = UDim2.new(0.06,0,0.03,0)

local function createDot(parent)
	local dot = Instance.new("Frame")
	dot.Parent = parent
	dot.BackgroundColor3 = Color3.fromRGB(40,40,40)
	dot.BorderSizePixel = 0
	dot.Size = UDim2.new(0.16,0,1,0)
	Instance.new("UICorner", dot).CornerRadius = UDim.new(0.5,0)
	local inside = Instance.new("Frame")
	inside.Name = "InsideDot"
	inside.Parent = dot
	inside.AnchorPoint = Vector2.new(0.5,0.5)
	inside.Position = UDim2.new(0.5,0,0.5,0)
	inside.Size = UDim2.new(0,0,0,0)
	inside.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Instance.new("UICorner", inside).CornerRadius = UDim.new(0.5,0)
	return dot
end

local Dot1 = createDot(Dots)
Dot1.Position = UDim2.new(0,0,0,0)
local Dot2 = createDot(Dots)
Dot2.Position = UDim2.new(0.42,0,0,0)
local Dot3 = createDot(Dots)
Dot3.Position = UDim2.new(0.84,0,0,0)

spawn(function()
	local dots = {Dot1.InsideDot, Dot2.InsideDot, Dot3.InsideDot}
	while scriptActive do
		for _, dot in ipairs(dots) do
			dot:TweenSize(UDim2.new(1,0,1,0),"In","Sine",0.25,true)
			wait(0.25)
		end
		for _, dot in ipairs(dots) do
			dot:TweenSize(UDim2.new(0,0,0,0),"In","Sine",0.25,true)
			wait(0.25)
		end
	end
end)

-- Progress Bar Logic
spawn(function()
	local steps = 100
	for i = 1, steps do
		if not scriptActive then break end
		local pct = i/steps
		Bar2.Size = UDim2.new(pct,0,1,0)
		Percentage.Text = math.floor(pct*100).."%"
		local minWait = 0.5
		local maxWait = 8
		local waitTime = minWait + (maxWait-minWait)*(i/steps)
		wait(waitTime)
	end
end)
