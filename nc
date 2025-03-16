-- Load Kavo UI Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- Create Window
local Window = Library.CreateLib("No Cooldown Hub", "DarkTheme")

-- Get Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

-- Character List from Game
local CharacterNames = {
    "MrFantastic", "DoctorStrange", "2099", "Vecna", "Steve", "Spiderman", "Homelander", "TheFlashCw", 
    "A-Train", "SoldierBoy", "BlackNoir", "Quicksilver", "CombatFolder", "StarLight", "DarthVader", 
    "Steve_H", "Rambo", "Sonic", "Walter", "SpringTrap", "Patrick", "SSB", "Pibby", "Wednesday", 
    "Ghostface", "SCPGuard", "Miles", "Zoom", "Paul", "Michael", "Springbonnie", "OmniMan", "Tate", 
    "Luffy", "Kratos", "Jeffrey", "Joe", "Invincible", "Anakin", "Deep", "Lyle", "Zodiac", "Myers", 
    "Dexter", "FrontMan", "ReverseFlash", "SCP-173", "Iris", "Peacemaker", "Vigilante", "TheBatman", "MoonKnight"
}

-- Variables
local DetectedCharacter = nil
local NoCooldownEnabled = false
local Keybinds = {Enum.KeyCode.One, Enum.KeyCode.Two, Enum.KeyCode.Three, Enum.KeyCode.Four, Enum.KeyCode.Five, Enum.KeyCode.E}
local MoveRemotes = {}

-- Function to Detect Player's Current Character
local function DetectCharacter()
    local character = Player.Character
    if character then
        for _, name in pairs(CharacterNames) do
            if character.Name == name then
                DetectedCharacter = name
                return name
            end
        end
    end
    return nil
end

-- ✅ Function: Enable No Cooldown ONLY When a Move is Pressed
local function EnableNoCooldown(characterName)
    -- Clear previous stored remotes
    MoveRemotes = {}

    local character = ReplicatedStorage.Characters:FindFirstChild(characterName)
    if character and character:FindFirstChild("Remotes") then
        for _, remote in pairs(character.Remotes:GetChildren()) do
            if remote:IsA("RemoteEvent") or remote:IsA("RemoteFunction") then
                table.insert(MoveRemotes, remote) -- Store remotes for triggering later
            end
        end
    else
        warn("⚠️ Character not found or has no remotes: " .. characterName)
    end
end

-- ✅ Function: Detect Key Press and Apply No Cooldown
local function OnKeyPress(input, processed)
    if processed or not NoCooldownEnabled or not DetectedCharacter then return end

    -- Check if the key pressed is a valid move key
    for i, key in pairs(Keybinds) do
        if input.KeyCode == key and MoveRemotes[i] then
            task.spawn(function()
                for j = 1, 5 do -- Adjust how many times it triggers (no cooldown effect)
                    pcall(function()
                        MoveRemotes[i]:FireServer(Player)
                    end)
                    task.wait(0.05) -- Delay between triggers
                end
            end)
        end
    end
end

-- ✅ Function: Disable No Cooldown
local function DisableNoCooldown()
    NoCooldownEnabled = false
    MoveRemotes = {} -- Clear stored move remotes
end

-- Connect Key Press Detection
UserInputService.InputBegan:Connect(OnKeyPress)

-- Create Tabs & Sections
local Tab = Window:NewTab("No Cooldown")
local Section = Tab:NewSection("Cooldown Remover")

-- Dropdown for Character Selection
Section:NewDropdown("Choose a Character", "Select a character to remove cooldowns", CharacterNames, function(Value)
    DetectedCharacter = Value
end)

-- Auto-Detect Character Button
Section:NewButton("Detect My Character", "Automatically detects your current character", function()
    local detected = DetectCharacter()
    if detected then
        DetectedCharacter = detected
        print("✅ Detected Character: " .. detected)
    else
        print("❌ Character detection failed!")
    end
end)

-- ✅ Fixed: No Cooldown Toggle (Triggers Only When a Move is Pressed)
Section:NewToggle("Enable No Cooldown", "Removes cooldown only when you press 1, 2, 3, 4, 5, or E", function(State)
    if State then
        if DetectedCharacter then
            NoCooldownEnabled = true
            EnableNoCooldown(DetectedCharacter)
            print("✅ No Cooldown Enabled for " .. DetectedCharacter)
        else
            print("❌ Select or Detect a character first!")
        end
    else
        DisableNoCooldown()
        print("✅ No Cooldown Disabled")
    end
end)

-- Close Button
Section:NewButton("Close GUI", "Closes the script", function()
    Library:Destroy()
end)
