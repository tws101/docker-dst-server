local UIAnim = require "widgets/uianim"
local Text = require "widgets/text"
local Image = require "widgets/image"
local Widget = require "widgets/widget"

local ItemInfoDesc = Class(Widget, function(self, slot)
    Widget._ctor(self, "ItemInfoDesc")
	
    self.slot = slot
	self.container = nil -- Set from containerwidget.Open, hooked from modmain
	
	self.width = 0
	self.height = 0
	
	self.relative_scale = 1
	
	self.num_rows = 0
	
	self.time_since_last_update = 0
	
	self.active = false
	
	self:SetClickable(false)
end)

-- ##################################################
-- Value formatters
-- ##################################################

local function Format1D(value)
	if value ~= "???" then
		return math.floor(value * 10 + 0.5) / 10
	else
		return "???"
	end
end

local function FormatInt(value)
	return math.floor(value + 0.5)
end

local function FormatTime(t)
	if MOD_ITEMINFO.TIME_FORMAT == MOD_ITEMINFO.TIME_FORMATS.HOURS then
		if t == 0 then
			return "0"
		else
			local	hours = string.format("%01.f", math.floor(t/3600))
			local	mins = string.format("%02.f", math.floor(t/60 - (hours*60)))
			local	secs = string.format("%02.f", math.floor(t - hours*3600 - mins *60))
			
			if hours == "0" and mins == "00" then
				return secs
			elseif hours == "0" then
				return mins .. ":" .. secs
			else
				return hours .. ":" .. mins .. ":" .. secs
			end
			
		end
	elseif MOD_ITEMINFO.TIME_FORMAT == MOD_ITEMINFO.TIME_FORMATS.DAYS then
		if t == 0 then
			return "0d"
		else
			return Format1D(t/TUNING.TOTAL_DAY_TIME) .. "d"
		end
	end
	
	return "???"
end


-- ##################################################
-- Child adders and positioners
-- ##################################################

-- Spacing between the image and the text
local Spacing = 5

-- Spacing between same row childs
local ChildSpacing = 10

local ImageWidth = 32
local RowHeight = 48

function ItemInfoDesc:AddChild1(img, txt)
	local pos_y = self.num_rows * RowHeight + RowHeight/2

	local txt_w = txt:GetRegionSize()
	
	local width = ImageWidth + txt_w + Spacing
	
	if width > self.width then
		self.width = width
	end
	self.height = self.height + RowHeight
	
	local left = width/2 * -1
	
	img:SetPosition(left + ImageWidth/2, pos_y)
	txt:SetPosition(left + ImageWidth + txt_w/2 + Spacing, pos_y )
	
	self:AddChild(img)
	self:AddChild(txt)
	
	self.num_rows = self.num_rows + 1
end

function ItemInfoDesc:AddChild2(img1, txt1, img2, txt2)
	local pos_y = self.num_rows * RowHeight + RowHeight/2

	local txt1_w = txt1:GetRegionSize()
	local txt2_w = txt2:GetRegionSize()
	
	local width = ImageWidth * 2 + txt1_w + txt2_w + Spacing * 2 + ChildSpacing
	
	if width > self.width then
		self.width = width
	end
	self.height = self.height + RowHeight
	
	local left = width/2 * -1
	
	img1:SetPosition(left + ImageWidth/2, pos_y)
	txt1:SetPosition(left + ImageWidth + txt1_w/2 + Spacing, pos_y )
	
	img2:SetPosition(left + ImageWidth * 1.5 + txt1_w + Spacing + ChildSpacing, pos_y)
	txt2:SetPosition(left + ImageWidth * 2 + txt1_w + txt2_w/2 + Spacing * 2 + ChildSpacing, pos_y )
	
	self:AddChild(img1)
	self:AddChild(txt1)
	self:AddChild(img2)
	self:AddChild(txt2)
	
	self.num_rows = self.num_rows + 1
end

