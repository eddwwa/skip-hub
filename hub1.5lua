-- Dependencies
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Skiphub", "Midnight")

-- Game Place ID Validation
local allowedPlaceId = 8657766101 -- The specific place ID for this script

if game.PlaceId ~= allowedPlaceId then
    warn("This script is not authorized for use in this game.")
    return -- Exit the script if the game place ID doesn't match
end

-- ESP Toggle Variables
local espEnabled = false

-- Create ESP Tab
local espTab = Window:NewTab("ESP")
local espSection = espTab:NewSection("ESP Options")

-- Toggle ESP ON
espSection:NewButton("Enable ESP", "Turn on ESP to highlight players", function()
    if espEnabled then
        return -- ESP is already enabled
    end

    espEnabled = true

    -- Start ESP Loop
    game:GetService("RunService").Heartbeat:Connect(function()
        if not espEnabled then return end

        for _, v in pairs(game.Players:GetPlayers()) do
            if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                -- If the player doesn't have ESP
                if not v.Character:FindFirstChild("Totally NOT Esp") then
                    -- Create ESP Highlight
                    local espHighlight = Instance.new("Highlight")
                    espHighlight.Name = "Totally NOT Esp"
                    espHighlight.Adornee = v.Character
                    espHighlight.FillColor = v.TeamColor.Color
                    espHighlight.FillTransparency = 0.5
                    espHighlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    espHighlight.OutlineTransparency = 0
                    espHighlight.Parent = v.Character

                    -- Create ESP Text
                    local icon = Instance.new("BillboardGui")
                    local espText = Instance.new("TextLabel")
                    icon.Name = "Icon"
                    icon.Parent = v.Character
                    icon.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    icon.Active = true
                    icon.AlwaysOnTop = true
                    icon.ExtentsOffset = Vector3.new(0, 1, 0)
                    icon.Size = UDim2.new(0, 200, 0, 50)

                    espText.Name = "ESP Text"
                    espText.Parent = icon
                    espText.BackgroundTransparency = 1
                    espText.Size = UDim2.new(0, 200, 0, 50)
                    espText.Font = Enum.Font.SciFi
                    espText.Text = v.Name
                    espText.TextColor3 = v.TeamColor.Color
                    espText.TextSize = 18
                    espText.TextWrapped = true
                end
            end
        end
    end)

    print("ESP enabled.")
end)

-- Toggle ESP OFF (Disable)
espSection:NewButton("Disable ESP", "Disable the ESP to hide players", function()
    if not espEnabled then
        return -- ESP is already disabled
    end

    espEnabled = false

    -- Remove all ESP highlights and labels
    for _, v in pairs(game.Players:GetPlayers()) do
        if v.Character then
            -- Remove ESP highlight
            local highlight = v.Character:FindFirstChild("Totally NOT Esp")
            if highlight then
                highlight:Destroy()
            end

            -- Remove ESP text
            local billboardGui = v.Character:FindFirstChild("Icon")
            if billboardGui then
                billboardGui:Destroy()
            end
        end
    end

    -- Print status
    print("ESP disabled.")
end)

-- Setup WalkSpeed Tab
local function setupWalkSpeedTab()
    local Tab = Window:NewTab("WalkSpeed")
    local Section = Tab:NewSection("Adjust WalkSpeed")

    Section:NewSlider("WalkSpeed", "Adjust your walking speed", 16, 100, function(value)
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = value
        end
    end)
end
-- Game Place ID Validation
local allowedPlaceId = 8657766101 -- The specific place ID for this script

if game.PlaceId ~= allowedPlaceId then
    warn("This script is not authorized for use in this game.")
    return -- Exit the script if the game place ID doesn't match
end
-- Game Place ID Validation
local allowedPlaceId = 8657766101 -- The specific place ID for this script

if game.PlaceId ~= allowedPlaceId then
    warn("This script is not authorized for use in this game.")
    return -- Exit the script if the game place ID doesn't match
end

-- DEEP MOBILE Tab Creation
local Tab = Window:NewTab("DEEP MOBILE")  -- Assume 'Window' is an existing GUI variable
local Section = Tab:NewSection("Deep Skills")

-- Deep Skills Buttons

