local oUF = bdCore.oUF
local addon, bdUnitframes = ...

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
defaults[#defaults+1] = {inrangealpha = {
	type = "slide",
	min = 0.1,
	max = 1,
	step = 0.1,
	value = 1,
	label = "In Range Alpha",
	callback = function() bdCore:triggerEvent("unitframesUpdate") end
}} 

defaults[#defaults+1] = {outofrangealpha = {
	type = "slide",
	min = 0.1,
	max = 1,
	step = 0.1,
	value = 1,
	label = "Out of Range Alpha",
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
	value = 18,
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
	bdCore:addModule("Auras", bdCore.auraconfig, true)
end

bdCore:addModule("Unit Frames", defaults)
local config = bdCore.config.profile['Unit Frames']

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

local bdframes = {}
local bossanchor = CreateFrame("frame", "bdUF Boss Frame Anchor", UIParent)
bossanchor:SetPoint("LEFT", UIParent, "LEFT", 20, 80)
bossanchor:SetSize(200, 50)
local bordersize = bdCore.config.persistent.General.border

unitframes.specific = {
	player = function(self)
		-- update function
		function self:callback()
			if (not InCombatLockdown()) then
				self:SetSize(config.playertargetwidth, config.playertargetheight)
			end

			self.Power:SetHeight(config.playertargetpowerheight)
			-- buffs/aurabars
			self.Debuffs:Hide()
			self.Buffs:SetSize(config.playertargetwidth, 40)
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
			
			-- text location
			if (config.textlocation == "Outside") then
				self.Name:ClearAllPoints()
				self.Name:SetPoint("RIGHT", self, "LEFT", -6, 8)
				self.Name:SetJustifyH("RIGHT")
				self.Curhp:ClearAllPoints()
				self.Curhp:SetPoint('RIGHT', self, "LEFT", -6, -3)
				self.Curhp:SetJustifyH("RIGHT")
				self.CombatIndicator:ClearAllPoints()
				self.CombatIndicator:SetPoint("RIGHT", self.Health, "RIGHT", -4, 0)
				self.RestingIndicator:ClearAllPoints()
				self.RestingIndicator:SetPoint("RIGHT", self.Health, "RIGHT", -4, 0)
			else
				self.Name:ClearAllPoints()
				self.Name:SetPoint("LEFT", self, "LEFT", 6, 0)
				self.Name:SetJustifyH("LEFT")
				self.Curhp:ClearAllPoints()
				self.Curhp:SetPoint('RIGHT', self.Health, "RIGHT", -6, 0)
				self.Curhp:SetJustifyH("RIGHT")
				self.CombatIndicator:ClearAllPoints()
				self.CombatIndicator:SetPoint("CENTER", self.Health, "CENTER", 0, 0)
				self.RestingIndicator:ClearAllPoints()
				self.RestingIndicator:SetPoint("CENTER", self.Health, "CENTER", 0, 0)
			end

			-- castbar
			self.Castbar:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 0, -bordersize)
			self.Castbar:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", 0, -config.castbarheight)
			self.Castbar.Icon:SetPoint("TOPRIGHT", self.Castbar,"TOPLEFT", -bordersize-6, 0)
			self.Castbar.Icon:SetSize(config.castbaricon, config.castbaricon)
			self.Castbar.Text:SetPoint("TOPRIGHT", self.Castbar, "BOTTOMRIGHT", -2, -4)
			self.Castbar.Text:SetJustifyH("RIGHT")
		end
		local main = self
		bdCore:hookEvent("unitframesUpdate", function() main:callback() end)

		-- config buffs
		self.Buffs:SetPoint("BOTTOMLEFT", self.Power, "TOPLEFT", 0, 12)
		self.Buffs.size = 28
		self.Buffs:EnableMouse(false)
		self.Buffs.initialAnchor  = "BOTTOMLEFT"
		self.Buffs.spacing = 2
		self.Buffs.num = 20
		self.Buffs['growth-y'] = "UP"
		self.Buffs['growth-x'] = "RIGHT"
		self.Buffs.CustomFilter = function(element, unit, button, name, texture, count, debuffType, duration, expiration, caster, isStealable, nameplateShowSelf, spellID, canApply, isBossDebuff, casterIsPlayer, nameplateShowAll,timeMod, effect1, effect2, effect3)

			if (bdCore:filterAura(name, caster, isBossDebuff, nameplateShowAll, true)) then
				if (caster == "player" and duration ~= 0 and duration < 300) then
					return true 
				end
			end
		end

		-- class powers
		local powers = {}
		for index = 1, 10 do
			local bar = CreateFrame('StatusBar', nil, self)
			bar:SetStatusBarTexture(bdCore.media.flat)
			bdCore:setBackdrop(bar)
			powers[index] = bar
		end
		self.ClassPower = powers

		-- repositioning
		local ExtraResource = self.ExtraResource
		self.ClassPower.PostUpdate = function(self, cur, max, hasMaxChanged, powerType)
			if not max then return end
			local width = ((ExtraResource:GetWidth()-(bordersize*max)) +2) / max
			local element = self
			local lastPower = nil


			for i = 1, max do
				element[i]:SetSize(width, 8)
				if (lastPower) then
					element[i]:SetPoint("LEFT",  lastPower, "RIGHT", bordersize, 0)
				else
					element[i]:SetPoint("LEFT", ExtraResource, "LEFT", 0, 0)
				end
				lastPower = element[i]
			end
		end

	end,
	target = function(self)
		-- update function
		function self:callback()
			-- secure for self	
			if (not InCombatLockdown()) then
				self:SetSize(config.playertargetwidth, config.playertargetheight)
			end

			self.Power:SetHeight(config.playertargetpowerheight)
			self.Castbar:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 0, -config.castbarheight)
			self.Castbar.Icon:SetSize(config.castbaricon, config.castbaricon)

			if (config.textlocation == "Outside") then
				self.Name:ClearAllPoints()
				self.Name:SetPoint("LEFT", self.Health, "RIGHT", 6, 8)
				self.Name:SetJustifyH("LEFT")
				self.Curhp:ClearAllPoints()
				self.Curhp:SetPoint('LEFT', self.Health, "RIGHT", 6, -3)
				self.Curhp:SetJustifyH("LEFT")
				self.CombatIndicator:ClearAllPoints()
				self.CombatIndicator:SetPoint("RIGHT", self.Health, "RIGHT", -4, 0)
				self.RestingIndicator:ClearAllPoints()
				self.RestingIndicator:SetPoint("RIGHT", self.Health, "RIGHT", -4, 0)
			else
				self.Name:ClearAllPoints()
				self.Name:SetPoint("RIGHT", self.Health, "RIGHT", -6, 0)
				self.Name:SetJustifyH("RIGHT")
				self.Curhp:ClearAllPoints()
				self.Curhp:SetPoint('LEFT', self.Health, "LEFT", 6, 0)
				self.Curhp:SetJustifyH("LEFT")
				self.CombatIndicator:ClearAllPoints()
				self.CombatIndicator:SetPoint("CENTER", self.Health, "CENTER", 0, 0)
				self.RestingIndicator:ClearAllPoints()
				self.RestingIndicator:SetPoint("CENTER", self.Health, "CENTER", 0, 0)
			end

			if (config.showtargetbuffs) then
				self.Buffs:Show()
			else
				self.Buffs:Hide()
			end
		end
		local main = self
		bdCore:hookEvent("unitframesUpdate", function() main:callback() end)
		
		-- buffs
		self.Buffs:ClearAllPoints()
		self.Buffs:SetPoint("BOTTOMLEFT", self.Power, "TOPRIGHT", 8, bordersize+2)
		self.Buffs:SetWidth(82)
		self.Buffs.CustomFilter = function(element, unit, button, name, texture, count, debuffType, duration, expiration, caster, isStealable, nameplateShowSelf, spellID, canApply, isBossDebuff, casterIsPlayer, nameplateShowAll,timeMod, effect1, effect2, effect3)
			local allow = false;

			-- allow it if it's tracked in the ui and not blacklisted
			if ( bdCore:filterAura(name, caster, isBossDebuff, nameplateShowAll, true) ) then
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

			if (bdCore:isBlacklisted(name,caster)) then
				allow = false
			end
			
			return allow	
		end
		
		-- debuffs
		self.Debuffs.CustomFilter = function(element, unit, button, name, texture, count, debuffType, duration, expiration, caster, isStealable, nameplateShowSelf, spellID, canApply, isBossDebuff, casterIsPlayer, nameplateShowAll,timeMod, effect1, effect2, effect3)
			if (bdCore:filterAura(name, caster, isBossDebuff, nameplateShowAll, true)) then
				if (caster and UnitIsUnit(caster,"player") and duration ~= 0 and duration < 300) then
					return true 
				end
			end
		end
		
		-- castbar
		self.Castbar:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", 0, -bordersize)
		self.Castbar.Icon:SetPoint("TOPLEFT", self.Castbar,"TOPRIGHT", bordersize+6, 0)
		
		self.Castbar.Text:SetPoint("TOPLEFT", self.Castbar, "BOTTOMLEFT", 2, -4)
		self.Castbar.Text:SetJustifyH("LEFT")	
	
	end,
	targettarget = function(self)
		-- update function
		function self:callback()
			if (not InCombatLockdown()) then
				self:SetSize(config.targetoftargetwidth, config.targetoftargetheight)
			end

			self.Buffs:Hide()
			self.Debuffs:Hide()
		end
		local main = self
		bdCore:hookEvent("unitframesUpdate", function() main:callback() end)
		
		self.Name:SetPoint('CENTER', self.Health, "CENTER", 0, 0)
		self.RaidTargetIndicator:SetSize(8,8)
		self.RaidTargetIndicator:SetPoint("LEFT", self.Health, 2,0)

		self.AuraBars:Hide()
		self.Buffs:Hide()
		self.Debuffs:Hide()
		self.Power:Hide()
		self.Curhp:Hide()
		self.CombatIndicator:Hide()
		self.RestingIndicator:Hide()
		self.Castbar:Hide()

	end,
	focus = function(self)
		-- update function
		function self:callback()
			if (not InCombatLockdown()) then
				self:SetSize(config.focuswidth, config.focusheight)
			end

			self.Health:SetSize(config.focuswidth, config.focusheight)
			self.Power:SetHeight(config.focuspower)

			self.Castbar:SetSize(config.focuscastwidth, config.focuscastheight)
			self.Castbar.Icon:SetSize(config.focuscasticon, config.focuscasticon)

			self.Buffs:Hide()
			self.Debuffs:Hide()
		end
		local main = self
		bdCore:hookEvent("unitframesUpdate", function() main:callback() end)
		
		self.Name:SetPoint('BOTTOMLEFT', self.Power, "TOPLEFT", 4, 2)
		self.Curhp:SetPoint('BOTTOMRIGHT', self.Power, "TOPRIGHT", -4, 2)

		self.AuraBars:Hide()
		self.CombatIndicator:Hide()
		self.RestingIndicator:Hide()
		
		self.Castbar:SetPoint("TOP", UIParent, "TOP", 0, -80)
		self.Castbar.Time:SetPoint("TOPLEFT", self.Castbar, "BOTTOMLEFT", 2, -4)
		self.Castbar.Time:SetFont(bdCore.media.font, 14)
		self.Castbar.Text:SetPoint("TOPRIGHT", self.Castbar, "BOTTOMRIGHT", -2, -4)
		self.Castbar.Text:SetFont(bdCore.media.font, 14)
		self.Castbar.Icon:SetPoint("TOP", self.Castbar, "BOTTOM",0,-6)

	end,
	pet = function(self)
		-- update function
		function self:callback()
			if (not InCombatLockdown()) then
				self:SetSize(config.targetoftargetwidth, config.targetoftargetheight)
			end
			self.Buffs:Hide()
			self.Debuffs:Hide()
		end
		local main = self
		bdCore:hookEvent("unitframesUpdate", function() main:callback() end)

		self.Name:SetPoint('CENTER', self.Health, "CENTER", 0, 0)

		self.AuraBars:Hide()
		self.CombatIndicator:Hide()
		self.RestingIndicator:Hide()
		self.Curhp:Hide()
		self.Power:Hide()

	end,
	boss = function(self)
		-- update function
		function self:callback()
			if (not InCombatLockdown()) then
				self:SetSize(config.bosswidth, config.bossheight)

				-- boss frame
				if (config.bossenable) then
					bossanchor:Show()
					for k, frame in pairs(bossanchor.boss) do
						frame:Show()
					end
				elseif (config.bossenable) then
					bossanchor:Hide()
					for k, frame in pairs(bossanchor.boss) do
						frame:Hide()
					end
				end
			end

			self.Power:SetHeight(config.bosspower)

			self.Castbar:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 0, -config.castbarheight)
			self.Castbar.Icon:SetSize(config.castbarheight-bordersize, config.castbarheight-bordersize)

			self.Buffs:Hide()
			self.Debuffs:Hide()

			self.Auras:SetSize(config.bossdebuffsize*4, config.bossdebuffsize*2)
			self.Auras.size = config.bossdebuffsize
		end

		local main = self
		bdCore:hookEvent("unitframesUpdate", function() main:callback() end)
		
		self.AuraBars:Hide()
		
		self.Name:SetPoint('LEFT', self, "LEFT", 4, 0)
		self.Curhp:SetPoint('BOTTOMRIGHT', self.Power, "TOPRIGHT", -4, 2)
		self.CombatIndicator:Hide()

		-- Auras
		self.Auras = CreateFrame("Frame", nil, self)
		self.Auras:SetSize(72, 40)
		self.Auras.size = 18
		self.Auras:EnableMouse(false)
		self.Auras.initialAnchor  = "BOTTOMLEFT"
		self.Auras.spacing = 2
		self.Auras.num = 20
		self.Auras['growth-y'] = "UP"
		self.Auras['growth-x'] = "RIGHT"
		self.Auras.PostCreateIcon = function(Debuffs, button)
			bdCore:setBackdrop(button)
			button.cd:GetRegions():SetAlpha(0)
			button.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
			button:SetAlpha(0.8)
		end
		self.Auras:ClearAllPoints()
		self.Auras:SetPoint("BOTTOMLEFT", self.Power, "TOPLEFT", 2, 4)
		self.Auras:SetPoint("BOTTOMRIGHT", self.Power, "TOPRIGHT", 2, 4)

		self.Auras:Show()
		
		self.Auras.CustomFilter = function(element, unit, button, name, texture, count, debuffType, duration, expiration, caster, isStealable, nameplateShowSelf, spellID, canApply, isBossDebuff, casterIsPlayer, nameplateShowAll,timeMod, effect1, effect2, effect3)
			local allow = false;
			-- allow it if it's tracked in the ui and not blacklisted
			
			if (not caster or UnitIsUnit(caster, "player") or (not UnitIsPlayer(caster))) then
				allow = true
			end
			
			if (bdCore:filterAura(name, caster, isBossDebuff, nameplateShowAll, false)) then
				allow = true
			end

			return allow	
		end
		
		-- castbar
		self.Castbar:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", 0, -bordersize)
		self.Castbar.Icon:SetPoint("TOPLEFT", self.Castbar,"TOPRIGHT", bordersize, 0)
		
		self.Castbar:ClearAllPoints()
		self.Castbar.Text:SetPoint("LEFT", self.Castbar, "LEFT", 2, 0)
		self.Castbar.Text:SetJustifyH("LEFT")	
		self.Castbar.Time:SetPoint("BOTTOMRIGHT", self.Castbar, "TOPRIGHT", -2, 6)
		self.Castbar.Time:SetJustifyH("RIGHT")	
	end
}

