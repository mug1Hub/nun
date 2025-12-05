local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

coroutine.wrap(function()
    local player = game.Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")

    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = game.CoreGui
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.DisplayOrder = 99999
    screenGui.IgnoreGuiInset = true

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    frame.BackgroundTransparency = 0
    frame.ZIndex = 10000
    frame.Parent = screenGui

    local titleLabel = Instance.new("TextLabel", frame)
    titleLabel.Size = UDim2.new(1, 0, 0.15, 0)
    titleLabel.Position = UDim2.new(0, 0, 0.2, 7.5)
    titleLabel.Text = ""
    titleLabel.TextScaled = true
    titleLabel.Font = Enum.Font.GothamBlack
    titleLabel.TextColor3 = Color3.fromRGB(77, 251, 16) -- Green
    titleLabel.BackgroundTransparency = 1
    titleLabel.ZIndex = 10001

    local function animateTitle(label, text)
        local colors = { Color3.fromRGB(77, 251, 16) } -- Green
        local colorIndex = 1
        while true do
            for i = #text, 1, -1 do
                label.Text = string.sub(text, 1, i) .. "|"
                wait(0.1)
            end
            label.Text = "|"
            wait(0.2)
            label.TextColor3 = colors[colorIndex]
            colorIndex = colorIndex % #colors + 1
            for i = 1, #text do
                label.Text = string.sub(text, 1, i) .. "|"
                wait(0.1)
            end
            label.Text = text
            wait(0.5)
        end
    end

    coroutine.wrap(function()
        animateTitle(titleLabel, "Mugi's HUB")
    end)()

    local progressBarFrame = Instance.new("Frame")
    progressBarFrame.Size = UDim2.new(0, 600, 0, 30)
    progressBarFrame.Position = UDim2.new(0.5, -300, 0.5, 35)
    progressBarFrame.BackgroundTransparency = 0
    progressBarFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    progressBarFrame.BorderSizePixel = 3
    progressBarFrame.BorderColor3 = Color3.fromRGB(77, 251, 16) -- Green
    progressBarFrame.ZIndex = 10001
    progressBarFrame.Parent = screenGui

    local progressBarFrameCorner = Instance.new("UICorner")
    progressBarFrameCorner.CornerRadius = UDim.new(0.35, 0)
    progressBarFrameCorner.Parent = progressBarFrame

    local progressBar = Instance.new("Frame")
    progressBar.Size = UDim2.new(0, 0, 1, 0)
    progressBar.Position = UDim2.new(0, 0, 0, 0)
    progressBar.BackgroundColor3 = Color3.fromRGB(77, 251, 16) -- Green
    progressBar.ZIndex = 10002
    progressBar.Parent = progressBarFrame

    local progressBarCorner = Instance.new("UICorner")
    progressBarCorner.CornerRadius = UDim.new(0.35, 0)
    progressBarCorner.Parent = progressBar

    local percentageLabel = Instance.new("TextLabel")
    percentageLabel.Size = UDim2.new(1, 0, 1, 0)
    percentageLabel.Position = UDim2.new(0, 0, 0, 50)
    percentageLabel.BackgroundTransparency = 1
    percentageLabel.TextColor3 = Color3.fromRGB(77, 251, 16) -- Green
    percentageLabel.Font = Enum.Font.SourceSansBold
    percentageLabel.TextSize = 20
    percentageLabel.Text = "0% Completed"
    percentageLabel.ZIndex = 10003
    percentageLabel.Parent = progressBarFrame

    local startTime = tick()
    local duration = 7

    game:GetService("RunService").Heartbeat:Connect(function()
        if progressBar then
            local elapsed = tick() - startTime
            local progress = math.min(elapsed / duration, 1)
            progressBar.Size = UDim2.new(progress, 0, 1, 0)
            percentageLabel.Text = tostring(math.floor(progress * 100)) .. "% Completed"
        end
    end)

    local welcomeLabel = Instance.new("TextLabel", frame)
    welcomeLabel.Size = UDim2.new(0.8, 0, 0.08, 0)
    welcomeLabel.Position = UDim2.new(0.1, 0, 0.4, 0)
    welcomeLabel.Text = "Loading..."
    welcomeLabel.Font = Enum.Font.GothamBold
    welcomeLabel.TextSize = 32
    welcomeLabel.TextColor3 = Color3.fromRGB(77, 251, 16) -- Green
    welcomeLabel.BackgroundTransparency = 1
    welcomeLabel.ZIndex = 10001

    wait(0.5)
    welcomeLabel.Text = "Detecting Game..."
    wait(1.5)

    local success, productInfo = pcall(function()
        return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
    end)

    if success and productInfo then
        welcomeLabel.Text = "Game Detected: " .. productInfo.Name
    else
        welcomeLabel.Text = "Game Detection Failed."
    end

    wait(1)
    welcomeLabel.Text = "Initializing Script..."
    wait(4)
    screenGui:Destroy()
end)()

