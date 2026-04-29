local SELL_PRICE_TEXT = SELL_PRICE or "Sell Price"

local function RemoveSellPrice(tooltip)
    for _, region in ipairs({ tooltip:GetRegions() }) do
        if region:GetObjectType() == "FontString" then
            local text = region:GetText()
            if text and text:find(SELL_PRICE_TEXT, 1, true) then
                region:SetText("")
            end
        end
    end
end

TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, RemoveSellPrice)
