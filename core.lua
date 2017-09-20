local oUF = bdCore.oUF

local unitframes = CreateFrame("frame",nil,UIParent)
local defaults = {}
local frames = {}

defaults[#defaults+1] = {enablecastbars = {
	type = "checkbox",
	value = true,
	label = "Enable Castbars",
	callback = function() bdCore:triggerEvent("unitframesUpdate") end
}} 

defaults[#defaults+1] = {showtargetbuffs = {
	type = "checkbox",
	value = true,
	label = "Show Target's Buffs",
	callback = function() bdCore:triggerEvent("unitframesUpdate") end
}} 

defaults[#defaults+1] = {tab = {
	type = "tab",
	value = "Player & Target"
}}
defaults[#defaults+1] = {textlocation = {
	type = "dropdown",
	value = "Outside",
	options = {"Outside","Inside"},
	label = "Text Location",
	callback = function() bdCore:triggerEvent("unitframesUpdate") end
}} 
defaults[#defaults+1] = {bufftrackerstyle = {
	type = "dropdown",
	value = "Aurabars",
	options = {"Aurabars","Icons","None"},
	label = "Buff Display Style",
	callback = function() bdCore:triggerEvent("unitframesUpdate") end
}} 
defaults[#defaults+1] = {playertargetwidth = {
	type = "slider",
	value = 280,
	label = "Width",
	step = 2,
	min = 100,
	max = 300,
	callback = function() bdCore:triggerEvent("unitframesUpdate") end
}} 
defaults[#defaults+1] = {playertargetheight = {
	type = "slider",
	value = 20,
	label = "Height",
	step = 2,
	min = 4,
	max = 60,
	callback = function() bdCore:triggerEvent("unitframesUpdate") end
}} 
defaults[#defaults+1] = {playertargetpowerheight = {
	type = "slider",
	value = 4,
	label = "Power height",
	step = 1,
	min = 2,
	max = 10,
	callback = function() bdCore:triggerEvent("unitframesUpdate") end
}}

defaults[#defaults+1] = {castbarheight = {
	type = "slider",
	value = 14,
	label = "Castbar height",
	step = 1,
	min = 6,
	max = 30,
	callback = function() bdCore:triggerEvent("unitframesUpdate") end
}} 
defaults[#defaults+1] = {castbaricon = {
	type = "slider",
	value = 28,
	label = "Castbar Icon Size",
	step = 1,
	min = 6,
	max = 50,
	callback = function() bdCore:triggerEvent("unitframesUpdate") end
}} 
-- Focus
defaults[#defaults+1] = {tab = {
	type = "tab",
	value = "Focus"
}}
defaults[#defaults+1] = {focuswidth = {
	type = "slider",
	value = 240,
	label = "Width",
	step = 2,
	min = 50,
	max = 300,
	callback = function() bdCore:triggerEvent("unitframesUpdate") end
}} 
defaults[#defaults+1] = {focusheight = {
	type = "slider",
	value = 20,
	label = "Height",
	step = 2,
	min = 4,
	max = 40,
	callback = function() bdCore:triggerEvent("unitframesUpdate") end
}} 
defaults[#defaults+1] = {focuscastwidth = {
	type = "slider",
	value = 240,
	label = "Castbar Width",
	step = 2,
	min = 50,
	max = 300,
	callback = function() bdCore:triggerEvent("unitframesUpdate") end
}} 
defaults[#defaults+1] = {focuscastheight = {
	type = "slider",
	value = 20,
	label = "Castar Height",
	step = 2,
	min = 4,
	max = 40,
	callback = function() bdCore:triggerEvent("unitframesUpdate") end
}} 
defaults[#defaults+1] = {focuscasticon = {
	type = "slider",
	value = 30,
	label = "Castbar Icon Height",
	step = 2,
	min = 4,
	max = 60,
	callback = function() bdCore:triggerEvent("unitframesUpdate") end
}} 
defaults[#defaults+1] = {focuspower  = {
	type = "slider",
	value = 2,
	label = "Power height",
	step = 1,
	min = 2,
	max = 10,
	callback = function() bdCore:triggerEvent("unitframesUpdate") end
}} 

-- ToT
defaults[#defaults+1] = {tab = {
	type = "tab",
	value = "Target's Target & Pet"
}}

defaults[#defaults+1] = {targetoftargetwidth = {
	type = "slider",
	value = 120,
	label = "Width",
	step = 2,
	min = 60,
	max = 220,
	callback = function() bdCore:triggerEvent("unitframesUpdate") end
}}
defaults[#defaults+1] = {targetoftargetheight = {
	type = "slider",
	value = 16,
	label = "Height",
	step = 2,
	min = 6,
	max = 30,
	callback = function() bdCore:triggerEvent("unitframesUpdate") end
}}