Section:NewButton("Ambrosius Slam", "Activate Ambrosius Slam", function()
    game:GetService("ReplicatedStorage").Characters.Deep.Remotes.Slam:FireServer()
end)

Section:NewButton("Wave Rider", "Activate Wave Rider", function()
    game:GetService("ReplicatedStorage").Characters.Deep.Remotes.Surf:FireServer()
end)

Section:NewButton("Sea Brawn Combo Counter", "Activate Sea Brawn Combo Counter", function()
    game:GetService("ReplicatedStorage").Characters.Deep.Remotes.Counter:FireServer()
end)

Section:NewButton("Shark Swarm", "Activate Shark Swarm", function()
    game:GetService("ReplicatedStorage").Characters.Deep.Remotes.SharkPool:FireServer()
end)

Section:NewButton("Deep Thoughts", "Activate Deep Thoughts", function()
    game:GetService("ReplicatedStorage").Characters.Deep.Remotes.DeepThoughts:FireServer()
end)

Section:NewButton("Deep Descent Finisher", "Activate Deep Descent Finisher", function()
    game:GetService("ReplicatedStorage").Characters.Deep.Remotes.Finisher:FireServer()
end)

print("Deep mobile skills are now ready to be activated via buttons.")

-- Keybind Setup for Characters
local function setupCharacterKeybinds()
    -- Jeffrey Keybinds
    local Tab = Window:NewTab("Jeffrey")
    local Section = Tab:NewSection("Skill")

    Section:NewKeybind("Counter", "KeybindInfo", Enum.KeyCode.X, function()
        local character = getCharacter()
        if character and character.Jeffrey and character.Jeffrey:FindFirstChild("CounterActivate") then
            character.Jeffrey.CounterActivate:FireServer()
        else
            warn("Jeffrey's CounterActivate function not found!")
        end
    end)

    Section:NewKeybind("SkullThrow", "KeybindInfo", Enum.KeyCode.C, function()
        local character = getCharacter()
        if character and game:GetService("ReplicatedStorage").Characters.Jeffrey.Remotes then
            game:GetService("ReplicatedStorage").Characters.Jeffrey.Remotes.SkullThrow:FireServer()
        else
            warn("SkullThrow remote not found!")
        end
    end)

    -- Homelander Keybinds
    local Tab2 = Window:NewTab("Homelander")
    local Section2 = Tab2:NewSection("Skill")

    Section2:NewKeybind("Earclap", "KeybindInfo", Enum.KeyCode.G, function()
        local character = getCharacter()
        if character and game:GetService("ReplicatedStorage").Characters.Homelander.Remotes then
            game:GetService("ReplicatedStorage").Characters.Homelander.Remotes.EarClap:FireServer()
        else
            warn("EarClap remote not found!")
        end
    end)

    Section2:NewKeybind("Counter", "KeybindInfo", Enum.KeyCode.H, function()
        local character = getCharacter()
        if character and game:GetService("ReplicatedStorage").Characters.Homelander.Remotes then
            game:GetService("ReplicatedStorage").Characters.Homelander.Remotes.ThrowDown:FireServer()
        else
            warn("ThrowDown remote not found!")
        end
    end)

    Section2:NewKeybind("Milk", "KeybindInfo", Enum.KeyCode.J, function()
        local character = getCharacter()
        if character and character.Homelander and character.Homelander:FindFirstChild("Milk") then
            character.Homelander.Milk:FireServer()
        else
            warn("Homelander's Milk function not found!")
        end
    end)

    -- SpiderMan Keybinds
    local Tab3 = Window:NewTab("Spider Man")
    local Section3 = Tab3:NewSection("Skill")

    Section3:NewKeybind("Counter", "KeybindInfo", Enum.KeyCode.Z, function()
        local character = getCharacter()
        if character and character.SpiderMan and character.SpiderMan:FindFirstChild("CounterActivate") then
            character.SpiderMan.CounterActivate:FireServer()
        else
            warn("SpiderMan's CounterActivate function not found!")
        end
    end)

    Section3:NewKeybind("Counter 2", "KeybindInfo", Enum.KeyCode.X, function()
        local character = getCharacter()
        if character and game:GetService("ReplicatedStorage").Characters.SpiderMan.Remotes then
            game:GetService("ReplicatedStorage").Characters.SpiderMan.Remotes.AndrewDownSlam:FireServer()
        else
            warn("AndrewDownSlam remote not found!")
        end
    end)

    Section3:NewKeybind("Web Bomb", "KeybindInfo", Enum.KeyCode.C, function()
        local character = getCharacter()
        if character and game:GetService("ReplicatedStorage").Characters.SpiderMan.Remotes then
            game:GetService("ReplicatedStorage").Characters.SpiderMan.Remotes.ElectricWebs:FireServer()
        else
            warn("ElectricWebs remote not found!")
        end
    end)

    -- Deep Keybinds (Original)
    local Tab4 = Window:NewTab("Deep")
    local Section4 = Tab4:NewSection("Deep Skills")

    Section4:NewKeybind("Ambrosius Slam", "KeybindInfo", Enum.KeyCode.Z, function()
        game:GetService("ReplicatedStorage").Characters.Deep.Remotes.Slam:FireServer()
    end)

    Section4:NewKeybind("Wave Rider", "KeybindInfo", Enum.KeyCode.X, function()
        game:GetService("ReplicatedStorage").Characters.Deep.Remotes.Surf:FireServer()
    end)

    Section4:NewKeybind("Sea Brawn Combo Counter", "KeybindInfo", Enum.KeyCode.C, function()
        game:GetService("ReplicatedStorage").Characters.Deep.Remotes.Counter:FireServer()
    end)

    Section4:NewKeybind("Shark Swarm", "KeybindInfo", Enum.KeyCode.V, function()
        game:GetService("ReplicatedStorage").Characters.Deep.Remotes.SharkPool:FireServer()
    end)

    Section4:NewKeybind("Deep Thoughts", "KeybindInfo", Enum.KeyCode.B, function()
        game:GetService("ReplicatedStorage").Characters.Deep.Remotes.DeepThoughts:FireServer()
    end)

    Section4:NewKeybind("Deep Descent Finisher", "KeybindInfo", Enum.KeyCode.N, function()
        game:GetService("ReplicatedStorage").Characters.Deep.Remotes.Finisher:FireServer()
    end)
