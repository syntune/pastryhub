    if not game:IsLoaded() then game.Loaded:Wait() end

    print("Game is loaded.")
    game.ReplicatedStorage.B2K:FindFirstChild("4107679d-3b41-4c87-96dd-7fbe6566aa36"):FireServer("E_RANK_HUNTER", 0)
    wait(2)
    game.ReplicatedStorage.B2K:FindFirstChild("4107679d-3b41-4c87-96dd-7fbe6566aa36"):FireServer("E_RANK_HUNTER", 1)
    wait(1)
    game.ReplicatedStorage.B2K:FindFirstChild("f4cd9a60-367a-4407-be6b-bb1ac28900cc"):FireServer()
    queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/syntune/pastryhub/refs/heads/main/77_ZWTLM.lua'))()")
