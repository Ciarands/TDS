repeat wait() until game:IsLoaded()

-- // User vars
local LegalTotalPlayers = getgenv().LegalTotalPlayers;
local TowerConfigs = getgenv().TowerConfigs;
local LegalMaps = getgenv().LegalMaps;

-- // Env vars
local LocalPlayer = game:GetService("Players").LocalPlayer;
local TDS = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ciarands/TDS/master/lobby.lua"))();

-- // Script vars
local MapName;
local OldMapName;
local FoundLobby;
local MapPlayerCount;

-- // Functions
local function ManageLoadout()
    for i,v in ipairs(TDS:FetchTowers()) do
        TDS:RemoveTower(v)
        rconsoleprint("Cleared tower: " .. v .. "\n")
    end
    for i,v in ipairs(TowerConfigs[MapName.Value]) do
        TDS:EquipTower(v)
    end
end

local function FindLobby()
    for i,v in pairs(game:GetService("Workspace").Elevators:GetChildren()) do
        MapName = v.State.Map.Title;
        OldMapName = v.State.Map.Title.Value;
        MapPlayerCount = v.State.Players;
        wait()
        if table.find(LegalMaps, MapName.Value) then
            rconsoleprint("Found Map: " .. MapName.Value .. "\n")
            if MapPlayerCount.Value <= LegalTotalPlayers then
                rconsoleprint("Lobby meets set criteria, attempting to join.\n")
                TDS:JoinLobby(v)
                FoundLobby = true
                ManageLoadout()
                rconsoleprint("Joined lobby sucessfully.\n")
                break
            else
                rconsoleprint("Lobby does not meet set criteria.\n")
            end
        end
    end

    
end

-- // Script
repeat FindLobby(); wait(0.25) until FoundLobby

while wait() do
    if not FoundLobby then 
        FindLobby()
    elseif MapPlayerCount.Value > LegalTotalPlayers + 1 then
        rconsoleprint("Lobby exceeded LegalTotalPlayers criteria.\n")
        TDS:LeaveLobby()
        FoundLobby = false
    elseif MapName.Value ~= OldMapName then
        rconsoleprint("Lobby changed, searching for new lobby.\n")
        FoundLobby = false
    end
end