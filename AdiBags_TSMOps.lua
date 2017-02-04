--[[
AdiBags_Bound - Adds BoE/BoA filters to AdiBags.
Copyright 2010-2015 Kevin (kevin@outroot.com)
All rights reserved.
--]]
local _, ns = ...

local addon = LibStub('AceAddon-3.0'):GetAddon('AdiBags')
--local TSM = LibStub('AceAddon-3.0'):GetAddon('TradeSkillMaster')
local L = setmetatable({}, {__index = addon.L})

do -- Localization
    L["TSM:Mailing"] = "TSMOps:Mailing"
	L["TSM:Auctioning"] = "TSMOps:Auctioning"
	L["TSM:Crafting"] = "TSMOps:Crafting"
	L["TSM:Shopping"] = "TSMOps:Shopping"
	L["TSM:Warehousing"] = "TSMOps:Warehousing"
    L["Provide filters for TSM Operations."] = "Provide filters for TSM Operations."
    
    local locale = GetLocale()
    if locale == "frFR" then
        
	elseif locale == "deDE" then
	
	elseif locale == "esMX" then
	
	elseif locale == "ruRU" then
	
	elseif locale == "esES" then
		
	elseif locale == "zhTW" then
	
	elseif locale == "zhCN" then
		
	elseif locale == "koKR" then
	
	end
end

-- The filters themselves
local tsmModules = {
	Mailing = 99,
	Auctioning = 98,
	Crafting = 98,
	Shopping = 98,
	Warehousing = 98
}

local function updateFilters()
	addon:UpdateFilters()
end

for tsmModule, priority in pairs(tsmModules) do
	local filterName = "TSM:" .. tsmModule
	local setFilter = addon:RegisterFilter(filterName, priority, 'ABEvent-1.0')
	setFilter.uiName = L[filterName]
	setFilter.uiDesc = L['Provide filters for TSM Operations.']

	function setFilter:OnEnable()
		addon:UpdateFilters()
	end
	function setFilter:OnDisable()
		addon:UpdateFilters()
	end
	function setFilter:Filter(slotData)
		local itemId = slotData.itemId
		local itemString = TSMAPI.Item:ToItemString(itemId)
		
		-- Mailing, Auctioning, Crafting, Shopping, Warehousing
		local operation = TSMAPI.Operations:GetFirstByItem(itemString, tsmModule)
		if operation then
			return 'TSM:' .. tsmModule
		end
	end
end


