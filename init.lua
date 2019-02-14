local addon, bdUnitframes = ...

--===================================================================
-- Configuration
--===================================================================


--===================================================================
-- Fonts
--===================================================================
local large = CreateFont("BDUF_LARGE")
large:SetFont(bdCore.media.font, 15, "OUTLINE")
large:SetShadowColor(0, 0, 0)
large:SetShadowOffset(0, 0)

local medium = CreateFont("BDUF_MEDIUM")
medium:SetFont(bdCore.media.font, 15, "OUTLINE")
medium:SetShadowColor(0, 0, 0)
medium:SetShadowOffset(0, 0)

local small = CreateFont("BDUF_MONO")
small:SetFont(bdCore.media.font, 14, "MONOCHROME")
small:SetShadowColor(0, 0, 0)
small:SetShadowOffset(0, 0)