function ItemInfoDesc:AddChild3(img1, txt1, img2, txt2, img3, txt3)
	local pos_y = self.num_rows * RowHeight + RowHeight/2

	local txt1_w = txt1:GetRegionSize()
	local txt2_w = txt2:GetRegionSize()
	local txt3_w = txt3:GetRegionSize()
	
	local width = ImageWidth * 3 + txt1_w + txt2_w + txt3_w + Spacing * 3 + ChildSpacing * 2
	
	if width > self.width then
		self.width = width
	end
	self.height = self.height + RowHeight
	
	local left = width/2 * -1
	
	img1:SetPosition(left + ImageWidth/2, pos_y)
	txt1:SetPosition(left + ImageWidth + txt1_w/2 + Spacing, pos_y )
	
	img2:SetPosition(left + ImageWidth * 1.5 + txt1_w + Spacing + ChildSpacing, pos_y)
	txt2:SetPosition(left + ImageWidth * 2 + txt1_w + txt2_w/2 + Spacing * 2 + ChildSpacing, pos_y )
	
	img3:SetPosition(left + ImageWidth * 2.5 + txt1_w + txt2_w + Spacing * 2 + ChildSpacing * 2, pos_y )
	txt3:SetPosition(left + ImageWidth * 3 + txt1_w + txt2_w + txt3_w/2 + Spacing * 3 + ChildSpacing * 2, pos_y )
	
	self:AddChild(img1)
	self:AddChild(txt1)
	self:AddChild(img2)
	self:AddChild(txt2)
	self:AddChild(img3)
	self:AddChild(txt3)
	
	self.num_rows = self.num_rows + 1
end

-- ##################################################
-- Component row builders
-- ##################################################
function ItemInfoDesc:AddPerishableRow(inst)
	-- Only the widget tile knows what container it belongs to, gotta pass it to the fetcher so it can canculate perish values
	local freshness, perishtime, max_perishtime = MOD_ITEMINFO.INFO_FETCHER:GetPerishValues(inst, self.container)
	
	local img1 = Image("images/iteminfo_images.xml", "freshness.tex")
	local txt1 = Text(NUMBERFONT, 42)
	txt1:SetString(Format1D(freshness * 100) .. "%" )
	
	if not MOD_ITEMINFO.INFO_FETCHER:IsEdible(inst) or MOD_ITEMINFO.PERISHABLE == MOD_ITEMINFO.PERISH_DISPLAY.PERISH_ONLY then
		local img2 = Image("images/iteminfo_images.xml", "spoiled.tex")
		local txt2 = Text(NUMBERFONT, 42)
		txt2:SetString(FormatTime(perishtime))
	
		self:AddChild2(img1, txt1, img2, txt2)
	elseif MOD_ITEMINFO.PERISHABLE == MOD_ITEMINFO.PERISH_DISPLAY.STALE_PERISH then
		local stale_time = perishtime - max_perishtime/2

		if stale_time > 0 then
			local img2 = Image("images/iteminfo_images.xml", "stale.tex")
			local txt2 = Text(NUMBERFONT, 42)
			txt2:SetString(FormatTime(stale_time))
			self:AddChild2(img1, txt1, img2, txt2)
		else
			local img2 = Image("images/iteminfo_images.xml", "spoiled.tex")
			local txt2 = Text(NUMBERFONT, 42)
			txt2:SetString(FormatTime(perishtime))
			self:AddChild2(img1, txt1, img2, txt2)
		end
	elseif MOD_ITEMINFO.PERISHABLE == MOD_ITEMINFO.PERISH_DISPLAY.BOTH then
		local img2 = Image("images/iteminfo_images.xml", "spoiled.tex")
		local txt2 = Text(NUMBERFONT, 42)
		txt2:SetString(FormatTime(perishtime))
	
		self:AddChild2(img1, txt1, img2, txt2)
		
		local stale_time = perishtime - max_perishtime/2
		
		if stale_time > 0 then
			local img3 = Image("images/iteminfo_images.xml", "stale.tex")
			local txt3 = Text(NUMBERFONT, 42)
			txt3:SetString(FormatTime(stale_time))
			
			self:AddChild1(img3, txt3)
		end
	end
end

function ItemInfoDesc:AddDappernessRow(inst)
	local dapperness = MOD_ITEMINFO.INFO_FETCHER:GetDappernessValue(inst)
	
	local img = Image("images/iteminfo_images.xml", "sanity.tex")
	local txt = Text(NUMBERFONT, 42)
	txt:SetString(Format1D(dapperness).. "/min")
	
	self:AddChild1(img, txt)
end

function ItemInfoDesc:AddInsulatorRow(inst)
	local insulation, insulation_type = MOD_ITEMINFO.INFO_FETCHER:GetInsulationValues(inst)
	
	local img = Image("images/iteminfo_images.xml", "insulation_" .. insulation_type .. ".tex")
	local txt = Text(NUMBERFONT, 42)
	txt:SetString(insulation)
	
	self:AddChild1(img, txt)
end

