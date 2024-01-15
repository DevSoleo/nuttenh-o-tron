local lastInvite = 0

local onAddonMessage = CreateFrame("Frame")
onAddonMessage:RegisterEvent("CHAT_MSG_ADDON")
onAddonMessage:SetScript("OnEvent", function(self, event, prefix, message, channel, sender)
    -- On vérifie si le message est adressé à notre addon
    if (prefix ~= PREFIX or sender == UnitName("PLAYER")) then
        return
    end

    -- Same invite
    if (message == "invite") then
        if (lastInvite <= time() - 2) then
            local message = sender .. " vous invite à participer à son event !"

            StaticPopupDialogs["NEW_INVITE"] = {
                text = message,
                button1 = "Accepter",
                button2 = "Refuser",
                OnAccept = function() 
                   print("oui")
                end,
                timeout = 60,
                whileDead = true,
                hideOnEscape = true,
                preferredIndex = 3,
            }

            StaticPopup_Show("NEW_INVITE")
        end
    elseif (message == "close_invite") then
        StaticPopup_Hide("NEW_INVITE")
    end

    lastInvite = time()
end)