local function updateConfig()
	config = bdCore.config.profile['Unit Frames']
	
	-- loop through our frames
	for unit, frame in pairs(bdframes) do
		
		-- castbars
		if (config.enablecastbars) then
			frame.Castbar:SetAlpha(1)
		else
			frame.Castbar:SetAlpha(0)
		end

		-- range
		frame.Range = {
			insideAlpha = config.inrangealpha,
			outsideAlpha = config.outofrangealpha,
		}
		
		-- buffs/aurabars
		if (unit == "player" or unit == "target") then
			if (config.bufftrackerstyle == "Icons") then
				frame.AuraBars:Hide()
				frame.Buffs:Show()
				frame.Debuffs:Show()
			elseif (config.bufftrackerstyle == "Aurabars") then
				frame.AuraBars:Show()
				frame.Buffs:Hide()
				frame.Debuffs:Hide()
			else
				frame.AuraBars:Hide()
				frame.Buffs:Hide()
				frame.Debuffs:Hide()
			end
		end
	end
end

local function kickable(self)
	if (self.notInterruptible) then
		self.Icon:SetDesaturated(1)
		self:SetStatusBarColor(0.7, 0.7, 0.7, 1)
	else
		self.Icon:SetDesaturated(false)
		self:SetStatusBarColor(.1, .4, .7, 1)
	end
