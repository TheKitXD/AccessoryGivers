-- Script Developed by KietMaples, 2024

local API = require(game:GetService("ServerScriptService").KietAccessoryAPI)
local ProximityPrompt = script.Parent
local ConfigurationInstance = script.Parent:WaitForChild("Configuration")

local Configuration = {
	MinimumRank = ConfigurationInstance.MinimumRank.Value;
	GroupID = ConfigurationInstance.GroupID.Value
}

function Equip(player:Player)
	for i,v in pairs(ProximityPrompt:GetChildren()) do
		if player:GetRoleInGroup(Configuration.GroupID) == v.Name then
			API.EquipClothesAndDontRemove(player, v)
		end
	end
end

ProximityPrompt.Triggered:Connect(function(playerWhoTriggered)
	if playerWhoTriggered:IsInGroup(Configuration.GroupID) then
		if playerWhoTriggered:GetRankInGroup(Configuration.GroupID) > Configuration.MinimumRank then
			Equip(playerWhoTriggered)
		end
	end
end)

script.Parent.Parent.Transparency = 1
