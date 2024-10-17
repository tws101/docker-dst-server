local UIAnim = require "widgets/uianim"
local Text = require "widgets/text"
local Image = require "widgets/image"
local Widget = require "widgets/widget"
local ItemInfoDesc = require "widgets/iteminfo_desc"
local ItemInfoEquip = require("widgets/iteminfo_equip")

local POSITIONS = {
	NONE = 0,
	DEFAULT = 1,
	BACKPACK = 2,
	MOVING = 3,
}

local SLOTS = 
{
	HANDS = "hands",
	BODY = "body",
	HEAD = "head",
	BACK = "back",
	NECK = "neck",
}

local ItemInfoEquipManager = Class(Widget, function(self, root)
    Widget._ctor(self, "ItemInfoEquipManager")
	
	self.root = root
	
	self.current_pos = POSITIONS.NONE
	
	self.time_since_last_update = 0
	
	self.equips = {hands = nil, body = nil, back = nil, neck = nil, head = nil}
	
	self:SetClickable(false)
	self:StartUpdating()
end)

function ItemInfoEquipManager:AddEquip(equipslot)
	self.equips[equipslot] = self:AddChild(ItemInfoEquip(equipslot))
	self.equips[equipslot]:Show()
end

local function IsBackpackOpen()
	local body = nil
	if not EQUIPSLOTS.BACK then
		body = ThePlayer.replica.inventory:GetEquippedItem(EQUIPSLOTS.BODY)
	else
		body = ThePlayer.replica.inventory:GetEquippedItem(EQUIPSLOTS.BACK)
	end
	
	if body and body.replica.container ~= nil and body.replica.container:IsOpenedBy(ThePlayer) then return true end
	
	return false
end

function ItemInfoEquipManager:SetPosValue(new_pos_value)
	self.current_pos = new_pos_value
end

function ItemInfoEquipManager:UpdatePos()
	local pos = self:GetPosition()
	
	local default_pos = Vector3(MOD_ITEMINFO.MARGINH * -1, MOD_ITEMINFO.MARGINV, 0)
	local backpack_pos = Vector3(-250, MOD_ITEMINFO.MARGINV, 0)
	
	if IsBackpackOpen() and not TheInput:ControllerAttached() then
		if pos.x > -250 then
			if self.current_pos == POSITIONS.DEFAULT or self.current_pos == POSITIONS.NONE then
				self.current_pos = POSITIONS.MOVING
				self:MoveTo(self:GetPosition(), backpack_pos, .125, self.SetPosValue(self, POSITIONS.BACKPACK))
			end
		end
	else
		if self.current_pos == POSITIONS.BACKPACK or self.current_pos == POSITIONS.NONE then
			self.current_pos = POSITIONS.MOVING
			self:MoveTo(self:GetPosition(), default_pos, .125, self.SetPosValue(self, POSITIONS.DEFAULT))
		end
	end
end

function ItemInfoEquipManager:OnUpdate(dt)

	self:UpdatePos()

	local posy = 0
	
	if self.equips.hands and self.equips.hands.shown then
		local w, h = self.equips.hands:GetSize()
		self.equips.hands:SetPosition(0, posy + h/2 * MOD_ITEMINFO.EQUIP_SCALE)
		posy = posy + h/2 + (MOD_ITEMINFO.EQUIP_SPACING) * MOD_ITEMINFO.EQUIP_SCALE
	end
	
	if self.equips.body and self.equips.body.shown then
		local w, h = self.equips.body:GetSize()
		self.equips.body:SetPosition(0, posy + h/2 * MOD_ITEMINFO.EQUIP_SCALE)
		posy = posy + h/2 + (MOD_ITEMINFO.EQUIP_SPACING) * MOD_ITEMINFO.EQUIP_SCALE
	end
	
	if self.equips.back and self.equips.back.shown then
		local w, h = self.equips.back:GetSize()
		self.equips.back:SetPosition(0, posy + h/2 * MOD_ITEMINFO.EQUIP_SCALE)
		posy = posy + h/2 + (MOD_ITEMINFO.EQUIP_SPACING) * MOD_ITEMINFO.EQUIP_SCALE
	end
	
	if self.equips.neck and self.equips.neck.shown then
		local w, h = self.equips.neck:GetSize()
		self.equips.neck:SetPosition(0, posy + h/2 * MOD_ITEMINFO.EQUIP_SCALE)
		posy = posy + h/2 + (MOD_ITEMINFO.EQUIP_SPACING) * MOD_ITEMINFO.EQUIP_SCALE
	end
	
	if self.equips.head and self.equips.head.shown then
		local w, h = self.equips.head:GetSize()
		self.equips.head:SetPosition(0, posy + h/2 * MOD_ITEMINFO.EQUIP_SCALE)
		posy = posy + h/2 + (MOD_ITEMINFO.EQUIP_SPACING) * MOD_ITEMINFO.EQUIP_SCALE
	end
	
end

return ItemInfoEquipManager