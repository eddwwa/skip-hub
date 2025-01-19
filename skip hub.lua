-- Dependencies
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Skiphub", "Midnight")

-- Game Place ID Validation
local allowedPlaceId = 8657766101 -- The specific place ID for this script

if game.PlaceId ~= allowedPlaceId then
    warn("This script is not authorized for use in this game.")
    return -- Exit the script if the game place ID doesn't match
end

-- Key System Variables
local validKey = "2025!" -- The required key for every execution

-- Prompt for Key GUI
local function requestKey()
    local keyPrompt = Instance.new("ScreenGui")
    local frame = Instance.new("Frame")
    local textBox = Instance.new("TextBox")
    local submitButton = Instance.new("TextButton")
    local label = Instance.new("TextLabel")
    local description = Instance.new("TextLabel") -- Description TextLabel
    local closeButton = Instance.new("TextButton")
    local dragging, dragInput, dragStart, startPos

    -- UI Setup
    keyPrompt.Name = "KeyPrompt"
    keyPrompt.Parent = game.CoreGui

    frame.Size = UDim2.new(0, 300, 0, 200)
    frame.Position = UDim2.new(0.5, -150, 0.5, -100)
    frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    frame.Active = true -- Required for dragging
    frame.Draggable = true -- Enable dragging
    frame.Parent = keyPrompt

    label.Size = UDim2.new(0.7, 0, 0.2, 0)
    label.Position = UDim2.new(0.1, 0, 0.05, 0)
    label.BackgroundTransparency = 1
    label.Text = "Skip HubV1"
    label.TextColor3 = Color3.new(1, 1, 1)
    label.TextScaled = true
    label.Font = Enum.Font.SourceSansBold
    label.Parent = frame

    -- Description Text
    description.Size = UDim2.new(0.9, 0, 0.1, 0)
    description.Position = UDim2.new(0.05, 0, 0.2, 0)
    description.BackgroundTransparency = 1
    description.Text = "I'm gonna change the key when I update, so you need to do the key thing again"
    description.TextColor3 = Color3.new(1, 0, 0) -- Red text
    description.TextScaled = true
    description.Font = Enum.Font.SourceSans
    description.Parent = frame

    closeButton.Size = UDim2.new(0.05, 0, 0.15, 0) -- Smaller "X" button
    closeButton.Position = UDim2.new(0.92, 0, 0.05, 0) -- Positioned slightly to the right
    closeButton.Text = "X"
    closeButton.TextColor3 = Color3.new(1, 0, 0)
    closeButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    closeButton.Font = Enum.Font.SourceSansBold
    closeButton.TextScaled = true
    closeButton.Parent = frame

    textBox.Size = UDim2.new(0.8, 0, 0.3, 0)
    textBox.Position = UDim2.new(0.1, 0, 0.35, 0)
    textBox.PlaceholderText = "Enter Key"
    textBox.Text = ""
    textBox.Parent = frame

    submitButton.Size = UDim2.new(0.8, 0, 0.2, 0)
    submitButton.Position = UDim2.new(0.1, 0, 0.7, 0)
    submitButton.Text = "Submit"
    submitButton.Parent = frame

    -- Dragging Functionality
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)

    -- Close Button Functionality
    closeButton.MouseButton1Click:Connect(function()
        keyPrompt:Destroy()
        warn("Key prompt closed.")
    end)

    local keyValidated = false
    submitButton.MouseButton1Click:Connect(function()
        if textBox.Text == validKey then
            keyValidated = true
            keyPrompt:Destroy()
        else
            textBox.Text = "" -- Clear the text box
            textBox.PlaceholderText = "Invalid Key!"
            warn("Invalid key entered.")
        end
    end)

    -- Wait for key validation
    repeat task.wait() until keyValidated
end

-- Main Key Validation Flow
local function checkKey()
    requestKey()
    print("Key validated! Proceeding with the script...")
end

-- Key Check
checkKey()

-- The rest of the code remains unchanged...

-- Isolated Sections and Keybinds
local function setupJeffreyTab()
    local Tab = Window:NewTab("Jeffrey")
    local Section = Tab:NewSection("Skill")

    Section:NewKeybind("Counter", "KeybindInfo", Enum.KeyCode.X, function()
        local args = {
            [1] = game:GetService("Players").LocalPlayer
        }
        game:GetService("Players").LocalPlayer.Character.Jeffrey.CounterActivate:FireServer(unpack(args))
    end)

    Section:NewKeybind("SkullThrow", "KeybindInfo", Enum.KeyCode.C, function()
        local args = {
            [1] = game:GetService("Players").LocalPlayer
        }
        game:GetService("ReplicatedStorage").Characters.Jeffrey.Remotes.SkullThrow:FireServer(unpack(args))
    end)
end

local function setupHomelanderTab()
    local Tab = Window:NewTab("Homelander")
    local Section = Tab:NewSection("Skill")

    Section:NewKeybind("Earclap", "KeybindInfo", Enum.KeyCode.G, function()
        local args = {
            [1] = game:GetService("Players").LocalPlayer
        }
        game:GetService("ReplicatedStorage").Characters.Homelander.Remotes.EarClap:FireServer(unpack(args))
    end)

    Section:NewKeybind("Counter", "KeybindInfo", Enum.KeyCode.H, function()
        local args = {
            [1] = game:GetService("Players").LocalPlayer
        }
        game:GetService("ReplicatedStorage").Characters.Homelander.Remotes.ThrowDown:FireServer(unpack(args))
    end)

    Section:NewKeybind("Milk", "KeybindInfo", Enum.KeyCode.J, function()
        local args = {
            [1] = game:GetService("Players").LocalPlayer
        }
        game:GetService("Players").LocalPlayer.Character.Homelander.Milk:FireServer(unpack(args))
    end)
end

local function setupSpiderManTab()
    local Tab = Window:NewTab("Spider Man")
    local Section = Tab:NewSection("Skill")

    Section:NewKeybind("Counter", "KeybindInfo", Enum.KeyCode.Z, function()
        local args = {
            [1] = game:GetService("Players").LocalPlayer
        }
        game:GetService("Players").LocalPlayer.Character.SpiderMan.CounterActivate:FireServer(unpack(args))
    end)

    Section:NewKeybind("Counter 2", "KeybindInfo", Enum.KeyCode.X, function()
        local args = {
            [1] = game:GetService("Players").LocalPlayer
        }
        game:GetService("ReplicatedStorage").Characters.SpiderMan.Remotes.AndrewDownSlam:FireServer(unpack(args))
    end)

    Section:NewKeybind("Web Bomb", "KeybindInfo", Enum.KeyCode.C, function()
        local args = {
            [1] = game:GetService("Players").LocalPlayer
        }
        game:GetService("ReplicatedStorage").Characters.SpiderMan.Remotes.ElectricWebs:FireServer(unpack(args))
    end)
end

-- Call the functions to set up tabs
setupJeffreyTab()
setupHomelanderTab()
setupSpiderManTab()
