function toggleInviteSubmitButton()
    if (hasInviteToSend(getInviteList())) then
        B_SubmitInvites:Enable()
    else
        B_SubmitInvites:Disable()
    end
end

function CB_GuildPlayers_OnClick(self)
    toggleInviteSubmitButton()
end

function CB_RaidPlayers_OnClick(self)
    CB_PartyPlayers:SetChecked(true)

    if (self:GetChecked()) then
        CB_PartyPlayers:Disable()
    else
        CB_PartyPlayers:Enable()
    end

    toggleInviteSubmitButton()
end

function CB_PartyPlayers_OnClick(self)
    toggleInviteSubmitButton()
end

function B_PlayerNameToInviteList_OnClick(self)
    if (addPlayerToInviteList(EB_InvitedPlayerName:GetText())) then
        EB_InvitedPlayerName:SetText("")
        EB_InvitedPlayerName:ClearFocus()
    end
end

function B_TargetToInviteList_OnClick(self)
    if (UnitName("target") ~= nil and UnitIsPlayer("target") == 1) then
        addPlayerToInviteList(UnitName("target"))
    end
end

function B_BackToEventKeyFrame_OnClick(self)
    F_Invite:Hide()
end

function B_SubmitInvites_OnClick(self)
    if (sendInvites(getInviteList(), EB_InvitedPlayerName:GetText())) then
        F_Invite:Hide()
        F_AdminPanel:Show()

        displayMissions(str_split("T-5-Zgurt le maléfique_C-Soleo_P-1-Chauve", "_"))
    end
end