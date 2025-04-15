local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Remotes = {
	["BossFarm"] = ReplicatedStorage.aJv:FindFirstChild("f8ea5400-f81a-4964-a0a1-c64a18f52f27"),
	["InfNightmare"] = ReplicatedStorage.aJv:FindFirstChild("67d0dfdd-f5a4-4eb6-a985-fe9e03e6e245"),
	["BattleSpeed"] = ReplicatedStorage.aJv:FindFirstChild("d1be8721-efd9-4eba-9592-0231e7255393"),
  ["ClaimBattlepass"] = ReplicatedStorage.aJv:FindFirstChild("14bf0484-eac4-4e6a-84dd-fe82d9baad5c"),
  ["PlaceTeleport"] = ReplicatedStorage.aJv:FindFirstChild("1733a334-afde-4edf-bc8a-623e9650b04e"),
  ["UseItem"] = ReplicatedStorage.aJv:FindFirstChild("2003b10b-6f70-4bba-82a2-098b35b429d2"),
}

local PlaceData = {}
for i,v in pairs(ReplicatedStorage["place_data"]:GetChildren()) do
    table.insert(PlaceData, string.upper(v.Name))
end

if #PlaceData <= 1 then game.Players.LocalPlayer:Kick("Place data corrupted.") end

for i,v in pairs(Remotes) do
	if not v then
		game.Players.LocalPlayer:Kick("Can't find remote: " .. i)
	end
end

local Window = Rayfield:CreateWindow({
   Name = "Pastry Hub | Anime Card Clash",
   Icon = 17454385185, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "please embrace me catherine",
   LoadingSubtitle = "CATHERINE",
   Theme = "AmberGlow", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "ACCrap"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

Rayfield:Notify({
   Title = "fuck grafeno's hub on god",
   Content = "weak ass GUI that even needs key",
   Duration = 6.5,
   Image = 17454385185,
})

local Flute = Instance.new("Sound", game.SoundService)
Flute.SoundId = "rbxassetid://940001545"
Flute.Volume = 1
Flute:Play()

local AutoTab = Window:CreateTab("Auto", 17454385185) -- Title, Image

local RollSection = AutoTab:CreateSection("Rolling")

local AutoRollToggle = AutoTab:CreateToggle({
   Name = "Auto Roll",
   CurrentValue = false,
   Flag = "AutoRoll", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      Remotes["BattleSpeed"]:FireServer("AUTO_ROLL", Value)
   end,
})

local QuickRollToggle = AutoTab:CreateToggle({
   Name = "Quick Roll",
   CurrentValue = false,
   Flag = "QuickRoll", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      Remotes["BattleSpeed"]:FireServer("QUICK_ROLL", Value)
   end,
})

local BattleSection = AutoTab:CreateSection("Battle")

local AutoShadow = false
local AutoShadowToggle = AutoTab:CreateToggle({
   Name = "Auto Raid Shadow Dragon",
   CurrentValue = false,
   Flag = "AutoShadow", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
		AutoShadow = Value
        if Value then
            task.spawn(function()
                while AutoShadow do
                    wait(1)
                    Remotes["BossFarm"]:FireServer("shadow_dragon")
                end
            end)
        end
   end,
})

local AutoEternal = false
local AutoEternalToggle = AutoTab:CreateToggle({
   Name = "Auto Raid Eternal Dragon",
   CurrentValue = false,
   Flag = "AutoEternal", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
		AutoEternal = Value
        if Value then
            task.spawn(function()
                while AutoEternal do
                    wait(1)
                    Remotes["BossFarm"]:FireServer("eternal_dragon")
                end
            end)
        end
   end,
})

local AutoNightmare = false
local AutoNightmareToggle = AutoTab:CreateToggle({
   Name = "Auto Nightmare",
   CurrentValue = false,
   Flag = "AutoNightmare", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
		AutoNightmare = Value
        if Value then
            task.spawn(function()
                while AutoNightmare do
                    wait(1)
                    Remotes["InfNightmare"]:FireServer("nightmare_tower")
                end
            end)
        end
   end,
})

local AutoInfinite = false
local AutoInfiniteToggle = AutoTab:CreateToggle({
   Name = "Auto Infinite",
   CurrentValue = false,
   Flag = "AutoInfinite", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
		AutoInfinite = Value
        if Value then
            task.spawn(function()
                while AutoInfinite do
                    wait(1)
                    Remotes["InfNightmare"]:FireServer("infinite_tower")
                end
            end)
        end
   end,
})

local BackpackSection = AutoTab:CreateSection("Backpack")

local UsageSlider = AutoTab:CreateSlider({
   Name = "Use Amount",
   Range = {1, 100},
   Increment = 1,
   Suffix = "Items",
   CurrentValue = 1,
   Flag = "UseAmount", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        -- err
   end,
})

local AutoSmallCDPotion = false
local AutoSmallCDPotionToggle = AutoTab:CreateToggle({
   Name = "Auto Use Small Cooldown Potion",
   CurrentValue = false,
   Flag = "AutoSmallCDPotion", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
		AutoSmallCDPotion = Value
        if Value then
            task.spawn(function()
                while AutoSmallCDPotion do
                    wait(5)
                    Remotes["UseItem"]:FireServer("small_cooldown_reduction_potion", UsageSlider.CurrentValue)
                end
            end)
        end
   end,
})


local AutoSmallLuckPotion = false
local AutoSmallLuckPotionToggle = AutoTab:CreateToggle({
   Name = "Auto Use Small Luck Potion",
   CurrentValue = false,
   Flag = "AutoSmallLuckPotion", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
		AutoSmallLuckPotion = Value
        if Value then
            task.spawn(function()
                while AutoSmallLuckPotion do
                    wait(5)
                    Remotes["UseItem"]:FireServer("small_luck_potion", UsageSlider.CurrentValue)
                end
            end)
        end
   end,
})

--Auto End--

local TeleportTab = Window:CreateTab("Teleport", 17454385185) -- Title, Image

local PlaceDropdown = TeleportTab:CreateDropdown({
   Name = "Places",
   Options = PlaceData,
   CurrentOption = {"LOBBY"},
   MultipleOptions = false,
   Flag = "PlaceDropdown", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Options)
      Remotes["PlaceTeleport"]:FireServer(Options[1])
   end,
})

--Teleport End--

local MiscTab = Window:CreateTab("Miscellaneous", 17454385185) -- Title, Image

local ClaimBattlepassButton = MiscTab:CreateButton({
   Name = "Claim Battlepass",
   Callback = function()
        Remotes["ClaimBattlepass"]:FireServer()
   end,
})
local BattleSpeedSlider = MiscTab:CreateSlider({
   Name = "Battle Speed",
   Range = {1, 3},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 1,
   Flag = "BattleSpeed", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        Remotes["BattleSpeed"]:FireServer("battle_speed", Value)
   end,
})

--Misc End--


local SettingsTab = Window:CreateTab("Settings", 17454385185) -- Title, Image

local SettingsSection  = SettingsTab:CreateSection("Settings")

local FluteButton = SettingsTab:CreateButton({
   Name = "Flute",
   Callback = function()
        Flute:Play()
   end,
})

local DestroyButton = SettingsTab:CreateButton({
   Name = "Destroy UI",
   Callback = function()
        Rayfield:Destroy()
   end,
})

--Settings End--

Rayfield:LoadConfiguration()