function ItemInfoDesc:AddFueledRow(inst)
	local fueltime, fueltype = MOD_ITEMINFO.INFO_FETCHER:GetFuelValue(inst)
	
	local img = Image("images/iteminfo_images.xml","fuel_" .. fueltype .. ".tex")
	local txt = Text(NUMBERFONT, 42)
	txt:SetString(FormatTime(fueltime))
	
	self:AddChild1(img, txt)
end

function ItemInfoDesc:AddWaterproofRow(inst)

	local waterproof = MOD_ITEMINFO.INFO_FETCHER:GetWaterproofValue(inst)
	
	local img = Image("images/iteminfo_images.xml", "waterproof.tex")
	local txt = Text(NUMBERFONT, 42)
	txt:SetString(FormatInt(waterproof * 100) .. "%")
	
	self:AddChild1(img, txt)
end

function ItemInfoDesc:AddWeaponRow(inst)
	local damage = MOD_ITEMINFO.INFO_FETCHER:GetWeaponDamage(self.item)
	
	local img = Image("images/iteminfo_images.xml", "weapon.tex")
	local txt = Text(NUMBERFONT, 42)
	txt:SetString(Format1D(damage))
	
	
	self:AddChild1(img, txt)
end

function ItemInfoDesc:AddFiniteUsesRow(inst)
	local usesleft, maxuses = MOD_ITEMINFO.INFO_FETCHER:GetFiniteUses(self.item)
	
	local img = Image("images/iteminfo_images.xml", "uses.tex")
	local txt = Text(NUMBERFONT, 42)
	txt:SetString(FormatInt(usesleft) .. "/" .. maxuses)
	
	self:AddChild1(img, txt)
end

function ItemInfoDesc:AddArmorRow(inst)
	local absorb, hp = MOD_ITEMINFO.INFO_FETCHER:GetArmorValues(inst)
	
	local img1 = Image("images/iteminfo_images.xml", "armor.tex")
	local txt1 = Text(NUMBERFONT, 42)
	txt1:SetString(FormatInt(absorb * 100) .. "%")
	
	local img2 = Image("images/iteminfo_images.xml", "health.tex")
	local txt2 = Text(NUMBERFONT, 42)
	txt2:SetString(FormatInt(hp))
	
	
	self:AddChild2(img1, txt1, img2, txt2)
end

function ItemInfoDesc:AddHealerRow(inst)

	local health = MOD_ITEMINFO.INFO_FETCHER:GetHealerValue(inst)
	
	local img = Image("images/iteminfo_images.xml", "health.tex")
	local txt = Text(NUMBERFONT, 42)
	txt:SetString(health)
	
	self:AddChild1(img, txt)
end

function ItemInfoDesc:AddEdibleRow(inst)
	local hunger, sanity, health = MOD_ITEMINFO.INFO_FETCHER:GetEdibleValues(inst)
	
	if hunger ~= 0 and sanity ~= 0 and health ~= 0 then
		local img1 = Image("images/iteminfo_images.xml", "hunger.tex")
		local txt1 = Text(NUMBERFONT, 42)
		txt1:SetString(Format1D(hunger))
		
		local img2 = Image("images/iteminfo_images.xml", "sanity.tex")
		local txt2 = Text(NUMBERFONT, 42)
		txt2:SetString(Format1D(sanity))
		
		local img3 = Image("images/iteminfo_images.xml", "health.tex")
		local txt3 = Text(NUMBERFONT, 42)
		txt3:SetString(Format1D(health))
		
		self:AddChild3(img1, txt1, img2, txt2, img3, txt3)
	elseif hunger ~= 0 and sanity ~= 0 then
		local img1 = Image("images/iteminfo_images.xml", "hunger.tex")
		local txt1 = Text(NUMBERFONT, 42)
		txt1:SetString(Format1D(hunger))
		
		local img2 = Image("images/iteminfo_images.xml", "sanity.tex")
		local txt2 = Text(NUMBERFONT, 42)
		txt2:SetString(Format1D(sanity))
		
		self:AddChild2(img1, txt1, img2, txt2)
	elseif hunger ~= 0 and health ~= 0 then
		local img1 = Image("images/iteminfo_images.xml", "hunger.tex")
		local txt1 = Text(NUMBERFONT, 42)
		txt1:SetString(Format1D(hunger))
		
		local img3 = Image("images/iteminfo_images.xml", "health.tex")
		local txt3 = Text(NUMBERFONT, 42)
		txt3:SetString(Format1D(health))
		
		self:AddChild2(img1, txt1, img3, txt3)
	elseif sanity ~= 0 and health ~= 0 then
		local img2 = Image("images/iteminfo_images.xml", "sanity.tex")
		local txt2 = Text(NUMBERFONT, 42)
		txt2:SetString(Format1D(sanity))
		
		local img3 = Image("images/iteminfo_images.xml", "health.tex")
		local txt3 = Text(NUMBERFONT, 42)
		txt3:SetString(Format1D(health))
		
		self:AddChild2(img2, txt2, img3, txt3)
	elseif hunger ~= 0 then 
		local img1 = Image("images/iteminfo_images.xml", "hunger.tex")
		local txt1 = Text(NUMBERFONT, 42)
		txt1:SetString(Format1D(hunger))
		
		self:AddChild1(img1, txt1)
	elseif sanity ~= 0 then 
		local img2 = Image("images/iteminfo_images.xml", "sanity.tex")
		local txt2 = Text(NUMBERFONT, 42)
		txt2:SetString(Format1D(sanity))

		self:AddChild1(img2, txt2)
	elseif health ~= 0 then 
		local img3 = Image("images/iteminfo_images.xml", "health.tex")
		local txt3 = Text(NUMBERFONT, 42)
		txt3:SetString(Format1D(health))
		
		self:AddChild1(img3, txt3)
	end
