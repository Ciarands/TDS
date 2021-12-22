-- // Variables
local LocalPlayer = game:GetService("Players").LocalPlayer;
local MainFunction = game:GetService("ReplicatedStorage").RemoteFunction;
local TDS = {};

-- // Functions
function TDS:RemoveTower(Tower)
    local args = {
        [1] = "Inventory",
        [2] = "Execute",
        [3] = "Troops",
        [4] = "Remove",
        [5] = {
            ["Name"] = Tower
        }
    }

    MainFunction:InvokeServer(unpack(args))
end

function TDS:EquipTower(Tower)
    local args = {
        [1] = "Inventory",
        [2] = "Execute",
        [3] = "Troops",
        [4] = "Add",
        [5] = {
            ["Name"] = Tower
        }
    }
    wait()
    MainFunction:InvokeServer(unpack(args))
end

function TDS:FetchTowers()
    local args = {
        [1] = "Profiles",
        [2] = "Download",
        [3] = LocalPlayer
    }

    local Profile = MainFunction:InvokeServer(unpack(args))
    return Profile.Troops
end

function TDS:JoinLobby(Elevator)
    local args = {
        [1] = "Elevators",
        [2] = "Enter",
        [3] = Elevator
}
    MainFunction:InvokeServer(unpack(args))
end

function TDS:LeaveLobby()
    local args = {
        [1] = "Elevators",
        [2] = "Leave"
    }
    MainFunction:InvokeServer(unpack(args))
end

return TDS;