
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

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        TriggerServerEvent("bassic_needs:getinfo")
        local player = PlayerPedId()       
        SendNUIMessage({
            action = "updateStatusHud",
            show = toghud,
            hunger = hunger,
            thirst = thirst,
            stress = 100 - GetPlayerSprintStaminaRemaining(PlayerId()),
        })
    end
end)

RegisterNetEvent("bassic_needs:returnBasics")
AddEventHandler("bassic_needs:returnBasics", function (rHunger, rThirst)
    hunger = rHunger
    thirst = rThirst
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        local player = PlayerPedId()
        local health = (GetEntityHealth(player) - 100)
        local armor = GetPedArmour(player)
        local oxy = GetPlayerUnderwaterTimeRemaining(PlayerId()) * 2.5

        SendNUIMessage({
            action = 'updateStatusHud',
            show = toghud,
            health = health,
            armour = armor,
            oxygen = oxy,
        })
        Citizen.Wait(200)
    end
end)