-- Boss
defaults[#defaults+1] = {tab = {
	type = "tab",
	value = "Boss"
}}
defaults[#defaults+1] = {bossenable = {
	type = "checkbox",
	value = true,
	label = "Enable Boss Frames",
	callback = function() bdCore:triggerEvent("unitframesUpdate") end
}}
defaults[#defaults+1] = {bosswidth = {
	type = "slider",
	value = 120,
	label = "Width",
	step = 2,
	min = 60,
	max = 220,
	callback = function() bdCore:triggerEvent("unitframesUpdate") end
}}
defaults[#defaults+1] = {bossdebuffsize = {
	type = "slider",
	value = 120,
	label = "Debuff Size",
	step = 2,
	min = 10,
	max = 100,
	callback = function() bdCore:triggerEvent("unitframesUpdate") end
}}
defaults[#defaults+1] = {bossheight = {
	type = "slider",
	value = 16,
	label = "Height",
	step = 2,
	min = 6,
	max = 30,
	callback = function() bdCore:triggerEvent("unitframesUpdate") end
}}
defaults[#defaults+1] = {bosspower  = {
	type = "slider",
	value = 4,
	label = "Power height",
	step = 1,
	min = 2,
	max = 10,
	callback = function() bdCore:triggerEvent("unitframesUpdate") end
}} 
if (not bdCore.modules["Auras"]) then
	bdCore:addModule("Auras", bdCore.auraconfig)
end
--[[
if (not bdCore.modules["Aura Whitelist"]) then
	bdCore:addModule("Aura Whitelist", bdCore.whitelistconfig)
end
if (not bdCore.modules["Aura Blacklist"]) then
	bdCore:addModule("Aura Blacklist", bdCore.blacklistconfig)
end
if (not bdCore.modules["Personal Auras"]) then
	bdCore:addModule("Personal Auras", bdCore.personalconfig)
end
--]]
local config = bdCore:addModule("Unit Frames", defaults)
--local config = bdCore.config["Unit Frames"]

local function numberize(v)
	if v <= 9999 then return v end
	if v >= 1000000000 then
		local value = string.format("%.1fb", v/1000000000)
		return value
	elseif v >= 1000000 then
		local value = string.format("%.1fm", v/1000000)
		return value
	elseif v >= 10000 then
		local value = string.format("%.1fk", v/1000)
		return value
	end
end
local function gradient(perc)
	if perc <= 0.5 then
		return 255, perc*510, 0
	else
		return 510 - perc*510, 255, 0
	end
end
local bossframes = {}
local bdframes = {}
local bordersize = bdCore.config.General.border
local bossanchor = CreateFrame("frame", "bdUF Boss Frame Anchor", UIParent)
bossanchor:SetPoint("LEFT", UIParent, "LEFT", 20, 80)
bossanchor:SetSize(200, 50)
bdCore:makeMovable(bossanchor)
--[[
function unitframes:bosscallback()
	if (config.bossenable) then
		bossanchor:Show()
	else
		bossanchor:Hide()
	end
end --]]

unitframes.classspecific = {
	Paladin = function(self)
		local ClassIcons = {}
		for index = 1, 5 do
			local icon = CreateFrame('frame', nil, self)

			-- Position and size.
			local width = (self.ExtraResource:GetWidth()+bordersize)/5
			icon:SetSize(width+bordersize, 8)
			if (index == 1) then
				icon:SetPoint("LEFT", self.ExtraResource, "LEFT", -bordersize, 0)
			else
				icon:SetPoint("LEFT", ClassIcons[index-1], "RIGHT", -bordersize, 0)
			end
			icon:SetBackdrop({bgFile = bdCore.media.flat, edgeFile = bdCore.media.flat, edgeSize = 2})
			icon:SetBackdropColor(unpack(bdCore.media.backdrop))
			icon:SetBackdropBorderColor(unpack(bdCore.media.border))
			
			local color = oUF.colors.power["HOLY_POWER"]
			icon:SetBackdropColor(color[1], color[2], color[3])

			ClassIcons[index] = icon
		end
		
		self.ClassIcons = ClassIcons
	end,
	Monk = function(self)
		local ClassIcons = {}
		local maxp = UnitPowerMax("player", SPELL_POWER_CHI);
		for index = 1, maxp do
			local icon = CreateFrame('frame', nil, self)

			-- Position and size.
			local width = (self.ExtraResource:GetWidth()+bordersize)/maxp
			icon:SetSize(width+bordersize, 8)
			if (index == 1) then
				icon:SetPoint("LEFT", self.ExtraResource, "LEFT", -bordersize, 0)
			else
				icon:SetPoint("LEFT", ClassIcons[index-1], "RIGHT", -bordersize, 0)
			end
			icon:SetBackdrop({bgFile = bdCore.media.flat, edgeFile = bdCore.media.flat, edgeSize = 2})
			icon:SetBackdropColor(unpack(bdCore.media.backdrop))
			icon:SetBackdropBorderColor(unpack(bdCore.media.border))
			
			local color = oUF.colors.power["CHI"]
			icon:SetBackdropColor(color[1], color[2], color[3])

			ClassIcons[index] = icon
		end
		
		self.ClassIcons = ClassIcons
	end
}