end

oUF.colors.power['MANA'] = {46/255, 130/255, 215/255}
function unitframes.Layout(self,unit)
	bordersize = bdCore.config.persistent.General.border

	self:RegisterForClicks('AnyDown')
	self:SetScript('OnEnter', UnitFrame_OnEnter)
	self:SetScript('OnLeave', UnitFrame_OnLeave)
		
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
	self.Power:SetPoint("BOTTOMLEFT", self.Health, "TOPLEFT",0, bdCore.config.persistent.General.border)
	self.Power:SetPoint("BOTTOMRIGHT", self.Health, "TOPRIGHT",0, bdCore.config.persistent.General.border)
	self.Power:SetHeight(config.playertargetpowerheight)
	self.Power.frequentUpdates = true
	self.Power.colorTapping = true
	self.Power.colorDisconnected = true
	self.Power.colorPower = true
	self.Power.colorClass = true
	self.Power.colorReaction = true
	bdCore:setBackdrop(self.Power)
	
	-- Special Power Display (holy power, etc)
	self.ExtraResource = CreateFrame("frame", nil, self)
	self.ExtraResource:SetPoint("BOTTOMLEFT", self.Power, "TOPLEFT", 0, 2)
	self.ExtraResource:SetPoint("BOTTOMRIGHT", self.Power, "TOPRIGHT", 0, 2)
	self.ExtraResource:SetHeight(8)
	--self.ExtraResource:SetPoint("CENTER", UIParent)
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
	self.CombatIndicator = self.Health:CreateTexture(nil, "OVERLAY")
	self.CombatIndicator:SetSize(16, 16)
	self.CombatIndicator:SetPoint('LEFT', self.Health, 2, 0)
	
	-- Resting indicator
	self.RestingIndicator = self.Health:CreateTexture(nil, "OVERLAY")
	self.RestingIndicator:SetSize(16, 16)
	self.RestingIndicator:SetPoint('LEFT', self.Health, 2, 0)
	
	-- Range
	self.Range = {
		insideAlpha = config.inrangealpha,
		outsideAlpha = config.outofrangealpha,
	}
	
	-- Buffs / Debuffs
	self.Buffs = CreateFrame("Frame", nil, self)
	self.Buffs:SetSize(140, 40)
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
		button.cd:SetReverse(true)
		button.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
		button:SetAlpha(0.8)
	end
	
	self.Debuffs = CreateFrame("frame",nil,self)
	self.Debuffs:SetSize(config.playertargetwidth, 60)
	self.Debuffs.size = 28
	self.Debuffs:EnableMouse(false)
	self.Debuffs.initialAnchor  = "BOTTOMRIGHT"
	self.Debuffs.spacing = 2
	self.Debuffs.num = 20
	self.Debuffs['growth-y'] = "UP"
	self.Debuffs['growth-x'] = "LEFT"
	self.Debuffs:SetPoint("BOTTOMRIGHT", self.Power, "TOPRIGHT", 0, 2)
	self.Debuffs.PostCreateIcon = function(Debuffs, button)
		bdCore:setBackdrop(button)
		button.cd:GetRegions():SetAlpha(0)
		button.cd:SetReverse(true)
		button.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
		button:SetAlpha(0.8)
	end
	self.Debuffs:Hide()
	
	-- Auras
	self.AuraBars = self.AuraBars or CreateFrame("Frame", nil, self)
	self.AuraBars:SetHeight(2)
	self.AuraBars:SetPoint("BOTTOMLEFT", self.Power, "TOPLEFT", 0, 12)
	self.AuraBars:SetPoint("BOTTOMRIGHT", self.Power, "TOPRIGHT", 0, 12)
	
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
	
	self.AuraBars.filter = function(name, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, nameplateShowSelf, spellID, canApply, isBossDebuff, casterIsPlayer, nameplateShowAll, timeMod, effect1, effect2, effect3)
		if (bdCore:filterAura(name, unitCaster, isBossDebuff, nameplateShowAll, true) and config.bufftrackerstyle == "Aurabars") then
			if (unitCaster == "player" and duration ~= 0 and duration < 300) then
				return true 
			end
		end
	end
	
	-- Raid Icon
	self.RaidTargetIndicator = self.Health:CreateTexture(nil, "OVERLAY", nil, 1)
	self.RaidTargetIndicator:SetSize(12, 12)
	self.RaidTargetIndicator:SetPoint('CENTER', self, 0, 0)
	
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
	self.Castbar.bg:SetPoint("TOPLEFT", self.Castbar.Icon, "TOPLEFT", -bdCore.config.persistent.General.border, bdCore.config.persistent.General.border)
	self.Castbar.bg:SetPoint("BOTTOMRIGHT", self.Castbar.Icon, "BOTTOMRIGHT", bdCore.config.persistent.General.border, -bdCore.config.persistent.General.border)
	self.Castbar.SafeZone = self.Castbar:CreateTexture(nil, "OVERLAY")
	self.Castbar.SafeZone:SetVertexColor(0.85,0.10,0.10,0.20)
	self.Castbar.SafeZone:SetTexture(bdCore.media.flat)
	self.Castbar.Time = self.Castbar:CreateFontString(nil, "OVERLAY")
	self.Castbar.Time:SetFont(bdCore.media.font, 12, "OUTLINE")
	self.Castbar.Time:SetJustifyH("CENTER")
	self.Castbar.Time:SetPoint("CENTER", self.Castbar.Icon)

	self.Castbar.PostChannelStart = kickable
	self.Castbar.PostChannelUpdate = kickable
	self.Castbar.PostCastStart = kickable
	self.Castbar.PostCastDelayed = kickable
	self.Castbar.PostCastNotInterruptible = kickable
	self.Castbar.PostCastInterruptible = kickable

	bdframes[unit] = self

	local func = unit
	if (string.find(func, "boss")) then func = "boss" end
	local main = self
	unitframes.specific[func](main, false)
