local iconGui = Instance.new("ScreenGui")
iconGui.Name = "TopbarIcons"
iconGui.Parent = game.Players.LocalPlayer.PlayerGui
local iconList = Instance.new("Frame")
iconList.Name = "Icons"
iconList.BackgroundTransparency = 1
iconList.Size = UDim2.new(1, 0, 0, 32)
iconList.Position = UDim2.new(0, 60,0, -32)
iconList.Parent = iconGui
local uiListLayout = Instance.new("UIListLayout")
uiListLayout.FillDirection = Enum.FillDirection.Horizontal
uiListLayout.Padding = UDim.new(0, 12)
uiListLayout.Parent = iconList

local function createIcon()
	local button = Instance.new("TextButton")
	button.Name = "Unnamed"
	button.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
	button.BackgroundTransparency = 0.4
	button.Text = ""
	button.Size = UDim2.new(0, 32,0, 32)
	button.AutoButtonColor = false
	local uiCorner = Instance.new("UICorner")
	uiCorner.CornerRadius = UDim.new(0, 8)
	uiCorner.Parent = button
	local icon = Instance.new("ImageLabel")
	icon.Name = "Icon"
	icon.BackgroundTransparency = 1
	icon.Image = ""
	icon.AnchorPoint = Vector2.new(0.5, 0.5)
	icon.Position = UDim2.new(0.5, 0,0.5, 0)
	icon.Size = UDim2.new(0, 20,0, 20)
	icon.Parent = button
	local iconOverlay = Instance.new("Frame")
	iconOverlay.Name = "IconOverlay"
	iconOverlay.Size = UDim2.new(1, 0,1, 0)
	Instance.new("UICorner", iconOverlay).CornerRadius = UDim.new(0, 8)
	iconOverlay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	iconOverlay.BackgroundTransparency = 1
	iconOverlay.Parent = button

	return button
end

local TopbarIcons = {}

function TopbarIcons.new()
	local icon = createIcon()
	icon.Parent = iconList

	local isButtonSelected = false

	local buttonSelected = Instance.new("BindableEvent")
	local buttonUnselected = Instance.new("BindableEvent")
	local buttonClicked = Instance.new("BindableEvent")

	icon.MouseButton1Click:Connect(function()
		buttonClicked:Fire()
		if isButtonSelected then
			isButtonSelected = false
			buttonUnselected:Fire()
		else
			isButtonSelected = true
			buttonSelected:Fire()
		end
	end)

	icon.MouseEnter:Connect(function()
		icon.IconOverlay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		icon.IconOverlay.BackgroundTransparency = 0.9
	end)

	icon.MouseLeave:Connect(function()
		icon.IconOverlay.BackgroundTransparency = 1
	end)

	icon.MouseButton1Down:Connect(function()
		icon.IconOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		icon.IconOverlay.BackgroundTransparency = 0.7
	end)

	icon.MouseButton1Up:Connect(function()
		icon.IconOverlay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		icon.IconOverlay.BackgroundTransparency = 0.9
	end)

	local functions = {}

	function functions.setImage(imageId)
		icon.Icon.Image = tostring(imageId)
	end
	function functions.forceSelection(boolean)
		isButtonSelected = boolean
	end

	functions.selected = buttonSelected.Event
	functions.deselected = buttonUnselected.Event
	functions.clicked = buttonClicked.Event

	return functions
end

return TopbarIcons
