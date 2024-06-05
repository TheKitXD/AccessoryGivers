-- Script Developed by KietMaples, 2024

local module = {}

function module.TagAccessory(accessory:Accessory)
	local BoolValue = Instance.new("BoolValue")
	BoolValue.Name = "AccessoryTag"
	BoolValue.Parent = accessory
end

function module.EquipClothes(player:Player, clothes)
	if player.Character:FindFirstChild("Humanoid") then
		for i,v in pairs(player.Character:GetChildren()) do
			if v:IsA("Shirt") or v:IsA("Pants") or v:IsA("ShirtGraphic") then
				v:Destroy()
			end
		end
		
		for i,v in pairs(clothes:GetChildren()) do
			v.Parent = player.Character
		end
	else
		repeat wait() until player.Character:FindFirstChild("Humanoid")

		module.EquipClothes(player, clothes)
	end
end

function module.EquipClothesAndDontRemove(player:Player, clothes)
	if player.Character:FindFirstChild("Humanoid") then
		for i,v in pairs(player.Character:GetChildren()) do
			if v:IsA("Shirt") or v:IsA("Pants") or v:IsA("ShirtGraphic") then
				v:Destroy()
			end
		end

		for i,v in pairs(clothes:GetChildren()) do
			local x = v:Clone()
			
			x.Parent = player.Character
		end
	else
		repeat wait() until player.Character:FindFirstChild("Humanoid")

		module.EquipClothes(player, clothes)
	end
end

function module.EquipAccessory(player:Player, accessory:Accessory)
	if player.Character:FindFirstChild("Humanoid") then
		local Humanoid:Humanoid = player.Character.Humanoid
		
		if player.Character:FindFirstChild(accessory.Name) then
			player.Character:FindFirstChild(accessory.Name):Destroy()
		else
			for i,v in pairs(accessory:GetChildren()) do
				if v:IsA("BasePart") and v.Anchored == true then
					v.Anchored = false
					v.CanCollide = false
					v.CanQuery = false
				end
			end
			
			Humanoid:AddAccessory(accessory)
		end
	else
		repeat wait() until player.Character:FindFirstChild("Humanoid")
		
		module.EquipAccessory(player, accessory)
	end
end

function module.EquipAccessoryAndDontRemove(player:Player, accessory:Accessory)
	if player.Character:FindFirstChild("Humanoid") then
		local Humanoid:Humanoid = player.Character.Humanoid
		local AccessoryC = accessory:Clone()
		
		if player.Character:FindFirstChild(AccessoryC.Name) then
			player.Character:FindFirstChild(AccessoryC.Name):Destroy()
		else
			for i,v in pairs(AccessoryC:GetChildren()) do
				if v:IsA("BasePart") and v.Anchored == true then
					v.Anchored = false
					v.CanCollide = false
					v.CanQuery = false
				end
			end
			
			Humanoid:AddAccessory(AccessoryC)
		end
	else
		repeat wait() until player.Character:FindFirstChild("Humanoid")

		module.EquipAccessoryAndDontRemove(player, accessory)
	end
end

function module.GetAccessorysInAGiver(giver:BasePart)
	local List = {}
	
	for i,v in pairs(giver:GetChildren()) do
		if v:IsA("Accessory") then
			table.insert(List, v)
		end
	end
	
	return List
end

function module.RemoveHats(player:Player)
	for i,v in pairs(player.Character:GetChildren()) do
		if v:IsA("Hat") or v:IsA("Accessory") then
			if v:FindFirstChild("AccessoryTag") then else
				v:Destroy()
			end
		end
	end
end

function module.RemoveGiverAccessorys(player:Player)
	for i,v in pairs(player.Character:GetChildren()) do
		if v:IsA("Hat") or v:IsA("Accessory") then
			if v:FindFirstChild("AccessoryTag") then
				v:Destroy()
			end
		end
	end
end

return module