end

bdCore:hookEvent("unitframesUpdate", function(self)
	updateConfig()
end)

oUF:RegisterStyle("bdUnitFrames", unitframes.Layout)
oUF:SetActiveStyle("bdUnitFrames")
oUF:Factory(function(self)
	self:SetActiveStyle("bdUnitFrames")
	
	-- player
	local player = self:Spawn("player")
	player:SetPoint("RIGHT", UIParent, "CENTER", -(config.playertargetwidth/2+2), -220)
	bdCore:makeMovable(player)

	-- target
	local target = self:Spawn("target")
	target:SetPoint("LEFT", UIParent, "CENTER", (config.playertargetwidth/2+2), -220)
	bdCore:makeMovable(target)

	-- targetoftarget
	local targettarget = self:Spawn("targettarget")
	targettarget:SetPoint("LEFT", UIParent, "CENTER", (config.playertargetwidth/2+2), -220-config.playertargetheight-config.castbarheight-20)
	bdCore:makeMovable(targettarget)

	-- pet
	local pet = self:Spawn("pet")
	pet:SetPoint("LEFT", UIParent, "CENTER", -(config.playertargetwidth/2+2), -220-config.playertargetheight-config.castbarheight-20)
	pet:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", 0, -config.castbarheight-2)
	bdCore:makeMovable(pet)

	-- focus
	local focus = self:Spawn("focus")
	focus:SetPoint("TOP", UIParent, "TOP", 0, -30)
	bdCore:makeMovable(focus)
	
	-- boss
	bdCore:makeMovable(bossanchor)
	bossanchor.boss = {}
	for i = 1, 5 do
		bossanchor.boss[i] = oUF:Spawn("boss"..i, nil)
		bossanchor.boss[i]:SetParent(bossanchor)
		if (i == 1) then
			bossanchor.boss[i]:SetPoint("TOP", bossanchor, "TOP", 0, 0)
		else
			bossanchor.boss[i]:SetPoint("TOP", bossanchor.boss[i-1], "BOTTOM", 0, -60)
		end
		bossanchor.boss[i]:SetSize(config.bosswidth, config.bossheight)
	end

	-- trigger config
	bdCore:triggerEvent("unitframesUpdate")
end)

local addonDisabler = CreateFrame("frame", nil)
addonDisabler:RegisterEvent("ADDON_LOADED")
addonDisabler:SetScript("OnEvent", function(self, event, addon)
	if (IsAddOnLoaded("Blizzard_UnitFrame")) then
		DisableAddOn("Blizzard_UnitFrame")
	end
end)