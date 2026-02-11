-- Midnight changes:
-- Using the OnTooltipAddMoney event which is safer for the UI stack
local function RemoveSellPrice(tooltip)
    if tooltip.shownMoneyFrames then
        for i = 1, tooltip.shownMoneyFrames do
            local moneyFrame = _G[tooltip:GetName() .. "MoneyFrame" .. i]
            if moneyFrame then
                -- Only hiding the frame visually, not modifying it now:
                moneyFrame:Hide()
            end
        end
    end
end

TooltipDataProcessor.AddLinePostCall(Enum.TooltipDataLineType.SellPrice, RemoveSellPrice)
