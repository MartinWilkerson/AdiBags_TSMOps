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
    L["TSMOps"] = "TSMOps"
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

-- The filter itself
local setFilter = addon:RegisterFilter("TSMOps", 99, 'ABEvent-1.0')
setFilter.uiName = L['TSMOps']
setFilter.uiDesc = L['Provide filters for TSM Operations.']

function setFilter:OnInitialize()
    self.db = addon.db:RegisterNamespace('TSMOps', {
        profile = {
            enableMail = true,
        },
        char = {},
    })
end

function setFilter:Update()
    self:SendMessage('AdiBags_FiltersChanged')
end

function setFilter:OnEnable()
    addon:UpdateFilters()
end

function setFilter:OnDisable()
    addon:UpdateFilters()
end

local setNames = {}

function setFilter:Filter(slotData)
    local itemId = slotData.itemId
    local itemString = TSMAPI.Item:ToItemString(itemId)
    
    -- Mailing, Auctioning, Crafting, Shopping, Warehousing
    local operation = TSMAPI.Operations:GetFirstByItem(itemString, 'Mailing')
    if operation then
        return 'TSM:Mailing'
    end
end

function setFilter:GetOptions()
    return {
        enableBoE = {
            name = L['Enable BoE'],
            desc = L['Check this if you want a section for BoE items.'],
            type = 'toggle',
            order = 10,
        },
        enableBoA = {
            name = L['Enable BoA'],
            desc = L['Check this if you want a section for BoA items.'],
            type = 'toggle',
            order = 20,
        },
    }, addon:GetOptionHandler(self, false, function() return self:Update() end)
end
