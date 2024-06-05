-- Script Developed by KietMaples, 2024

local API = require(game:GetService("ServerScriptService").KietAccessoryAPI)
local ProximityPrompt = script.Parent
local ConfigurationInstance = script.Parent:WaitForChild("Configuration")

local Configuration = {
	GroupLocked = ConfigurationInstance.GroupLocked.Value;
	MinimumRank = ConfigurationInstance.MinimumRank.Value;
	GroupID = ConfigurationInstance.GroupID.Value;
	RemoveHats = ConfigurationInstance.RemoveHats.Value
}

function Equip(player:Player)
	if Configuration.RemoveHats == true then
		API.RemoveHats(player)
	end
	
	for i,v in pairs(API.GetAccessorysInAGiver(script.Parent)) do
		API.EquipAccessoryAndDontRemove(player, v)
	end
end

ProximityPrompt.Triggered:Connect(function(playerWhoTriggered)
	if Configuration.GroupLocked == false then
		Equip(playerWhoTriggered)
	elseif Configuration.GroupLocked == true then
		if playerWhoTriggered:IsInGroup(Configuration.GroupID) then
			if playerWhoTriggered:GetRankInGroup(Configuration.GroupID) > Configuration.MinimumRank then
				Equip(playerWhoTriggered)
			end
		end
	end
end)

script.Parent.Parent.Transparency = 1
