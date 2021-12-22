-- // User vars
local TowerConfigs = {
    ["Grass Isle"] = {"Accelerator", "Turret", "Military Base", "DJ Booth", "Farm"}
};

-- // Env vars
local LocalPlayer = game:GetService("Players").LocalPlayer;
local TDS = loadstring(game:HttpGet(""))();

-- // Script vars
local MapName;
local OldMapName;
local FoundLobby;
local LobbyTimer;
local EquippedTowers;
local MapPlayerCount;

-- // Functions
local function FindLobby()
    --[[TODO:
    Parse Lobbies --> 
        Register map name for comparrison to account for unexpected changes
        Register player count to acount for user set max legal players
        Register the lobby countdown to output to console
    Match Lobby to listed lobbies
    Add basic criteria checks and join legal lobby
    ]]-- 
end

-- // Script
for i,v in ipairs(Profile.Troops) do
    TDS:RemoveTower(v)
    rconsoleprint("Cleared tower: " .. v .. "\n")
end

for i,v in ipairs(TowerConfigs[MapName]) do
    TDS:EquipTower(v)
end