local Window = Rayfield:CreateWindow({
   Name = "🔫 TB3 | Script 📃",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Mugi's Script",
   LoadingSubtitle = "By Mugi",
   ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "Xf2YjBxQ", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "🔫 TB3 | Key",
      Subtitle = "Link In Discord Server",
      Note = "Join Server From Main Tab", -- Use this to tell the user how to get a key
      FileName = "TB3Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"mugi1234"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})



uis = game:GetService("UserInputService")
TweenService = game:GetService("TweenService")

existingGui = game.CoreGui:FindFirstChild("CustomScreenGui")
if existingGui then
    existingGui:Destroy()
end

ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CustomScreenGui"
Frame = Instance.new("Frame")
TextButton = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(1, -120, 0, 30)
Frame.Size = UDim2.new(0, 60, 0, 60)

imageLabel = Instance.new("ImageLabel")
imageLabel.Parent = Frame
imageLabel.Size = UDim2.new(1, 0, 1, 0)
imageLabel.Position = UDim2.new(0, 0, 0, 0)
imageLabel.Image = "rbxassetid://113678834527963"
imageLabel.BackgroundTransparency = 1

TextButton.Parent = imageLabel
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 1.000
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Size = UDim2.new(1, 0, 1, 0)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = ""
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 27

function createTextShadow(button)
    shadowOffset = 2
    shadowLabel = Instance.new("TextLabel", Frame)
    shadowLabel.Size = button.Size
    shadowLabel.Position = button.Position + UDim2.new(0, shadowOffset, 0, shadowOffset)
    shadowLabel.Text = button.Text
    shadowLabel.TextScaled = button.TextScaled
    shadowLabel.Font = button.Font
    shadowLabel.BackgroundTransparency = 1
    shadowLabel.TextSize = button.TextSize
    shadowLabel.TextTransparency = 0.5
end

createTextShadow(TextButton)

glowStroke = Instance.new("UIStroke", Frame)
glowStroke.Thickness = 3
glowStroke.Transparency = 0.8
glowStroke.Color = Color3.fromRGB(230,0,0)

gradient = Instance.new("UIGradient", glowStroke)
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(230,0,0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(71,71,71))
}
gradient.Rotation = 45

tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
tweenShowFrame = TweenService:Create(Frame, tweenInfo, {Position = UDim2.new(0.5, 0, 0.3, 0)})

function createGlowEffect(stroke)
    glowTweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
    tween = TweenService:Create(stroke, glowTweenInfo, {Transparency = 0.1, Thickness = 5})
    tween:Play()
end

createGlowEffect(glowStroke)

TextButton.MouseButton1Click:Connect(function()
    Rayfield:SetVisibility(not Rayfield:IsVisible())
end)

function makeDraggable(frame)
    dragging = nil
    dragStart = nil
    startPos = nil
    lastInputChangedConnection = nil

    function beginDrag(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position

            if lastInputChangedConnection then
                lastInputChangedConnection:Disconnect()
            end

            lastInputChangedConnection = uis.InputChanged:Connect(function(newInput)
                if newInput.UserInputType == Enum.UserInputType.MouseMovement or newInput.UserInputType == Enum.UserInputType.Touch then
                    delta = newInput.Position - dragStart
                    frame.Position = UDim2.new(
                        startPos.X.Scale, startPos.X.Offset + delta.X,
                        startPos.Y.Scale, startPos.Y.Offset + delta.Y
                    )
                end
            end)
        end
    end

    function endDrag(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
            if lastInputChangedConnection then
                lastInputChangedConnection:Disconnect()
                lastInputChangedConnection = nil
            end
        end
    end

    frame.InputBegan:Connect(beginDrag)
    frame.InputEnded:Connect(endDrag)

    for _, child in ipairs(frame:GetDescendants()) do
        if child:IsA("GuiObject") then
            child.InputBegan:Connect(beginDrag)
            child.InputEnded:Connect(endDrag)
        end
    end

    uis.InputEnded:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            dragging = false
            if lastInputChangedConnection then
                lastInputChangedConnection:Disconnect()
                lastInputChangedConnection = nil
            end
        end
    end)
end

makeDraggable(Frame)

local HomeTab = Window:CreateTab("🏠 Home")
local HomeSection = HomeTab:CreateSection("Welcome!")


HomeTab:CreateParagraph({Title = "Welcome!", Content = "Thank you for using Mugi's Hub"})

HomeTab:CreateSection("User Information")

local player = game.Players.LocalPlayer
local username = player.Name
HomeTab:CreateLabel("Player: " .. username)

local userId = player.UserId
HomeTab:CreateLabel("User Id: " .. userId)

HomeTab:CreateSection("Game and Executor")

local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
HomeTab:CreateLabel("Game: " .. gameName)

local executor = identifyexecutor and identifyexecutor() or "Unknown Executor"
HomeTab:CreateLabel("Executor: " .. executor)

HomeTab:CreateSection("Hardware")

local function getHWID()
    if syn and syn.request then
        return syn.crypt and syn.crypt.hash or "Synapse HWID Unavailable"
    elseif identifyexecutor and identifyexecutor():lower():find("scriptware") then
        return "ScriptWare HWID is not publicly accessible"
    elseif gethwid then
        return gethwid()
    elseif fluxus and fluxus.gethwid then
        return fluxus.gethwid()
    elseif isexecutorenv and isexecutorenv() then
        return getgenv().KRNL_ID or "KRNL HWID Unavailable"
    end
    return "Not Supported"
end

local hwid = getHWID()
HomeTab:CreateLabel("HWID: " .. hwid)

HomeTab:CreateSection("Date + Time")

local currentDate = os.date("%Y-%m-%d")
HomeTab:CreateLabel("Date: " .. currentDate)

local currentTime = os.date("%H:%M:%S")
HomeTab:CreateLabel("Time: " .. currentTime)

HomeTab:CreateSection("Credits")

HomeTab:CreateButton({
    Name = "Join Discord!", 
    Callback = function()
        if setclipboard then
            setclipboard("https://discord.gg/Xf2YjBxQ")
            print("Copied to clipboard!")
        else
            print("Your executor does not support setclipboard.")
        end

     Rayfield:Notify({
    Title = "Link Copied!",
    Content = "The Discord link has been copied to your clipboard.",
    Duration = 8.5,
    Image = "clipboard",
})   
    end,
})

HomeTab:CreateLabel("Credits: Mugi | 1tz.mugi")

local MainTab = Window:CreateTab("📟 Main")
local MainSection1 = MainTab:CreateSection("Money Vulnerability")

MainTab:CreateParagraph({
    Title = "Infinite Money Guide",
    Content = "Buy Ice Fruitz Ingredients Button below, use the 'Teleport' menu to tp to the 'cookpot', and wait for them to be done then fill pitchers cup. DONT HOLD OUT CUP just press 'Infinite Money' and you now have 990k dirty money. Enjoy!"
})

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local screenGui

function createBlackout()
    return
end

function destroyBlackout()
    -- Disabled by user request.
    return
end

function teleport(x, y, z, destroyAfter)
    createBlackout()

    local seat
    local targetPosition = Vector3.new(-1487.578369140625, 251.75901794433594, -408.8100891113281)

    for _, obj in pairs(workspace["1# Map"].RandomStuff:GetDescendants()) do
        if obj:IsA("Seat") and (obj.Position - targetPosition).Magnitude < 1 then
            seat = obj
            break
        end
    end

    if not seat then
        for _, obj in pairs(workspace["1# Map"].RandomStuff:GetDescendants()) do
            if obj:IsA("Seat") then
                seat = obj
                break
            end
        end
    end

    local character = player.Character
    local rootPart = character and character:FindFirstChild("HumanoidRootPart")
    local humanoid = character and character:FindFirstChild("Humanoid")

    if seat and rootPart and humanoid then
        local originalPosition = seat.CFrame

        seat.CFrame = rootPart.CFrame
        task.wait(0.6)
        seat:Sit(humanoid)
        task.wait(0.6)
        seat.CFrame = CFrame.new(x, y - 1, z)
        task.wait(0.6)
        humanoid.Sit = false
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        task.wait(1e-27)
        seat.CFrame = CFrame.new(originalPosition.X, originalPosition.Y - 100, originalPosition.Z)
    end

    task.wait(0.5)

    if destroyAfter then
        destroyBlackout()
    end
end

function checkSell()
    local backpack = player:WaitForChild("Backpack")
    return backpack:FindFirstChild("Ice-Fruit Cupz") ~= nil
end

MainTab:CreateButton({
    Name = "Dupe Money / Infinite Money",
    Callback = function()
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:FindFirstChild("HumanoidRootPart")

        if not (character and hrp) then return end

        if not checkSell() then
            Rayfield:Notify({
                Title = "Error",
                Content = "You do not have an Ice-Fruit Cupz!",
                Duration = 5,
                Image = 4483345998,
            })
            return
        end

        local originalCFrame = hrp.CFrame
        local sellPart = workspace:FindFirstChild("IceFruit Sell")
        local sellPrompt = sellPart and sellPart:FindFirstChild("ProximityPrompt")
        if not (sellPart and sellPrompt) then return end

        player.Character.Humanoid:EquipTool(player.Backpack:FindFirstChild("Ice-Fruit Cupz"))

        teleport(sellPart.Position.X, sellPart.Position.Y, sellPart.Position.Z, false)
        task.wait(0.2)

        for _ = 1, 2000 do
            pcall(function()
                fireproximityprompt(sellPrompt, 0)
            end)
        end

        task.wait(1)
        teleport(originalCFrame.Position.X, originalCFrame.Position.Y, originalCFrame.Position.Z, true)

        Rayfield:Notify({
            Title = "Success!",
            Content = "Your dirty money has been successfully maxed!",
            Duration = 5,
            Image = 4483345998,
        })
    end
})


local SharedStorage = game.ReplicatedStorage

local function InvokeServer(Remote, ...)
    return Remote:InvokeServer(...)
end

local function FindItem(Item)
    return game.Players.LocalPlayer.Backpack:FindFirstChild(Item) or game.Players.LocalPlayer.Character:FindFirstChild(Item)
end

local function AutoBuySupplies()
    local Items = {
        "Ice-Fruit Bag",
        "Ice-Fruit Cupz",
        "FijiWater",
        "FreshWater",
    }

    for _, item in ipairs(Items) do
        local ItemStock = SharedStorage.ExoticStock:FindFirstChild(item)
        if not ItemStock or ItemStock.Value == 0 then
            warn("Item out of stock:", item)
            return false
        end
    end

    for _, item in ipairs(Items) do
        InvokeServer(SharedStorage.ExoticShopRemote, item)
        task.wait(1.25)
    end

    for _, item in ipairs(Items) do
        if not FindItem(item) then
            warn("Failed to acquire:", item)
            return false
        end
    end

    return true
end

MainTab:CreateButton({
    Name = "Buy Ice Fruitz Items",
    Callback = function()
        local success = AutoBuySupplies()
        if success then
            Rayfield:Notify({
                Title = "AutoBuy",
                Content = "Items purchased successfully!",
                Duration = 5,
                Image = 4483362458,
            })
        else
            Rayfield:Notify({
                Title = "AutoBuy",
                Content = "Failed to purchase items!",
                Duration = 5,
                Image = 4483362458,
            })
        end
    end,
})

local MainSection1 = MainTab:CreateSection("Teleport Dropdown")

MainTab:CreateParagraph({
    Title = "Teleport",
    Content = "Click the drag down menu and tap a hotspot you want to go, then press 'teleport to' to teleport there. Enjoy!"
})

local teleportLocations = {
    {Name = "Bank🏦", Position = Vector3.new(-202.7586, 283.6267, -1222.1841)},
    {Name = "Cash Wash🧺", Position = Vector3.new(-987.11, 253.72, -685.13)},
    {Name = "Penthouse🏡", Position = Vector3.new(-163, 397, -594)},
    {Name = "Penthouse Cook Pot🏠", Position = Vector3.new(-614, 356, -683)},
    {Name = "Apartment🏠", Position = Vector3.new(-613.78, 356.49, -689.02)},
    {Name = "Gunshop 1🔫", Position = Vector3.new(92976.28, 122097.95, 17022.78)},
    {Name = "Gunshop 2🔫", Position = Vector3.new(66192.45, 123615.71, 5744.73)},
    {Name = "Gunshop 3🔫", Position = Vector3.new(72426.18, 128855.64, -1081.06)},
    {Name = "Dealership🚗", Position = Vector3.new(-385.97, 253.41, -1236.36)},
    {Name = "Backpack🎒", Position = Vector3.new(-670.86, 253.60, -682.25)},
    {Name = "Market🛒", Position = Vector3.new(-388.34, 340.34, -562.64)},
    {Name = "Abandoned($$$)🏚️", Position = Vector3.new(-733.03, 286.94, -779.16)},
    {Name = "Studio($$$)🎬", Position = Vector3.new(93428.23, 14484.71, 561.80)},
    {Name = "House 1🏠", Position = Vector3.new(-670, 256, -484)},
    {Name = "House 2🏠", Position = Vector3.new(-647, 256, -485)},
    {Name = "Hospital🏥", Position = Vector3.new(-1590.83, 254.27, 18.92)},
    {Name = "MarGreens🥗", Position = Vector3.new(-336.87, 254.45, -394.18)},
    {Name = "Dollar Central💸", Position = Vector3.new(-393.72, 253.82, -1108.29)},
}

local player = game.Players.LocalPlayer

local function teleport(x, y, z)
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local hrp = character:WaitForChild("HumanoidRootPart")

    humanoid:ChangeState(0)
    repeat task.wait() until not player:GetAttribute("LastACPos")
    hrp.CFrame = CFrame.new(x, y, z)
end

local selectedTeleport = teleportLocations[1]
local locationNames = {}

for _, location in ipairs(teleportLocations) do
    table.insert(locationNames, location.Name)
end

MainTab:CreateDropdown({
    Name = "Select Location",
    Options = locationNames,
    CurrentOption = {locationNames[1]},
    MultipleOptions = false,
    Flag = "TeleportDropdown",
    Callback = function(option)
        for _, location in ipairs(teleportLocations) do
            if location.Name == option[1] then
                selectedTeleport = location
                break
            end
        end
    end
})

MainTab:CreateButton({
    Name = "Teleport To",
    Callback = function()
        if selectedTeleport then
            teleport(selectedTeleport.Position.X, selectedTeleport.Position.Y, selectedTeleport.Position.Z)
        end
    end
})

MainTab:CreateSection("Gun Dupe")

local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
local Players = cloneref(game:GetService("Players"))

local Player = Players.LocalPlayer
local Character, Backpack

local function updateCharacter()
    Character = Player.Character or Player.CharacterAdded:Wait()
    Backpack = Player:WaitForChild("Backpack")
end

updateCharacter()

Player.CharacterAdded:Connect(updateCharacter)

local running = false

local function getPing()
    if typeof(Player.GetNetworkPing) == "function" then
        local success, result = pcall(function()
            return tonumber(string.match(Player:GetNetworkPing(), "%d+"))
        end)
        if success and result then 
            return result 
        end
    end
    local t0 = tick()
    local temp = Instance.new("BoolValue")
    temp.Parent = ReplicatedStorage
    temp.Name = "PingTest_" .. tostring(math.random(10000, 99999))
    task.wait(0.1)
    local t1 = tick()
    temp:Destroy()
    return math.clamp((t1 - t0) * 1000, 50, 300)
end

local function dupeOne()
    local Tool = Character:FindFirstChildOfClass("Tool") or Backpack:FindFirstChildOfClass("Tool")
    if not Tool then return end
    Tool.Parent = Backpack
    task.wait(0.5)

    local ToolName = Tool.Name
    local ToolId
    local delay = 0.25 + ((math.clamp(getPing(), 0, 300) / 300) * 0.03)

    local conn
    conn = ReplicatedStorage.MarketItems.ChildAdded:Connect(function(item)
        if item.Name == ToolName then
            local owner = item:WaitForChild("owner", 2)
            if owner and owner.Value == Player.Name then
                ToolId = item:GetAttribute("SpecialId")
            end
        end
    end)

    task.spawn(function() ReplicatedStorage.ListWeaponRemote:FireServer(ToolName, 99999) end)
    task.wait(delay)
    task.spawn(function() ReplicatedStorage.BackpackRemote:InvokeServer("Store", ToolName) end)
    task.wait(3)
    if ToolId then
        task.spawn(function() ReplicatedStorage.BuyItemRemote:FireServer(ToolName, "Remove", ToolId) end)
    end
    task.spawn(function() ReplicatedStorage.BackpackRemote:InvokeServer("Grab", ToolName) end)
    conn:Disconnect()
end

task.spawn(function()
    while true do
        if running then
            dupeOne()
            task.wait(1.5)
        else
            task.wait(0.1)
        end
    end
end)

MainTab:CreateButton({
    Name = "Dupe Tools",
    Callback = function()
        dupeOne()
    end,
})

local Paragraph = MainTab:CreateParagraph({Title = "Duping", Content = "To dupe your gun, Hold a gun in your hand, press 'Dupe Tool' and itll dupe it. I wouldnt recommend using auto dupe as it can be very buggy, when duping make sure not to have more than 2-3 guns at a time, other than that, Enjoy!"})

MainTab:CreateSection("Auto purchase item")

MainTab:CreateToggle({
    Name = "Auto Dupe Tools",
    CurrentValue = false,
    Flag = "AutoDupeGun",
    Callback = function(Value)
        running = Value
    end,
})

local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()

local function fireGunPrompt(gun)
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local hrp = char.HumanoidRootPart
    plr.Character.Humanoid:ChangeState(0)
    repeat task.wait() until not plr:GetAttribute("LastACPos")
    if gun:IsA("Model") and gun:FindFirstChild("PrimaryPart") then
        hrp.CFrame = gun.PrimaryPart.CFrame + Vector3.new(0, 3, 0)
    elseif gun:IsA("BasePart") then
        hrp.CFrame = gun.CFrame + Vector3.new(0, 3, 0)
    end
    local prompt = gun:FindFirstChildOfClass("ProximityPrompt", true)
    if prompt then
        prompt:InputHoldBegin()
        task.wait(0.1)
        prompt:InputHoldEnd()
    end
end

MainTab:CreateSection("Gun Safe Teleport")

MainTab:CreateParagraph({
    Title = "Safe Options",
    Content = "Press the 'teleport to Closest Safe' to go into a house with a safe nearby, press crouch unitl your out of the cupboard, then walk to the safe, Very Simple"
})

MainTab:CreateButton({
    Name = "Teleport to Closest Safe",
    Callback = function()
        teleport(-159, 295, -1010)
    end,
})

function teleportBypass(x, y, z)
    createBlackout()
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local root = char:FindFirstChild("HumanoidRootPart")
    local humanoid = char:FindFirstChild("Humanoid")
    if not root or not humanoid then return end

    local seat
    local targetPosition = Vector3.new(-1487.578369140625, 251.75901794433594, -408.8100891113281)

    for _, obj in pairs(workspace["1# Map"].RandomStuff:GetDescendants()) do
        if obj:IsA("Seat") and (obj.Position - targetPosition).Magnitude < 1 then
            seat = obj
            break
        end
    end
    if not seat then
        for _, obj in pairs(workspace["1# Map"].RandomStuff:GetDescendants()) do
            if obj:IsA("Seat") then
                seat = obj
                break
            end
        end
    end

    if seat then
        local originalCFrame = seat.CFrame
        seat.CFrame = root.CFrame
        task.wait(0.6)
        seat:Sit(humanoid)
        task.wait(0.6)
        seat.CFrame = CFrame.new(x, y - 1, z)
        task.wait(0.6)
        humanoid.Sit = false
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        task.wait(1e-27)
        seat.CFrame = CFrame.new(originalCFrame.X, originalCFrame.Y - 100, originalCFrame.Z)
    end
    wait(0.5)
    destroyBlackout()
end

local CombatTab = Window:CreateTab("🔫 Combat")
CombatTab:CreateSection("Weapon Modifications")

local Paragraph = CombatTab:CreateParagraph({Title = "Gun Modifications", Content = "If Gun modifications dont work it means your exectuor dont support it!"})

CombatTab:CreateToggle({
    Name = "Instant Equip",
    CurrentValue = false,
    Callback = function(Value)
        local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if tool and tool:FindFirstChild("Setting") then
            local setting = require(tool.Setting)
            if Value then
                setting.Equip = 0
            else
                setting.Equip = 0
            end
        end
    end
})

CombatTab:CreateToggle({
    Name = "Instant Reload",
    CurrentValue = false,
    Callback = function(Value)
        local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if tool and tool:FindFirstChild("Setting") then
            local setting = require(tool.Setting)

            if Value then
                setting.Reload = 0
            else
                setting.Reload = 1.5 
            end
        end
    end
})

CombatTab:CreateToggle({
    Name = "No Jam",
    CurrentValue = false,
    Callback = function(Value)
        local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if tool and tool:FindFirstChild("Setting") then
            local setting = require(tool.Setting)
            if Value then
                setting.Jam = 0
            else
                setting.Jam = 0.1
            end
        end
    end
})

CombatTab:CreateToggle({
    Name = "No Recoil",
    CurrentValue = false,
    Callback = function(Value)
        local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if tool and tool:FindFirstChild("Settings") then
            local settings = require(tool.Settings)
            settings.Recoil = Value and 0 or 1
        end
    end
})

CombatTab:CreateToggle({
    Name = "No Spread",
    CurrentValue = false,
    Callback = function(Value)
        local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if tool and tool:FindFirstChild("Setting") then
            local setting = require(tool.Setting)
            if Value then
                setting.Spread = 0
            else
                setting.Spread = 1
            end
        end
    end
})

CombatTab:CreateToggle({
    Name = "Full Auto",
    CurrentValue = false,
    Callback = function(Value)
        local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if tool and tool:FindFirstChild("Setting") then
            local setting = require(tool.Setting)
            setting.Auto = Value
        end
    end
})

CombatTab:CreateToggle({
    Name = "Infinite Ammo",
    CurrentValue = false,
    Callback = function(Value)
        local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if tool and tool:FindFirstChild("Setting") then
            local setting = require(tool.Setting)
            setting.LimitedAmmoEnabled = not Value
            if Value then
                setting.MaxAmmo = 1000000000000000000000
                setting.AmmoPerMag = 1000000000000000000000
                setting.Ammo = 1000000000000000000000
            end
        end
    end
})

CombatTab:CreateToggle({
    Name = "LifeSteal",
    CurrentValue = false,
    Callback = function(Value)
        local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if tool and tool:FindFirstChild("Setting") then
            local setting = require(tool.Setting)
            if Value then
                setting.LifeSteal = true
            else
                setting.LifeSteal = false
            end
        end
    end
})

CombatTab:CreateToggle({
    Name = "1 Tap",
    CurrentValue = false,
    Callback = function(Value)
        local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if tool and tool:FindFirstChild("Setting") then
            local setting = require(tool.Setting)
            setting.BaseDamage = Value and 9e9 or 25
        end
    end
})

local FarmsTab = Window:CreateTab("🧑‍🌾 Auto Farms") -- Title, Icon
FarmsTab:CreateSection("Enabled")

local camera = workspace.CurrentCamera

function stuidoprompt()
    for _, v in pairs(workspace.StudioPay.Money:GetDescendants()) do
        if v:IsA("ProximityPrompt") and v.Name == "Prompt" then
            v.HoldDuration = 0
            v.RequiresLineOfSight = false
        end
    end
end

local Paragraph = FarmsTab:CreateParagraph({Title = "Auto Farms", Content = "When using Construction Farm, make sure you press 'Q' to auto lock your camera, also if certain buttons don't work then that job is on cool down, Enjoy"})

FarmsTab:CreateToggle({
    Name = "Enable Rob Studio",
    CurrentValue = false,
    Flag = "RobStudioToggle",
    Callback = function(Value)
        local robstudio = Value

        if robstudio then
            local player = game.Players.LocalPlayer
            local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
            if not root or not humanoid then return end

            local originalCFrame = root.CFrame
            stuidoprompt()

            for _, v in pairs(workspace.StudioPay.Money:GetDescendants()) do
                if v:IsA("ProximityPrompt") and v.Name == "Prompt" and v.Enabled then
                    humanoid:ChangeState(0)
                    repeat task.wait() until not player:GetAttribute("LastACPos")

                    root.CFrame = CFrame.new(
                        v.Parent.Position.X,
                        v.Parent.Position.Y + 2,
                        v.Parent.Position.Z
                    )

                    camera.CFrame = CFrame.new(camera.CFrame.Position, v.Parent.Position)
                    task.wait(0.25)

                    repeat
                        task.wait(0.3)
                        fireproximityprompt(v)
                    until v.Enabled == false or not robstudio

                    if not robstudio then break end
                end
            end

            if robstudio then
                root.CFrame = originalCFrame
            end
        end
    end
})

local player = game.Players.LocalPlayer

function teleport(x, y, z)
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoid = char:WaitForChild("Humanoid")
    local root = char:WaitForChild("HumanoidRootPart")

    humanoid:ChangeState(0)
    repeat task.wait() until not player:GetAttribute("LastACPos")
    root.CFrame = CFrame.new(x, y, z)
end

FarmsTab:CreateToggle({
    Name = "Enable Dumpster",
    CurrentValue = false,
    Flag = "LootTrashToggle",
    Callback = function(Value)
        getgenv().loottrash = Value
        if Value then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("ProximityPrompt") and v.Name == "ProximityPrompt" and v.Parent.Name == "DumpsterPromt" then
                    v.HoldDuration = 0
                    v.RequiresLineOfSight = false
                end
            end

            task.spawn(function()
                while getgenv().loottrash do
                    task.wait()
                    for _, v in pairs(workspace:GetDescendants()) do
                        if v:IsA("ProximityPrompt") and v.Name == "ProximityPrompt" and v.Parent.Name == "DumpsterPromt" then
                            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                            if hrp then
                                teleport(v.Parent.Position.X, v.Parent.Position.Y, v.Parent.Position.Z + 3)
                            end
                            workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position,
                                v.Parent.Position)
                            task.wait(0.3)
                            for _ = 1, 10 do fireproximityprompt(v) end
                            task.wait(0.1)
                            if not getgenv().loottrash then break end
                        end
                    end
                end
            end)
        end
    end
})

local autofarmRunning = false
local Players = game:GetService("Players")
local speaker = Players.LocalPlayer

local function getCharacter()
    return speaker.Character or speaker.CharacterAdded:Wait()
end

local function safeTeleport(cf)
    local character = getCharacter()
    local humanoid = character:WaitForChild("Humanoid")
    local hrp = character:WaitForChild("HumanoidRootPart")
    humanoid:ChangeState(0)
    repeat task.wait() until not speaker:GetAttribute("LastACPos")
    hrp.CFrame = cf
end

local function fireProximityPrompt(prompt)
    if prompt and prompt:IsA("ProximityPrompt") then
        fireproximityprompt(prompt)
    end
end

local function startJob()
    safeTeleport(CFrame.new(-1728, 371, -1172))
    task.wait(0.2)
    fireProximityPrompt(workspace.ConstructionStuff["Start Job"]:FindFirstChildOfClass("ProximityPrompt"))
    task.wait(0.5)
end

local function endJob()
    safeTeleport(CFrame.new(-1728, 371, -1172))
    task.wait(0.2)
    fireProximityPrompt(workspace.ConstructionStuff["End Job"]:FindFirstChildOfClass("ProximityPrompt"))
    task.wait(0.5)
end

FarmsTab:CreateToggle({
    Name = "Enable Construction",
    CurrentValue = false,
    Flag = "ConstructionFarmFlag",
    Callback = function(Value)
        autofarmRunning = Value
        if not speaker then return end

        local function getBackpack()
            return speaker:FindFirstChild("Backpack")
        end

        local function hasPlyWood()
            local backpack = getBackpack()
            local character = getCharacter()
            return (backpack and backpack:FindFirstChild("PlyWood")) or
            (character and character:FindFirstChild("PlyWood"))
        end

        local function equipPlyWood()
            local backpack = getBackpack()
            if backpack then
                local plyWood = backpack:FindFirstChild("PlyWood")
                if plyWood then
                    plyWood.Parent = getCharacter()
                end
            end
        end

        local function grabWood()
            safeTeleport(CFrame.new(-1727, 371, -1178))
            task.wait(0.1)

            while autofarmRunning and not hasPlyWood() do
                fireProximityPrompt(workspace.ConstructionStuff["Grab Wood"]:FindFirstChildOfClass("ProximityPrompt"))
                task.wait(0.1)
                equipPlyWood()
            end
        end

        local function buildWall(wallPromptName, wallPosition)
            local prompt = workspace.ConstructionStuff[wallPromptName]:FindFirstChildOfClass("ProximityPrompt")

            while autofarmRunning and prompt and prompt.Enabled do
                safeTeleport(wallPosition)
                task.wait(0.01)
                fireProximityPrompt(prompt)
                task.wait()
                if not hasPlyWood() then
                    grabWood()
                end
            end
        end

        if autofarmRunning then
            startJob()
            task.spawn(function()
                while autofarmRunning do
                    if not hasPlyWood() then
                        grabWood()
                    end

                    buildWall("Wall2 Prompt", CFrame.new(-1705, 368, -1151))
                    buildWall("Wall3 Prompt", CFrame.new(-1732, 368, -1152))
                    buildWall("Wall4 Prompt2", CFrame.new(-1772, 368, -1152))
                    buildWall("Wall1 Prompt3", CFrame.new(-1674, 368, -1166))

                    task.wait(0.1)
                end
            end)
        else
            endJob()
        end
    end
})

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local Camera = workspace.CurrentCamera

function BypassTp(cf)
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoid = char:WaitForChild("Humanoid")
    local root = char:WaitForChild("HumanoidRootPart")

    humanoid:ChangeState(0)
    repeat task.wait() until not player:GetAttribute("LastACPos")
    root.CFrame = cf
end

local Houseleft = {}
local Houseright = {}

local targetPosition = Vector3.new(-615, 254, -695)

function updateDoors()
    table.clear(Houseleft)
    table.clear(Houseright)

    for _, v in pairs(workspace.HouseRobb:GetDescendants()) do
        if (v.Name == "WoodenDoor" or v.Name == "HardDoor") and v:IsA("BasePart") and v:FindFirstChild("ProximityPrompt") then
            if (v.Position - targetPosition).Magnitude <= 10 then
                Houseright[v.Name] = v
            else
                Houseleft[v.Name] = v
            end
        end
    end
end

function HouseRobPrompts()
    for _, v in pairs(workspace.HouseRobb:GetDescendants()) do
        if v:IsA("ProximityPrompt") and v.Name == "ProximityPrompt" then
            v.HoldDuration = 0
            v.RequiresLineOfSight = false
            v.Enabled = false
        end
    end
end

FarmsTab:CreateToggle({
    Name = "Enable Rob House",
    CurrentValue = false,
    Flag = "RobHouseToggle",
    Callback = function(Value)
        RobHouse = Value
        local OldCframe = player.Character.HumanoidRootPart.CFrame

        if RobHouse then
            HouseRobPrompts()
        end

        task.spawn(function()
            while RobHouse do
                task.wait()
                updateDoors()

                if not RobHouse then break end

                if Houseleft["HardDoor"] and Houseleft["HardDoor"].Transparency ~= 1 then
                    for _, v in pairs(Houseleft["HardDoor"]:GetDescendants()) do
                        if v:IsA("ProximityPrompt") and v.Name == "ProximityPrompt" then
                            v.Enabled = true
                            BypassTp(v.Parent.CFrame * CFrame.new(-1.5, 0, 0))
                            Camera.CFrame = CFrame.new(Camera.CFrame.Position, v.Parent.Position)
                            repeat
                                task.wait()
                                fireproximityprompt(v)
                            until Houseleft["HardDoor"].Transparency == 1
                        end
                    end

                    for _, v in pairs(Houseleft["HardDoor"].Parent.Parent:GetDescendants()) do
                        if v:IsA("ProximityPrompt") and v.Name == "ProximityPrompt" then
                            HouseRobPrompts()
                            local targetCFrame = v.Parent.CFrame * CFrame.new(0, 0, -3)
                            BypassTp(targetCFrame)
                            Camera.CFrame = CFrame.new(Camera.CFrame.Position, v.Parent.Position)
                            v.Enabled = true
                            repeat
                                fireproximityprompt(v)
                                task.wait()
                            until v.Parent.Transparency == 1
                            v.Enabled = false
                        end
                    end
                end

                if Houseright["WoodenDoor"] and Houseright["WoodenDoor"].Transparency ~= 1 then
                    for _, v in pairs(Houseright["WoodenDoor"]:GetDescendants()) do
                        if v:IsA("ProximityPrompt") and v.Name == "ProximityPrompt" then
                            v.Enabled = true
                            BypassTp(v.Parent.CFrame * CFrame.new(-1.5, 0, 0))
                            Camera.CFrame = CFrame.new(Camera.CFrame.Position, v.Parent.Position)
                            repeat
                                task.wait()
                                fireproximityprompt(v)
                            until Houseright["WoodenDoor"].Transparency == 1
                        end
                    end

                    for _, v in pairs(Houseright["WoodenDoor"].Parent.Parent:GetDescendants()) do
                        if v:IsA("ProximityPrompt") and v.Name == "ProximityPrompt" then
                            HouseRobPrompts()
                            local targetCFrame = v.Parent.CFrame * CFrame.new(0, 0, -3)
                            BypassTp(targetCFrame)
                            Camera.CFrame = CFrame.new(Camera.CFrame.Position, v.Parent.Position)
                            v.Enabled = true
                            repeat
                                fireproximityprompt(v)
                                task.wait()
                            until v.Parent.Transparency == 1
                            v.Enabled = false
                        end
                    end
                end

                BypassTp(OldCframe)
                break
            end
        end)
    end
})

local player = game.Players.LocalPlayer
local carsFolder = workspace:FindFirstChild("CAR ROBBERY")

local enabled = false
local robConnection

local function teleportToPrompt(prompt)
    if not prompt or not prompt.Parent then return end
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid:ChangeState(0)
    end
    repeat task.wait() until not player:GetAttribute("LastACPos")
    player.Character.HumanoidRootPart.CFrame = prompt.Parent.CFrame + Vector3.new(0, 2, 0)
    task.wait(0.15)
    pcall(function()
        fireproximityprompt(prompt)
    end)
end

local function robAllCars()
    if not carsFolder then return end
    for _, car in ipairs(carsFolder:GetChildren()) do
        local prompts = car:GetDescendants()
        for _, obj in ipairs(prompts) do
            if obj:IsA("ProximityPrompt") then
                teleportToPrompt(obj)
                task.wait(2)
            end
        end
    end
end

local function startAutoRob()
    robAllCars()
    if carsFolder then
        robConnection = carsFolder.ChildAdded:Connect(function(car)
            task.wait(0.3)
            if enabled then
                local prompts = car:GetDescendants()
                for _, obj in ipairs(prompts) do
                    if obj:IsA("ProximityPrompt") then
                        teleportToPrompt(obj)
                        task.wait(2)
                    end
                end
            end
        end)
    end
end

local function stopAutoRob()
    if robConnection then
        robConnection:Disconnect()
        robConnection = nil
    end
end

FarmsTab:CreateToggle({
    Name = "Enable Rob Cars",
    CurrentValue = false,
    Flag = "AutoRobToggle",
    Callback = function(value)
        enabled = value
        if enabled then
            startAutoRob()
        else
            stopAutoRob()
        end
    end
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local camera = workspace.CurrentCamera
local localPlayer = Players.LocalPlayer
local mouse = localPlayer:GetMouse()

local AimbotTab = Window:CreateTab("🤖 Aimbot")
AimbotTab:CreateSection("Enable Wallbang")

getgenv().wallbang = false

AimbotTab:CreateToggle({
    Name = "Enable Wallbang",
    CurrentValue = false,
    Flag = "WallbangToggle",
    Callback = function(Value)
        getgenv().wallbang = Value
    end,
})

function RootPart()
    local char = localPlayer.Character
    return char and char:FindFirstChild("HumanoidRootPart")
end

function CanWallbang(targetPart)
    if getgenv().wallbang then return true end

    local origin = RootPart() and RootPart().Position
    if not origin or not targetPart then return false end

    local direction = (targetPart.Position - origin).Unit * 1000
    local raycastParams = RaycastParams.new()
    raycastParams.FilterDescendantsInstances = {localPlayer.Character}
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

    local rayResult = workspace:Raycast(origin, direction, raycastParams)
    if rayResult and not rayResult.Instance:IsDescendantOf(targetPart.Parent) then
        return false
    end

    return true
end

function AttemptSilentShot(target)
    if not target or not target.Character then return end
    local part = target.Character:FindFirstChild("HumanoidRootPart") or target.Character:FindFirstChild("Head")
    if part and CanWallbang(part) then
        dmg(target, getgenv().selectedBodyPart or "Head", 20)
    end
end

AimbotTab:CreateSection("Enable Aimbot")

local MAX_DISTANCE = 100
local MAX_ANGLE = 45
local aimLockEnabled = false
local lockPartName = "Head"

AimbotTab:CreateToggle({
    Name = "Enable Aimbot",
    CurrentValue = false,
    Callback = function(value)
        aimLockEnabled = value
    end,
})

AimbotTab:CreateSlider({
    Name = "Aimbot Distance",
    Range = {10, 500},
    Increment = 5,
    Suffix = "studs",
    CurrentValue = MAX_DISTANCE,
    Callback = function(value)
        MAX_DISTANCE = value
    end,
})

local function getNearestTarget()
    local nearest = nil
    local shortestDistance = MAX_DISTANCE

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= localPlayer and player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            local targetPart = player.Character:FindFirstChild(lockPartName)
            if humanoid and humanoid.Health > 0 and targetPart then
                local direction = (targetPart.Position - camera.CFrame.Position).Unit
                local angle = math.deg(math.acos(camera.CFrame.LookVector:Dot(direction)))
                local distance = (targetPart.Position - camera.CFrame.Position).Magnitude

                if angle <= MAX_ANGLE and distance < shortestDistance then
                    shortestDistance = distance
                    nearest = targetPart
                end
            end
        end
    end

    return nearest
end

RunService.RenderStepped:Connect(function()
    if aimLockEnabled then
        local target = getNearestTarget()
        if target then
            camera.CFrame = CFrame.new(camera.CFrame.Position, target.Position)
        end
    end
end)

AimbotTab:CreateSection("Enable Hitbox")

local toggleEnabled = false
local hitboxSize = 25

local function ApplyEffect()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= localPlayer and player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
            if humanoid and humanoid.Health > 0 and rootPart and rootPart:IsA("Part") then
                rootPart.Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
                rootPart.Transparency = 0.5
                rootPart.Color = Color3.fromRGB(100, 100, 255)
                rootPart.CanCollide = false
            end
        end
    end
end

local function ResetEffect()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= localPlayer and player.Character then
            local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
            if rootPart and rootPart:IsA("Part") then
                rootPart.Size = Vector3.new(2, 2, 1)
                rootPart.Transparency = 0
                rootPart.Color = Color3.new(1, 1, 1)
                rootPart.CanCollide = true
            end
        end
    end
end

AimbotTab:CreateToggle({
    Name = "Enable Hitbox Expander",
    CurrentValue = false,
    Flag = "ToggleGiant",
    Callback = function(Value)
        toggleEnabled = Value
        if Value then ApplyEffect() else ResetEffect() end
    end,
})

AimbotTab:CreateSlider({
    Name = "Hitbox Multiplier",
    Range = {5, 100},
    Increment = 1,
    Suffix = "px",
    CurrentValue = hitboxSize,
    Flag = "HitboxSize",
    Callback = function(Value)
        hitboxSize = Value
        if toggleEnabled then ApplyEffect() end
    end,
})


AimbotTab:CreateSection("FOV Circle")

local aimCircleRadius = 100
local aimCircleThickness = 2
local circleColor = Color3.fromRGB(128, 0, 128)
local aimCircle = nil
local fovEnabled = false

AimbotTab:CreateColorPicker({
    Name = "FOV Color",
    Color = circleColor,
    Callback = function(Value)
        circleColor = Value
        if aimCircle then aimCircle.Color = circleColor end
    end,
})

local function createAimCircle()
    aimCircle = Drawing.new("Circle")
    aimCircle.Visible = true
    aimCircle.Filled = false
    aimCircle.Color = circleColor
    aimCircle.Thickness = aimCircleThickness
end

RunService.RenderStepped:Connect(function()
    if fovEnabled then
        if not aimCircle then createAimCircle() end
        aimCircle.Position = Vector2.new(mouse.X, mouse.Y + 40)
        aimCircle.Visible = true
        aimCircle.Radius = aimCircleRadius
        aimCircle.Color = circleColor
    elseif aimCircle then
        aimCircle.Visible = false
    end
end)

AimbotTab:CreateToggle({
    Name = "Enable FOV Circle",
    CurrentValue = false,
    Callback = function(Value)
        fovEnabled = Value
        if fovEnabled and not aimCircle then createAimCircle() end
        if not fovEnabled and aimCircle then aimCircle.Visible = false end
    end,
})

AimbotTab:CreateSlider({
    Name = "Radius",
    Range = {50, 500},
    Increment = 10,
    Suffix = "px",
    CurrentValue = aimCircleRadius,
    Callback = function(Value)
        aimCircleRadius = Value
        if aimCircle then aimCircle.Radius = aimCircleRadius end
    end,
})


AimbotTab:CreateSection("Enable Snaplines")

local line = Drawing.new("Line")
line.Color = Color3.new(1, 1, 1)
line.Thickness = 2
line.Transparency = 1
line.Visible = false

local AIM_RADIUS = 30
local snaplineEnabled = false
local snaplineColor = Color3.new(1, 1, 1)

local function getScreenBottomCenter()
    local size = camera.ViewportSize
    return Vector2.new(size.X / 2, size.Y)
end

local function getScreenCenter()
    local size = camera.ViewportSize
    return Vector2.new(size.X / 2, size.Y / 2)
end

local function updateSnapline()
    if not snaplineEnabled then
        line.Visible = false
        return
    end

    local origin = getScreenBottomCenter()
    local screenCenter = getScreenCenter()
    local closestPlayer = nil
    local closestDistance = AIM_RADIUS

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= localPlayer and player.Character and player.Character:FindFirstChild("Head") and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
            local head = player.Character.Head
            local screenPos, onScreen = camera:WorldToViewportPoint(head.Position)

            if onScreen and screenPos.Z > 0 then
                local screenPoint = Vector2.new(screenPos.X, screenPos.Y)
                local distanceFromCenter = (screenPoint - screenCenter).Magnitude

                if distanceFromCenter <= closestDistance then
                    closestDistance = distanceFromCenter
                    closestPlayer = player
                end
            end
        end
    end

    if closestPlayer then
        local headPos, onScreen = camera:WorldToViewportPoint(closestPlayer.Character.Head.Position)
        if onScreen and headPos.Z > 0 then
            line.Visible = true
            line.Color = snaplineColor
            line.From = origin
            line.To = Vector2.new(headPos.X, headPos.Y)
        else
            line.Visible = false
        end
    else
        line.Visible = false
    end
end

RunService.RenderStepped:Connect(updateSnapline)

AimbotTab:CreateToggle({
    Name = "Enable Snaplines",
    CurrentValue = false,
    Flag = "AimSnaplineToggle",
    Callback = function(value)
        snaplineEnabled = value
        if not value then line.Visible = false end
    end
})

AimbotTab:CreateColorPicker({
    Name = "Line Color",
    Color = Color3.new(1, 1, 1),
    Flag = "SnaplineColorPicker",
    Callback = function(color)
        snaplineColor = color
    end
})


AimbotTab:CreateSection("Trigger Bot")

local autoClickEnabled = false
local clickDelay = 0.1

AimbotTab:CreateToggle({
    Name = "Enable Trigger Bot",
    CurrentValue = false,
    Flag = "AutoClickToggle",
    Callback = function(Value)
        autoClickEnabled = Value
    end,
})

AimbotTab:CreateSlider({
    Name = "Trigger Delay",
    Range = {0.01, 1},
    Increment = 0.01,
    Suffix = "%",
    CurrentValue = 0.1,
    Flag = "ClickDelaySlider",
    Callback = function(Value)
        clickDelay = Value
    end,
})

spawn(function()
    while true do
        task.wait()
        if autoClickEnabled and mouse.Target and mouse.Target.Parent:FindFirstChild("Humanoid") and mouse.Target.Parent.Name ~= localPlayer.Name then
            mouse1press()
            task.wait(clickDelay)
            mouse1release()
        end
    end
end)

local MiscTab = Window:CreateTab("🧩 Misc")
local MiscSection = MiscTab:CreateSection("Other")

local camera = workspace.CurrentCamera


local fovEnabled = false
local fovValue = 120


MiscTab:CreateToggle({
   Name = "Feild Of View",
   CurrentValue = true,
   Flag = "EnableFOVToggle",
   Callback = function(Value)
      fovEnabled = Value
      if fovEnabled then
         camera.FieldOfView = fovValue
      else
         camera.FieldOfView = 70 
      end
   end,
})


MiscTab:CreateSlider({
   Name = "Value",
   Range = {70, 120},
   Increment = 1,
   Suffix = "",
   CurrentValue = fovValue,
   Flag = "FOVSlider",
   Callback = function(Value)
      fovValue = Value
      if fovEnabled then
         camera.FieldOfView = fovValue
      end
   end,
})


local MiscSection = MiscTab:CreateSection("Ambient Enable")

local ambientEnabled = false
local currentAmbientColor = Color3.fromRGB(0, 255, 0) 

MiscTab:CreateToggle({
   Name = "Enable Ambient",
   CurrentValue = false,
   Flag = "EnableAmbientToggle",
   Callback = function(Value)
      ambientEnabled = Value
      if ambientEnabled then
         game.Lighting.Ambient = currentAmbientColor
         game.Lighting.OutdoorAmbient = currentAmbientColor
         game.Lighting.Brightness = 5
      else
         game.Lighting.Ambient = Color3.fromRGB(127, 127, 127) -- Default neutral
         game.Lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
         game.Lighting.Brightness = 2
      end
   end,
})


MiscTab:CreateColorPicker({
   Name = "Ambient Color",
   Color = currentAmbientColor,
   Flag = "AmbientColorPicker",
   Callback = function(Color)
      currentAmbientColor = Color
      if ambientEnabled then
         game.Lighting.Ambient = currentAmbientColor
         game.Lighting.OutdoorAmbient = currentAmbientColor
      end
   end,
})

local MiscSection = MiscTab:CreateSection("Fog Enable")

local fogEnabled = false
local currentFogColor = Color3.fromRGB(34, 139, 34) 


MiscTab:CreateToggle({
   Name = "Enable Fog",
   CurrentValue = false,
   Flag = "EnableFogToggle",
   Callback = function(Value)
      fogEnabled = Value
      if fogEnabled then
         game.Lighting.FogColor = currentFogColor
         game.Lighting.FogStart = 0
         game.Lighting.FogEnd = 300
      else
         game.Lighting.FogEnd = 100000 -- Make fog disappear
      end
   end,
})


MiscTab:CreateColorPicker({
   Name = "Fog Color",
   Color = currentFogColor,
   Flag = "FogColorPicker",
   Callback = function(Color)
      currentFogColor = Color
      if fogEnabled then
         game.Lighting.FogColor = currentFogColor
      end
   end,
})

local MiscSection = MiscTab:CreateSection("Saturation Enable")

local Lighting = game:GetService ("Lighting")

local colorCorrection = Instance.new("ColorCorrectionEffect")
colorCorrection.Brightness = 0
colorCorrection.Contrast = 0
colorCorrection.Saturation = 0
colorCorrection.Parent = Lighting

local currentSaturation = 100
local isSaturationEnabled = false


MiscTab:CreateToggle({
    Name = "Enable Saturation",
    CurrentValue = false,
    Flag = "SaturationToggle",
    Callback = function(value)
        isSaturationEnabled = value
        if value then
            colorCorrection.Saturation = currentSaturation / 100
        else
            colorCorrection.Saturation = 0
        end
    end
})


MiscTab:CreateSlider({
    Name = "Value",
    Range = {0, 300},
    Increment = 1,
    Suffix = "",
    CurrentValue = 100,
    Flag = "SaturationLevel",
    Callback = function(value)
        currentSaturation = value
        if isSaturationEnabled then
            colorCorrection.Saturation = value / 100
        end
    end
})

local MiscSection = MiscTab:CreateSection("Enable Time")

local currentTime = 12 

local dayTimeEnabled = false


MiscTab:CreateToggle({
    Name = "Enable Time",
    CurrentValue = false,
    Flag = "DayTimeChangerToggle",
    Callback = function(state)
        dayTimeEnabled = state
        if dayTimeEnabled then
            game.Lighting:SetMinutesAfterMidnight(currentTime * 60)
        end
    end
})


MiscTab:CreateSlider({
    Name = "Value",
    Range = {0, 24},
    Increment = 1,
    Suffix = "h",
    CurrentValue = currentTime,
    Flag = "DayTimeSlider",
    Callback = function(value)
        currentTime = value
        if dayTimeEnabled then
            game.Lighting:SetMinutesAfterMidnight(currentTime * 60)
        end
    end
})

local Lighting = game:GetService("Lighting")

local originalSettings = {
    Brightness = Lighting.Brightness,
    Ambient = Lighting.Ambient,
    OutdoorAmbient = Lighting.OutdoorAmbient,
    FogEnd = Lighting.FogEnd,
    GlobalShadows = Lighting.GlobalShadows,
    EffectsEnabled = {}
}

for _, effect in pairs(Lighting:GetChildren()) do
    if effect:IsA("ColorCorrectionEffect") or effect:IsA("BloomEffect") or effect:IsA("SunRaysEffect") then
        originalSettings.EffectsEnabled[effect] = effect.Enabled
    end
end

MiscTab:CreateToggle({
    Name = "Fullbright",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            
            Lighting.Brightness = 2
            Lighting.Ambient = Color3.new(1, 1, 1)
            Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
            Lighting.FogEnd = 100000
            Lighting.GlobalShadows = false

            for _, effect in pairs(Lighting:GetChildren()) do
                if effect:IsA("ColorCorrectionEffect") or effect:IsA("BloomEffect") or effect:IsA("SunRaysEffect") then
                    effect.Enabled = false
                end
            end
        else
         
            Lighting.Brightness = originalSettings.Brightness
            Lighting.Ambient = originalSettings.Ambient
            Lighting.OutdoorAmbient = originalSettings.OutdoorAmbient
            Lighting.FogEnd = originalSettings.FogEnd
            Lighting.GlobalShadows = originalSettings.GlobalShadows

            for effect, enabled in pairs(originalSettings.EffectsEnabled) do
                if effect and effect.Parent then
                    effect.Enabled = enabled
                end
            end
        end
    end,
})

local MiscSection = MiscTab:CreateSection("Car Mods")

MiscTab:CreateToggle({
    Name = "Infinite Fuel",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            local civCarsFolder = workspace:FindFirstChild("CivCars")
            if civCarsFolder then
                for _, car in pairs(civCarsFolder:GetChildren()) do
                    local fuel = car:FindFirstChild("FUEL")
                    if fuel then
                        fuel:Destroy()
                    end
                end
            else
                warn("CivCars folder not found in workspace")
            end
        end
    end,
})

local speedEnabled = false
local currentSpeed = 100

MiscTab:CreateToggle({
    Name = "Change Speed",
    CurrentValue = false,
    Callback = function(Value)
        speedEnabled = Value

        if speedEnabled then
            local civCarsFolder = workspace:FindFirstChild("CivCars")
            if civCarsFolder then
                for _, car in pairs(civCarsFolder:GetChildren()) do
                    local seat = car:FindFirstChildWhichIsA("VehicleSeat", true)
                    if seat then
                        seat.MaxSpeed = currentSpeed
                    end

                    local speedValue = car:FindFirstChild("Speed") or car:FindFirstChild("MaxSpeed")
                    if speedValue and speedValue:IsA("NumberValue") then
                        speedValue.Value = currentSpeed
                    end
                end
            else
                warn("CivCars folder not found in workspace")
            end
        end
    end,
})

local MiscSection = MiscTab:CreateSection("Extra")


MiscTab:CreateSlider({
    Name = "Speed",
    Range = {0, 1990},
    Increment = 5,
    Suffix = "",
    CurrentValue = currentSpeed,
    Callback = function(Value)
        currentSpeed = Value

        if speedEnabled then
            local civCarsFolder = workspace:FindFirstChild("CivCars")
            if civCarsFolder then
                for _, car in pairs(civCarsFolder:GetChildren()) do
                    local seat = car:FindFirstChildWhichIsA("VehicleSeat", true)
                    if seat then
                        seat.MaxSpeed = currentSpeed
                    end

                    local speedValue = car:FindFirstChild("Speed") or car:FindFirstChild("MaxSpeed")
                    if speedValue and speedValue:IsA("NumberValue") then
                        speedValue.Value = currentSpeed
                    end
                end
            else
                warn("CivCars folder not found in workspace")
            end
        end
    end,
})