unitframes.specific = {
	player = function(self)
		self:SetPoint("RIGHT", UIParent, "CENTER", -(config.playertargetwidth/2+2), -220)
		self:SetSize(config.playertargetwidth, config.playertargetheight)
		self.Power:SetHeight(config.playertargetpowerheight)
		
		if (config.textlocation == "Outside") then
			self.Name:ClearAllPoints()
			self.Name:SetPoint("RIGHT", self, "LEFT", -6, 8)
			self.Name:SetJustifyH("RIGHT")
			self.Curhp:ClearAllPoints()
			self.Curhp:SetPoint('RIGHT', self, "LEFT", -6, -3)
			self.Curhp:SetJustifyH("RIGHT")
			self.Combat:ClearAllPoints()
			self.Combat:SetPoint("RIGHT", self.Health, "RIGHT", -4, 0)
			self.Resting:ClearAllPoints()
			self.Resting:SetPoint("RIGHT", self.Health, "RIGHT", -4, 0)
		else
			self.Name:ClearAllPoints()
			self.Name:SetPoint("LEFT", self, "LEFT", 6, 0)
			self.Name:SetJustifyH("LEFT")
			self.Curhp:ClearAllPoints()
			self.Curhp:SetPoint('RIGHT', self.Health, "RIGHT", -6, 0)
			self.Curhp:SetJustifyH("RIGHT")
			self.Combat:ClearAllPoints()
			self.Combat:SetPoint("CENTER", self.Health, "CENTER", 0, 0)
			self.Resting:ClearAllPoints()
			self.Resting:SetPoint("CENTER", self.Health, "CENTER", 0, 0)
		end
		
		local class = select(1, UnitClass("player"))
		
		self.Buffs:SetPoint("BOTTOMLEFT", self.Power, "TOPLEFT", 0, 2)
		self.Buffs:SetSize(self.Health:GetWidth(), 40)
		self.Buffs.size = 28
		self.Buffs:EnableMouse(false)
		self.Buffs.initialAnchor  = "BOTTOMLEFT"
		self.Buffs.spacing = 2
		self.Buffs.num = 20
		self.Buffs['growth-y'] = "UP"
		self.Buffs['growth-x'] = "RIGHT"
		self.Buffs.CustomFilter = function(icons, unit, something, name, rank, texture, count, dispelType, duration, expires, caster, isStealable, nameplateShowPersonal, spellID, canApplyAura, isBossDebuff, _, nameplateShowAll)

			if (bdCore:filterAura(name,caster,true)) then
				if (caster == "player" and duration ~= 0 and duration < 300) then
					return true 
				end
			end
		end
		
		-- buffs/aurabars
		if (config.bufftrackerstyle == "Icons") then
			self.AuraBars:Hide()
			self.Buffs:Show()
		elseif (config.bufftrackerstyle == "Aurabars") then
			self.AuraBars:Show()
			self.Buffs:Hide()
		else
			self.AuraBars:Hide()
			self.Buffs:Hide()
		end
		
	
		-- castbar
		self.Castbar:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 0, -bordersize)
		self.Castbar:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", 0, -config.castbarheight)
		self.Castbar.Icon:SetPoint("TOPRIGHT", self.Castbar,"TOPLEFT", -bordersize-6, 0)
		self.Castbar.Icon:SetSize(config.castbaricon, config.castbaricon)
		
		self.Castbar.Text:SetPoint("TOPRIGHT", self.Castbar, "BOTTOMRIGHT", -2, -4)
		self.Castbar.Text:SetJustifyH("RIGHT")
		
		if (unitframes.classspecific[class]) then
			unitframes.classspecific[class](self)
		end
	end,
	target = function(self)
		self:ClearAllPoints()
		self:SetPoint("LEFT", UIParent, "CENTER", (config.playertargetwidth/2+2), -220)
		self:SetSize(config.playertargetwidth, config.playertargetheight)
		self.Power:SetHeight(config.playertargetpowerheight)
		
		if (config.bufftrackerstyle) then
			self.AuraBars:Show()
		end
		
		
		if (config.textlocation == "Outside") then
			self.Name:ClearAllPoints()
			self.Name:SetPoint("LEFT", self.Health, "RIGHT", 6, 8)
			self.Name:SetJustifyH("LEFT")
			self.Curhp:ClearAllPoints()
			self.Curhp:SetPoint('LEFT', self.Health, "RIGHT", 6, -3)
			self.Curhp:SetJustifyH("LEFT")
			self.Combat:ClearAllPoints()
			self.Combat:SetPoint("RIGHT", self.Health, "RIGHT", -4, 0)
			self.Resting:ClearAllPoints()
			self.Resting:SetPoint("RIGHT", self.Health, "RIGHT", -4, 0)
		else
			self.Name:ClearAllPoints()
			self.Name:SetPoint("RIGHT", self.Health, "RIGHT", -6, 0)
			self.Name:SetJustifyH("RIGHT")
			self.Curhp:ClearAllPoints()
			self.Curhp:SetPoint('LEFT', self.Health, "LEFT", 6, 0)
			self.Curhp:SetJustifyH("LEFT")
			self.Combat:ClearAllPoints()
			self.Combat:SetPoint("CENTER", self.Health, "CENTER", 0, 0)
			self.Resting:ClearAllPoints()
			self.Resting:SetPoint("CENTER", self.Health, "CENTER", 0, 0)
		end
		
		self.Buffs:ClearAllPoints()
		self.Buffs:SetPoint("BOTTOMLEFT", self.Power, "TOPRIGHT", 8, bordersize+2)

		self.Buffs.CustomFilter = function(icons, unit, name, rank, texture, count, dispelType, duration, expires, caster, isStealable, nameplateShowPersonal, spellID, canApplyAura, isBossDebuff, _, nameplateShowAll)
			local allow = false;
			-- allow it if it's tracked in the ui and not blacklisted
			if (bdCore:filterAura(name,caster,true) == true) then
				allow = true
			end
			-- also allow anything that might be casted by the boss
			--[[if (not strfind(caster, "raid") and not strfind(caster, "party") and not strfind(caster, "player")) then
				print(caster)
			end--]]
			if (not caster and not UnitIsPlayer("target")) then
				allow = true
			end
			if (caster and not strfind(caster, "raid") and not strfind(caster, "party") and not caster == "player") then
				allow = true
			end
			
			return allow	
		end
		
		
		if (config.showtargetbuffs) then
			self.Buffs:Show()
		else
			self.Buffs:Hide()
		end
		
		-- castbar
		self.Castbar:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", 0, -bordersize)
		self.Castbar:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 0, -config.castbarheight)
		self.Castbar.Icon:SetPoint("TOPLEFT", self.Castbar,"TOPRIGHT", bordersize+6, 0)
		self.Castbar.Icon:SetSize(config.castbaricon, config.castbaricon)
		
		self.Castbar.Text:SetPoint("TOPLEFT", self.Castbar, "BOTTOMLEFT", 2, -4)
		self.Castbar.Text:SetJustifyH("LEFT")		
	end,
	targettarget = function(self)
		self:SetPoint("TOPRIGHT", frames.target.Health, "BOTTOMRIGHT", 0, -config.castbarheight-2)
		self:SetSize(config.targetoftargetwidth, config.targetoftargetheight)
		
		self.Name:SetPoint('CENTER', self.Health, "CENTER", 0, 0)
		self.RaidIcon:SetSize(8,8)
		self.RaidIcon:SetPoint("LEFT", self.Health, 2,0)
		self.AuraBars:Hide()
		
		self.Power:Hide()
		self.Curhp:Hide()
		self.Combat:Hide()
		self.Resting:Hide()
		self.Castbar:Hide()
	end,
	focus = function(self)
		self:SetPoint("TOP", UIParent, "TOP", 0, -30)
		self:SetSize(config.focuswidth, config.focusheight)
		self.Health:SetSize(config.focuswidth, config.focusheight)
		self.Power:SetHeight(config.focuspower)
		self.AuraBars:Hide()
		
		self.Name:SetPoint('BOTTOMLEFT', self.Power, "TOPLEFT", 4, 2)
		self.Curhp:SetPoint('BOTTOMRIGHT', self.Power, "TOPRIGHT", -4, 2)

		self.Combat:Hide()
		self.Resting:Hide()
		
		self.Castbar:SetPoint("TOP", UIParent, "TOP", 0, -80)
		self.Castbar:SetSize(config.focuscastwidth, config.focuscastheight)
		self.Castbar.Time:SetPoint("TOPLEFT", self.Castbar, "BOTTOMLEFT", 2, -4)
		self.Castbar.Time:SetFont(bdCore.media.font, 14)
		self.Castbar.Text:SetPoint("TOPRIGHT", self.Castbar, "BOTTOMRIGHT", -2, -4)
		self.Castbar.Text:SetFont(bdCore.media.font, 14)
		self.Castbar.Icon:SetSize(config.focuscasticon, config.focuscasticon)
		self.Castbar.Icon:SetPoint("TOP", self.Castbar, "BOTTOM",0,-6)
	end,
	pet = function(self)
		self:ClearAllPoints()
		self:SetPoint("TOPLEFT", frames.player.Health, "BOTTOMLEFT", 0, -config.castbarheight-2)
		self:SetSize(config.targetoftargetwidth, config.targetoftargetheight)
		self.Name:SetPoint('CENTER', self.Health, "CENTER", 0, 0)
		self.AuraBars:Hide()
	
		self.Combat:Hide()
		self.Resting:Hide()
		self.Curhp:Hide()
		self.Power:Hide()
	end,
	boss = function(self)
		self:SetSize(config.bosswidth, config.bossheight)
		self.Power:SetHeight(config.bosspower)
		self.AuraBars:Hide()
		
		self.Name:SetPoint('BOTTOMLEFT', self.Power, "TOPLEFT", 4, 2)
		self.Curhp:SetPoint('BOTTOMRIGHT', self.Power, "TOPRIGHT", -4, 2)
		
		self.Combat:Hide()
		
		--self.Buffs:ClearAllPoints()
		--self.Buffs:SetPoint("LEFT", self.Power, "RIGHT", 8, 0)
		
		if (config.bossenable) then
			bossanchor:Show()
		else
			bossanchor:Hide()
		end

		self.Auras:Show()
		self.Auras:SetSize(config.bossdebuffsize*4, config.bossdebuffsize*2)
		self.Auras.size = config.bossdebuffsize
		self.Auras.CustomFilter = function(self, icons, unit, name, rank, texture, count, dispelType, duration, expires, caster, isStealable, nameplateShowPersonal, spellID, canApplyAura, isBossDebuff, _, nameplateShowAll)
			local allow = false;
			-- allow it if it's tracked in the ui and not blacklisted
			--[[if (bdCore:filterAura(name,caster,true) == true) then
				allow = true
			end--]]
			-- also allow anything that might be casted by the boss
			--[[if (caster and not strfind(caster, "raid") and not strfind(caster, "party")) then
				allow = true
			end--]]
			
			if (caster and caster == "player") then
				allow = true
			end
			
			if (bdCore:isBlacklisted(name)) then
				allow = false
			end
			return allow	
		end
		
		-- castbar
		self.Castbar:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", 0, -bordersize)
		self.Castbar:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 0, -config.castbarheight)
		self.Castbar.Icon:SetPoint("TOPLEFT", self.Castbar,"TOPRIGHT", bordersize, 0)
		self.Castbar.Icon:SetSize(config.castbarheight-bordersize, config.castbarheight-bordersize)
		
		self.Castbar.Text:SetPoint("BOTTOMLEFT", self.Castbar, "TOPLEFT", 2, 6)
		self.Castbar.Text:SetJustifyH("LEFT")	
		self.Castbar.Time:SetPoint("BOTTOMRIGHT", self.Castbar, "TOPRIGHT", -2, 6)
		self.Castbar.Time:SetJustifyH("RIGHT")	
	end
}

