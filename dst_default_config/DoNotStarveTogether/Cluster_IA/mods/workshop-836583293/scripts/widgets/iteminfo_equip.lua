local UIAnim = require "widgets/uianim"
local Text = require "widgets/text"
local Image = require "widgets/image"
local Widget = require "widgets/widget"
local ItemInfoDesc = require "widgets/iteminfo_desc"

local POSITIONS = {
	NONE = 0,
	DEFAULT = 1,
	BACKPACK = 2,
	MOVING = 3,
}

local ItemInfoEquip = Class(Widget, function(self, equipslot, max_width, max_height)
    Widget._ctor(self, "ItemInfoEquip")
    self.equipslot = equipslot
	
	--self.max_width = max_width
	--self.max_height = max_height
	
	self.margin_h = 0
	self.margin_v = 0
	
	self.current_pos = POSITIONS.NONE
	
	self.time_since_last_update = 0
	
	self.width = 0
	self.height = 0
	
	if MOD_ITEMINFO.SHOW_BACKGROUND then
		self.bg = self:AddChild(Image("images/iteminfo_bg.xml", "iteminfo_bg.tex"))
	end
	
	self.item_desc = self:AddChild(ItemInfoDesc(nil))
	
	self.prefab_image = self:AddChild(Image("images/inventoryimages.xml", "hambat.tex"))
	
	self:SetClickable(false)
	self:StartUpdating()
end)

function ItemInfoEquip:GetDescSize()
	return self.item_desc:GetSize()
end

--[[ function ItemInfoEquip:UpdatePrefabImage()
	local name = self.item_desc.item.prefab
	
	self.prefab_image:SetTexture("images/inventoryimages.xml", name .. ".tex")
end ]]--

-- [19/08/2020] Fix by 乐十画 
function ItemInfoEquip:UpdatePrefabImage()
	local name = self.item_desc.item.prefab..".tex"
	local atlas = GetInventoryItemAtlas(name)

	if name and atlas then
		self.prefab_image:SetTexture(atlas, name)
	end
end

function ItemInfoEquip:RefreshInfo()
	self.item_desc:RefreshInfo()
	self:UpdatePrefabImage()
	self:Show()
end

function ItemInfoEquip:ShowInfo()
	self.item_desc:UpdateInfo()
	self:Show()
end

function ItemInfoEquip:HideInfo()
	self:Hide()
	self.item_desc:KillAllChildren()
end

local ImageSpacing = 20
local RowHeight = 48

function ItemInfoEquip:GetSize()
	local desc_w, desc_h = self.item_desc:GetSize()
	return desc_w > 0 and desc_w + ImageSpacing + 64 or 64, desc_h > 64 and desc_h or 64
end

function ItemInfoEquip:UpdateChildrenPos()
	local pos = self:GetPosition()
	
	if MOD_ITEMINFO.SHOW_BACKGROUND then
		local w, h = self:GetSize()
		self.bg:SetSize(w + 20, h + 20)
		self.bg:SetPosition(pos)
	end
	
	local desc_width, desc_height = self:GetDescSize()
	
	if desc_width > 0 then
		local img_w, img_h = self.prefab_image:GetSize()
		local left = (img_w + ImageSpacing + desc_width)/2 * -1
		
		local img_x = left + img_w/2
		self.prefab_image:SetPosition(pos.x + img_x, pos.y, pos.z)
		
		local item_desc_x = left + img_w + ImageSpacing + desc_width/2
		self.item_desc:SetPosition(pos.x + item_desc_x, pos.y - desc_height/2, pos.z)
	else
		self.prefab_image:SetPosition(pos)
	end
end


function ItemInfoEquip:OnUpdate(dt)
	
	if ThePlayer.replica.inventory:GetEquippedItem(self.equipslot) ~= nil then
		self.item_desc.item = ThePlayer.replica.inventory:GetEquippedItem(self.equipslot)
		
		if self.time_since_last_update > MOD_ITEMINFO.EQUIP_UPDATE_TIME then
			self.time_since_last_update = 0
			self:RefreshInfo()
		else
			self.time_since_last_update = self.time_since_last_update + dt
		end
		
		self:UpdateChildrenPos()
	else
		self:HideInfo()
	end
end

return ItemInfoEquip