end

function ItemInfoDesc:AddPrefabNameRow(inst)
	local name = inst.prefab
	
	local img = Image("images/iteminfo_images.xml", "label.tex")
	local txt = Text(NUMBERFONT, 42)
	txt:SetString(name)
	
	self:AddChild1(img, txt)
end

-- ##################################################
-- Component checking and row builders calling based on that.
-- ##################################################

local IgnoredPrefabs =
{
	blueprint = true,
	heatrock = true,
	fireflies = true
}

function ItemInfoDesc:ShouldBeIgnored(inst)
	if IgnoredPrefabs[inst.prefab] then return true end
	return false
end

function ItemInfoDesc:HasValidItem()
	return self.item and self.item.replica and self.item.replica.inventoryitem and self.item.replica.inventoryitem.classified
end

function ItemInfoDesc:UpdateInfo()
	self.num_rows = 0
	
	self.width = 0
	self.height = 0
	
	--if not self.item or not self.item.replica or not self.item.replica.inventoryitem or not self.item.replica.inventoryitem.classified then return end
	if not self:HasValidItem() then return end
	
	if not self:ShouldBeIgnored(self.item) then
		
		if not MOD_ITEMINFO.INFO_FETCHER:IsInCache(self.item) then
			MOD_ITEMINFO.INFO_FETCHER:AddItemToCache(self.item)
		end
		
		if MOD_ITEMINFO.INFO_FETCHER:HasDapperness(self.item) then
			self:AddDappernessRow(self.item)
		end
		
		if MOD_ITEMINFO.INFO_FETCHER:IsPerishable(self.item) then
			self:AddPerishableRow(self.item)
		end
		
		if MOD_ITEMINFO.INFO_FETCHER:IsInsulator(self.item) then
			self:AddInsulatorRow(self.item)
		end
		
		if MOD_ITEMINFO.INFO_FETCHER:IsWaterproofer(self.item) then
			self:AddWaterproofRow(self.item)
		end
		
		if MOD_ITEMINFO.INFO_FETCHER:HasFiniteUses(self.item) then
			self:AddFiniteUsesRow(self.item)
		end
		
		if MOD_ITEMINFO.INFO_FETCHER:IsWeapon(self.item) then
			self:AddWeaponRow(self.item)
		end
		
		if MOD_ITEMINFO.INFO_FETCHER:IsFueled(self.item) then
			self:AddFueledRow(self.item)
		end
		
		if MOD_ITEMINFO.INFO_FETCHER:IsArmor(self.item) then
			self:AddArmorRow(self.item)
		end
		
		if MOD_ITEMINFO.INFO_FETCHER:IsHealer(self.item) then
			self:AddHealerRow(self.item)
		end
		
		if MOD_ITEMINFO.INFO_FETCHER:IsEdible(self.item) then
			if 	MOD_ITEMINFO.INFO_FETCHER:CanEat(self.item) then
				self:AddEdibleRow(self.item)
			end
		end
		
		
	end
	
	if MOD_ITEMINFO.SHOW_PREFABNAME then
		self:AddPrefabNameRow(self.item)
	end
end

-- ##################################################
-- Size getters
-- ##################################################