oUF.colors.power['MANA'] = {46/255, 130/255, 215/255}
function unitframes.Layout(self,unit)
	self:RegisterForClicks('AnyDown')
	self:SetScript('OnEnter', UnitFrame_OnEnter)
	self:SetScript('OnLeave', UnitFrame_OnLeave)
	local parent = self
		
	-- Health
	self.Health = CreateFrame("StatusBar", nil, self)
	self.Health:SetStatusBarTexture(bdCore.media.smooth)
	self.Health:SetAllPoints(self)
	self.Health.frequentUpdates = true
	self.Health.colorTapping = true
	self.Health.colorDisconnected = true
	self.Health.colorClass = true
	self.Health.colorReaction = true
	self.Health.colorHealth = true
	bdCore:setBackdrop(self.Health,true)
	
	-- Power
	self.Power = CreateFrame("StatusBar", nil, self)
	self.Power:SetStatusBarTexture(bdCore.media.flat)
	self.Power:ClearAllPoints()
	self.Power:SetPoint("BOTTOMLEFT", self.Health, "TOPLEFT",0, bdCore.config.General.border)
	self.Power:SetPoint("BOTTOMRIGHT", self.Health, "TOPRIGHT",0, bdCore.config.General.border)
	self.Power:SetHeight(config.playertargetpowerheight)
	self.Power.frequentUpdates = true
	self.Power.colorTapping = true
	self.Power.colorDisconnected = true
	self.Power.colorPower = true
	self.Power.colorClass = true
	self.Power.colorReaction = true
	bdCore:setBackdrop(self.Power)
	
	-- Special Power Display (holy power, etc)
	self.ExtraResource = CreateFrame("Frame", nil, self)
	self.ExtraResource:SetPoint("BOTTOMLEFT", self.Power, "TOPLEFT", 0, 2)
	self.ExtraResource:SetPoint("TOPRIGHT", self.Power, 0, 6)
	self.ExtraResource:SetPoint("CENTER", UIParent)
	self.ExtraResource:SetSize(200,30)
	--bdCore:setBackdrop(self.ExtraResource)
	--[[self.ExtraResource:RegisterEvent("NAME_PLATE_CREATED")
	self.ExtraResource:RegisterEvent("NAME_PLATE_UNIT_REMOVED")
	self.ExtraResource:RegisterEvent("NAME_PLATE_UNIT_ADDED")
	self.ExtraResource:RegisterEvent("PLAYER_TARGET_CHANGED")
	self.ExtraResource:SetScript("OnEvent",function()
		NamePlateTargetResourceFrame:Layout();
		NamePlateTargetResourceFrame:Show()
		NamePlateTargetResourceFrame:ClearAllPoints()
		NamePlateTargetResourceFrame:SetPoint("CENTER", UIParent, "CENTER", 0, -200)
	end)
	NamePlateTargetResourceFrame:Layout();
	NamePlateTargetResourceFrame:Show()
	NamePlateTargetResourceFrame:ClearAllPoints()
	NamePlateTargetResourceFrame:SetPoint("CENTER", UIParent, "CENTER", 0, -200)
	NamePlateTargetResourceFrame.SetPoint = function(self,...) end
	NamePlateTargetResourceFrame.ClearAllPoints = function(self,...) end
	NamePlateTargetResourceFrame.Show = function(self,...) end
	NamePlateTargetResourceFrame.Hide = function(self,...) end--]]
	
	-- Combat indicator
	self.Combat = self.Health:CreateTexture(nil, "OVERLAY")
	self.Combat:SetSize(16, 16)
	self.Combat:SetPoint('LEFT', self.Health, 2, 0)
	
	-- Resting indicator
	self.Resting = self.Health:CreateTexture(nil, "OVERLAY")
	self.Resting:SetSize(16, 16)
	self.Resting:SetPoint('LEFT', self.Health, 2, 0)
	
	-- Range
	self.Range = {
		insideAlpha = 1,
		outsideAlpha = .4,
	}
	
	-- Auras
	self.Auras = CreateFrame("Frame", nil, self)
	self.Auras:SetSize(72, 40)
	self.Auras.size = 18
	self.Auras:EnableMouse(false)
	self.Auras.initialAnchor  = "BOTTOMRIGHT"
	self.Auras.spacing = 2
	self.Auras.num = 20
	self.Auras['growth-y'] = "UP"
	self.Auras['growth-x'] = "LEFT"
	self.Auras.PostCreateIcon = function(Debuffs, button)
		bdCore:setBackdrop(button)
		button.cd:GetRegions():SetAlpha(0)
		button.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
		button:SetAlpha(0.8)
	end
	self.Auras:SetPoint("RIGHT", self, "LEFT", -10, 0)
	self.Auras:Hide()
	
	-- Buffs
	self.Buffs = CreateFrame("Frame", nil, self)
	self.Buffs:SetSize(72, 40)
	self.Buffs.size = 18
	self.Buffs:EnableMouse(false)
	self.Buffs.initialAnchor  = "BOTTOMLEFT"
	self.Buffs.spacing = 2
	self.Buffs.num = 20
	self.Buffs['growth-y'] = "UP"
	self.Buffs['growth-x'] = "RIGHT"
	self.Buffs.PostCreateIcon = function(Debuffs, button)
		bdCore:setBackdrop(button)
		button.cd:GetRegions():SetAlpha(0)
		button.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
		button:SetAlpha(0.8)
	end
	
	-- Auras
	self.AuraBars = self.AuraBars or CreateFrame("Frame", nil, self)
	self.AuraBars:SetHeight(2)
	self.AuraBars:SetPoint("BOTTOMLEFT", self.Power, "TOPLEFT", 0, 6)
	self.AuraBars:SetPoint("BOTTOMRIGHT", self.Power, "TOPRIGHT", 0, 6)
	
	-- Options
	self.AuraBars.auraBarTexture = bdCore.media.flat
	self.AuraBars.spacing = 2
	self.AuraBars.gap = 2
	self.AuraBars.auraBarHeight = 18
	self.AuraBars.auraBarColor = .4,.4,.5
	self.AuraBars.PostCreateBar = function(bar) 
		bar:SetFrameLevel(3)
		bdCore:setBackdrop(bar)
		bar.icon.bg = bar.icon.bg or CreateFrame("frame", nil, bar)
		bar.icon.bg:SetAllPoints(bar.icon)
		bar.icon.bg:SetFrameLevel(0)
		bar.icon:SetDrawLayer('OVERLAY')
		bdCore:setBackdrop(bar.icon.bg)
		bar.spellname:SetPoint("LEFT", bar, "LEFT", 4, 0)
		bar.spellname:SetFont(bdCore.media.font, 12)
		bar.spelltime:SetPoint("RIGHT", bar, "RIGHT", -4, 0)
		bar:SetStatusBarColor(.1, .4, .7, 1)
		bar.bg:Hide()
	end
	
	self.AuraBars.filter = function(name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable)
		if (bdCore:filterAura(name,unitCaster,true) and config.bufftrackerstyle == "Aurabars") then
			if (unitCaster == "player" and duration ~= 0 and duration < 300) then
				return true 
			end
		end
	end
	
	-- Raid Icon
	self.RaidIcon = self.Health:CreateTexture(nil, "OVERLAY", nil, 1)
	self.RaidIcon:SetSize(12, 12)
	self.RaidIcon:SetPoint('CENTER', self, 0, 0)
	
	-- Absorb
	self.TotalAbsorb = CreateFrame('StatusBar', nil, self.Health)
	self.TotalAbsorb:SetAllPoints(self.Health)
	self.TotalAbsorb:SetStatusBarTexture(bdCore.media.flat)
	self.TotalAbsorb:SetStatusBarColor(.1,.1,.1,.6)
	
	self.HealAbsorb = CreateFrame('StatusBar', nil, self.Health)
	self.HealAbsorb:SetAllPoints(self.Health)
	self.HealAbsorb:SetStatusBarTexture(bdCore.media.flat)
	self.HealAbsorb:SetStatusBarColor(.2,0,0,.5)
	
	self.HealPredict = CreateFrame('StatusBar', nil, self.Health)
	self.HealPredict:SetAllPoints(self.Health)
	self.HealPredict:SetStatusBarTexture(bdCore.media.flat)
	self.HealPredict:SetStatusBarColor(0.6,1,0.6,.2)
	
	-- Tags
	oUF.Tags.Events['curhp'] = 'UNIT_HEALTH_FREQUENT UNIT_HEALTH UNIT_MAXHEALTH'
	oUF.Tags.Methods['curhp'] = function(unit)
		local hp, hpMax = UnitHealth(unit), UnitHealthMax(unit)
		local hpPercent = hp / hpMax
		if hpMax == 0 then return end
		return numberize(hp).." - "..round(hpPercent * 100,2);
	end

	oUF.Tags.Events["status"] = "UNIT_HEALTH  UNIT_CONNECTION  CHAT_MSG_SYSTEM"
	oUF.Tags.Methods["status"] = function(unit)
		if not UnitIsConnected(unit) then
			return "offline"		
		elseif UnitIsDead(unit) then
			return "dead"		
		elseif UnitIsGhost(unit) then
			return "ghost"
		end
	end
	
	-- to put text over statusbars
	self.TextHolder = CreateFrame("frame",nil,self.Health)
	self.TextHolder:SetFrameLevel(10)
	self.Name = self.TextHolder:CreateFontString(nil, "OVERLAY")
	self.Name:SetFont(bdCore.media.font, 13)
	self.Name:SetShadowOffset(1,-1)
	
	self.Status = self.TextHolder:CreateFontString(nil, "OVERLAY")
	self.Status:SetFont(bdCore.media.font, 13)
	self.Status:SetPoint("CENTER", self.Health, "CENTER")
	self.Status:SetShadowOffset(1,-1)
	
	self.Curhp = self.TextHolder:CreateFontString(nil, "OVERLAY")
	self.Curhp:SetFont(bdCore.media.font, 13)
	self.Curhp.frequentUpdates = 0.1
	self.Curhp:SetShadowOffset(1,-1)
   
	self:Tag(self.Curhp, '[curhp]')
	self:Tag(self.Name, '[name]')
	self:Tag(self.Status, '[status]')
	
	-- castbars
	self.Castbar = CreateFrame("StatusBar", nil, self)
	self.Castbar:SetFrameLevel(3)
	self.Castbar:SetStatusBarTexture(bdCore.media.flat)
	self.Castbar:SetStatusBarColor(.1, .4, .7, 1)
	bdCore:setBackdrop(self.Castbar)
	self.Castbar.Text = self.Castbar:CreateFontString(nil, "OVERLAY")
	self.Castbar.Text:SetFont(bdCore.media.font, 12, "OUTLINE")
	self.Castbar.Icon = self.Castbar:CreateTexture(nil, "OVERLAY")
	self.Castbar.Icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
	self.Castbar.Icon:SetDrawLayer('ARTWORK')
	self.Castbar.bg = self.Castbar:CreateTexture(nil, "BORDER")
	self.Castbar.bg:SetTexture(bdCore.media.flat)
	self.Castbar.bg:SetVertexColor(unpack(bdCore.media.border))
	self.Castbar.bg:SetPoint("TOPLEFT", self.Castbar.Icon, "TOPLEFT", -bdCore.config.General.border, bdCore.config.General.border)
	self.Castbar.bg:SetPoint("BOTTOMRIGHT", self.Castbar.Icon, "BOTTOMRIGHT", bdCore.config.General.border, -bdCore.config.General.border)
	self.Castbar.SafeZone = self.Castbar:CreateTexture(nil, "OVERLAY")
	self.Castbar.SafeZone:SetVertexColor(0.85,0.10,0.10,0.20)
	self.Castbar.SafeZone:SetTexture(bdCore.media.flat)
	self.Castbar.Time = self.Castbar:CreateFontString(nil, "OVERLAY")
	self.Castbar.Time:SetFont(bdCore.media.font, 12, "OUTLINE")
	self.Castbar.Time:SetJustifyH("CENTER")
	self.Castbar.Time:SetPoint("CENTER", self.Castbar.Icon)
	self.Castbar.PostCastStart = function(self,unit, name, castid)
		if (unit == "player") then return end
		local interrupt = select(9, UnitCastingInfo(unit))
		if (interrupt) then
			self.Icon:SetDesaturated(1)
			self:SetStatusBarColor(.7, .7, .7, 1)
		else
			self.Icon:SetDesaturated(false)
			self:SetStatusBarColor(.1, .4, .7, 1)
		end
	end
	
	if (not config.enablecastbars) then
		self.Castbar:SetAlpha(0)
	end
	
	local func = unit
	if (string.find(func, "boss")) then func = "boss" end
	bdframes[unit] = self
	self:RegisterEvent("UNIT_MAXPOWER",function()
		if(not self.ClassIcons and unitframes.specific[func]) then
			unitframes.specific[func](self, unit)
		end
	end)
	if(not self.ClassIcons and unitframes.specific[func]) then
		unitframes.specific[func](self, unit)
	end
	
	--ClassNameplateBar
	
	function self.updateConfig(self)
		if (config.enablecastbars) then
			self.Castbar:SetAlpha(1)
		else
			self.Castbar:SetAlpha(0)
		end
		
		local func = unit
		if (string.find(func, "boss")) then func = "boss" end

		unitframes.specific[func](self, unit)
	end
	
	local main = self
	bdCore:hookEvent("unitframesUpdate", function(self)
		main.updateConfig(main)
	end)
end

oUF:RegisterStyle("bdUnitFrames", unitframes.Layout)
oUF:Factory(function(self)
	self:SetActiveStyle("bdUnitFrames")
	frames.player = self:Spawn("player")
	frames.target = self:Spawn("target")
	frames.tot = self:Spawn("targettarget")
	frames.focus = self:Spawn("focus")
	frames.pet = self:Spawn("pet")
	
	bdCore:makeMovable(frames.player)
	bdCore:makeMovable(frames.target)
	bdCore:makeMovable(frames.tot)
	bdCore:makeMovable(frames.focus)
	bdCore:makeMovable(frames.pet)
	
	local boss = {}
	for i = 1, 5 do
		boss[i] = oUF:Spawn("boss"..i, nil)
		if (i == 1) then
			boss[i]:SetPoint("TOP", bossanchor, "TOP", 0, 0)
		else
			boss[i]:SetPoint("TOP", boss[i-1], "BOTTOM", 0, -35)           
		end
		boss[i]:SetSize(200, 20)
	end
end)
