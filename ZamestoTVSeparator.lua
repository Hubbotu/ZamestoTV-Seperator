local ADDON_NAME = ...
local ZamestoSeparator = LibStub("AceAddon-3.0"):NewAddon(ADDON_NAME, "AceEvent-3.0", "AceHook-3.0")
local AceDB = LibStub("AceDB-3.0")
local AceConsole = LibStub("AceConsole-3.0")

local function InitDB()
	local defaults = {
		global = {
			separator = " "
		}
	}
	
	ZamestoSeparator.db = AceDB:New(ADDON_NAME .. "_DB", defaults, true)
end

local function SetupZamestoSeparator()
	LARGE_NUMBER_SEPERATOR = ZamestoSeparator.db.global.separator
end

local function SetupSlashCommands()
	AceConsole:RegisterChatCommand("zam", function (separator)
		if separator ~= "" then
			ZamestoSeparator.db.global.separator = separator
			SetupZamestoSeparator()
		end
	end)
end

function ZamestoSeparator:OnInitialize()
	InitDB()
	self:RegisterEvent("PLAYER_ENTERING_WORLD", SetupZamestoSeparator)
	SetupSlashCommands()
end
