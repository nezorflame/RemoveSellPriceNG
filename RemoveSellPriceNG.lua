-- Sourced from GameTooltip_ClearMoney:
-- https://github.com/Gethe/wow-ui-source/blob/live/Interface/FrameXML/GameTooltip.lua#L474
function RemoveSellPrice(tooltip, lineData)
    if (not tooltip.shownMoneyFrames) then
        return;
    end

    local moneyFrame;
    for i = 1, tooltip.shownMoneyFrames do
        moneyFrame = _G[tooltip:GetName() .. "MoneyFrame" .. i];
        if (moneyFrame) then
            moneyFrame:Hide();
            MoneyFrame_SetType(moneyFrame, "STATIC");
        end
    end
    tooltip.shownMoneyFrames = nil
end

-- The new way to add tooltip changes as per 10.0.2 API changes:
-- https://wowpedia.fandom.com/wiki/Patch_10.0.2/API_changes
TooltipDataProcessor.AddLinePostCall(Enum.TooltipDataLineType.SellPrice, RemoveSellPrice)
