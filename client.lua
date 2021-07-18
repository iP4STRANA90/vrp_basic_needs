
local toghud = true
local thirst = 0
local hunger = 0

RegisterNetEvent("hud")
AddEventHandler("hud", function()
    if toghud then 
        toghud = false
    else
        toghud = true
    end
end)

RegisterNetEvent("bassic_needs:returnBasics")
AddEventHandler("bassic_needs:returnBasics", function (rHunger, rThirst)
    hunger = rHunger
    thirst = rThirst
end)

Citizen.CreateThread(function()
    SetTimeout(20000, function()
        while true do
            Citizen.Wait(500)
            TriggerServerEvent("bassic_needs:getinfo")

            local player = PlayerPedId()
            local health = (GetEntityHealth(player) - 100)
            local armor = GetPedArmour(player)
            local oxy = GetPlayerUnderwaterTimeRemaining(PlayerId()) * 2.5

            SendNUIMessage({
                action = "updateStatusHud",
                show = toghud,
                health = health,
                armour = armor,
                hunger = hunger,
                thirst = thirst,
                oxygen = oxy,
                stress = 100 - GetPlayerSprintStaminaRemaining(PlayerId()),
            })
        end
    end)
end)