end

-- STEVE Remotes Tab with Keybind
local function setupSTEVEtab()
    local steveTab = Window:NewTab("STEVE Remotes")
    local steveSection = steveTab:NewSection("Toggle STEVE Remotes")

    -- Get services
    local player = game.Players.LocalPlayer
    local repStorage = game:GetService("ReplicatedStorage")
    local char = player.Character

    -- STEVE Keybinds
    steveSection:NewKeybind("TNT", "Activate TNT", Enum.KeyCode.T, function()
        local args = { [1] = player }
        repStorage.Characters.Steve.Remotes.TNT:FireServer(unpack(args))
    end)

    steveSection:NewKeybind("Bow", "Activate Bow", Enum.KeyCode.B, function()
        local args = { [1] = 0.23651869199966313 }
        repStorage.Characters.Steve.Remotes.BowShoot:FireServer(unpack(args))
    end)

    steveSection:NewKeybind("Bow Fire", "Activate Bow Fire", Enum.KeyCode.F, function()
        local args = { [1] = 23.571313560001727 }
        repStorage.Characters.Steve.Remotes.BowShoot:FireServer(unpack(args))
    end)

    steveSection:NewKeybind("Mine", "Activate Mine", Enum.KeyCode.M, function()
        repStorage.Characters.Steve.Remotes.Mine:FireServer()
    end)

    steveSection:NewKeybind("Flint n' Steel", "Activate Flint n' Steel", Enum.KeyCode.F, function()
        local args = { [1] = player }
        repStorage.Characters.Steve.Remotes.FireCounter:FireServer(unpack(args))
    end)

    steveSection:NewKeybind("Block Place", "Place Block", Enum.KeyCode.P, function()
        local args = { [1] = player }
        repStorage.Characters.Steve.Remotes.BlockPlace:FireServer(unpack(args))
    end)
end

