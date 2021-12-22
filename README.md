```LUA
getgenv().LegalTotalPlayers = 0; -- Not including yourself
getgenv().LegalMaps = {"Grass Isle"};
getgenv().TowerConfigs = {
    ["Grass Isle"] = {"Accelerator", "Turret", "Military Base", "DJ Booth", "Farm"}
};

loadstring(game:HttpGet("https://raw.githubusercontent.com/Ciarands/TDS/master/main.lua"))();
```