function ItemInfoDesc:GetSize()
	return self.width, self.height
end

function ItemInfoDesc:GetWorldSize()
	--local scale = self:GetLooseScale() -- We could use this, but when the widget plays the scale up anim the position is gonna get messed up.
	-- Instead, let's use the scale it's eventually going to have
	return self.width * MOD_ITEMINFO.INFO_SCALE, self.height * MOD_ITEMINFO.INFO_SCALE
end

-- ##################################################
-- Show/hide info functions
-- ##################################################

function ItemInfoDesc:RefreshInfo()
	-- Killing all children and rebuilding the widget is cheaper than indexing the controls, checking if they're up to date and then updating them
	-- ... it's also a lot simpler
	-- Maybe try adding EventListeners for % change? Still rebuild, but only when there's actual change.
	-- And still update. Check if the item has changed/there's no item in the slot.
	-- We'd have to index all values though. And the item.
	-- Need to think about it...
	self:KillAllChildren()
	self:UpdateInfo()
	
	self:Show()
end

function ItemInfoDesc:DoShowAnim()
	if self.anim_done then return end
	
	self:SetScale(self.relative_scale/1.3)
	self:ScaleTo(self.relative_scale/1.3, self.relative_scale, .125)
	
	self.anim_done = true
end

function ItemInfoDesc:ShowInfo()
	if self.shown then return end

	self:KillAllChildren()
	self:UpdateInfo()
	self:UpdatePos()
	self:DoShowAnim()
	
	self:Show()
end

function ItemInfoDesc:HideInfo()
	self:Hide()
	
	self:KillAllChildren()
end

-- ##################################################
-- HUD positioning logic
-- ##################################################

function ItemInfoDesc:UpdatePos()
	local pos = self.slot:GetWorldPosition()
	local width, height = self:GetWorldSize()
	
	
	local offsetx, offsety
	offsetx = 0
	offsety = 0
	
	if not TheInput:ControllerAttached() then
		local scale = ThePlayer.HUD.controls.bottom_root:GetScale()
		
		if not self.container then
			offsety = 96 * scale.y
		elseif self.container:HasTag("backpack") then
			offsety = 96 * scale.y
			
			local screen_width, screen_height = TheSim:GetScreenSize()
			
			if pos.x + width/2 >= screen_width then
				offsetx = (screen_width - pos.x) - width/2
			end
		else -- regular container (chest, icebox, package)
			offsety = height * -1 -16 * scale.y
		end
		
		self:UpdatePosition(pos.x + offsetx, pos.y + offsety)
	else
		local scale = ThePlayer.HUD.controls.inv:GetScale()

		if not self.container then
			offsetx = self.width/2 + 64 * scale.x
			offsety = 196 * scale.y
		else -- regular container (chest, icebox, package)
			offsety = pos.y + self.height * -1 -32 * scale.y
		end
		
		if not self.waspositioned then
			self:UpdatePosition(pos.x + offsetx, offsety)
			self.waspositioned = true
		end
		
		if not self.moving then
			self.moving = true
			self:MoveTo(self:GetPosition(), Vector3(pos.x + offsetx, offsety, 0), 0.125, function() self.moving = false end)
		end
	end
	
end

-- ##################################################
-- Update events and functions
-- ##################################################

ItemInfoDesc._StartUpdating = ItemInfoDesc.StartUpdating
function ItemInfoDesc:StartUpdating()
	self:_StartUpdating()
	self.active = true
end

ItemInfoDesc._StopUpdating = ItemInfoDesc.StopUpdating
function ItemInfoDesc:StopUpdating()
	self:_StopUpdating()
	self.active = false
end

-- Kills all its children, hides itself and stops updating next time it updates
function ItemInfoDesc:SetInactive()
	self.active = false
end

function ItemInfoDesc:OnUpdate(dt)
	self.time_since_last_update = self.time_since_last_update + dt
	
	if not self.active then
		self.time_since_last_update = 0
		self:HideInfo()
		self.anim_done = false
		self:StopUpdating()
		return
	end
	
	if self.time_since_last_update > MOD_ITEMINFO.SLOT_UPDATE_TIME then
		self.time_since_last_update = 0
		
		if self.slot and self.slot.tile and self.slot.tile.item then
			self.item = self.slot.tile.item
			self:RefreshInfo()
			
			self:UpdatePos()
			
			if not self.anim_done then
				self:DoShowAnim()
			end
		else
			self.anim_done = false
			self:KillAllChildren()
		end
	end
end

return ItemInfoDesc