-- Deep MOBILE Tab
local function setupDeepMobileTab()
    local deepMobileTab = Window:NewTab("DEEP MOBILE")
    local deepMobileSection = deepMobileTab:NewSection("Deep MOBILE Attacks")

    -- Toggle Attack Variables for Deep Mobile
    local deepMobileAttackEnabled = false

    -- Toggle Deep Mobile Attack
    deepMobileSection:NewToggle("Deep Mobile Attack", "Toggle Deep Mobile's attack", function(state)
        deepMobileAttackEnabled = state
        if deepMobileAttackEnabled then
            print("Deep Mobile attack activated.")
            -- Activate deep mobile attack logic here
        else
            print("Deep Mobile attack deactivated.")
        end
    end)
end

-- Extra Nice Stuff Tab
local function setupExtraStuffTab()
    local extraTab = Window:NewTab("Extra Nice Stuff")
    local extraSection = extraTab:NewSection("Extra Features")

    -- God Mode Toggle
    extraSection:NewButton("God Mode", "Enable God Mode", function()
        if not godModeEnabled then
            godModeEnabled = true
            coroutine.wrap(function()
                while godModeEnabled do
                    game:GetService("ReplicatedStorage").Characters.Quicksilver.Remotes.TimeStop:FireServer(game.Players.LocalPlayer)
                    wait(3)
                end
            end)()
        end
    end)

    -- Disable God Mode
    extraSection:NewButton("Disable God Mode", "Disable God Mode", function()
        godModeEnabled = false
    end)
end

-- Kill All Tab (Separate Tab)
local killTab = Window:NewTab("Kill All")
local killSection = killTab:NewSection("Features")

local players = {}
local playerDropdown
local selectedPlayerName = nil
local killAllEnabled = false
local killSelectedPlayerEnabled = false
local hitCooldown = 0.1
local localPlayer = game.Players.LocalPlayer

-- Function to refresh the player list
local function updateDropdown()
    players = {}
    for _, plr in pairs(game.Players:GetPlayers()) do
        table.insert(players, plr.Name)
    end

    if playerDropdown then
        playerDropdown:Refresh(players)
    else
        playerDropdown = killSection:NewDropdown("Select Player", "Select a player to target", players, function(selectedPlayer)
            selectedPlayerName = selectedPlayer
        end)
    end
end

game.Players.PlayerAdded:Connect(updateDropdown)
game.Players.PlayerRemoving:Connect(updateDropdown)
updateDropdown()

-- Function to kill a player
local function killPlayer(playerName)
    local targetPlayer = game.Players:FindFirstChild(playerName)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local targetHumanoid = targetPlayer.Character:FindFirstChild("Humanoid")
        if targetHumanoid and targetHumanoid.Health > 0 then
            local args = { [1] = targetPlayer.Character }
            game:GetService("ReplicatedStorage").Characters.Combat.Remotes.Combo:FireServer(unpack(args))
        end
    end
end

-- Function to kill all players
local function killAllPlayers()
    killAllEnabled = true
    while killAllEnabled do
        task.wait(hitCooldown)
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= localPlayer then
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local targetHumanoid = player.Character:FindFirstChild("Humanoid")
                    if targetHumanoid and targetHumanoid.Health > 0 then
                        local args = { [1] = player.Character }
                        game:GetService("ReplicatedStorage").Characters.Combat.Remotes.Combo:FireServer(unpack(args))
                    end
                end
            end
        end
    end
end

-- Kill All Buttons
killSection:NewButton("Kill All Players", "Click to kill all players except yourself", function()
    killAllEnabled = true
    killAllPlayers()
end)

killSection:NewButton("Stop Kill All Players", "Click to stop killing all players", function()
    killAllEnabled = false
end)

killSection:NewButton("Start Killing Selected Player", "Click to kill selected player", function()
    if selectedPlayerName then
        killSelectedPlayerEnabled = true
        while killSelectedPlayerEnabled do
            killPlayer(selectedPlayerName)
            task.wait(hitCooldown)
        end
    end
end)

killSection:NewButton("Stop Killing Selected Player", "Click to stop killing selected player", function()
    killSelectedPlayerEnabled = false
end)

killSection:NewButton("Refresh Player List", "Refresh player list dropdown", function()
    updateDropdown()
end)

-- Final Setup for All Tabs
setupWalkSpeedTab()
setupCharacterKeybinds()
setupSTEVEtab()
setupExtraStuffTab()
setupKillAllTab()
setupDeepMobileTab()
setupSTEVEmobileTab()

-- Confirm Script Loaded
print("Skiphub UI is now loaded and ready!")
