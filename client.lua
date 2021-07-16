
local toghud = true
local thirst = 0
local hunger = 0

RegisterCommand('hud', function(source, args, rawCommand)

    if toghud then 
        toghud = false
    else
        toghud = true
    end

end)

RegisterNetEvent('bassic_needs:toggleui')
AddEventHandler('bassic_needs:toggleui', function(show)

    if show == true then
        toghud = true
    else
        toghud = false
    end

end)

RegisterNetEvent('bassic_needs:hunger')
AddEventHandler('bassic_needs:hunger', function(hunger)
    SendNUIMessage({
        action = "updateStatusHud",
        show = toghud,
        hunger = hunger,
    })
end)

RegisterNetEvent('bassic_needs:thirst')
AddEventHandler('bassic_needs:thirst', function(thirst)
    SendNUIMessage({
        action = "updateStatusHud",
        show = toghud,
        thirst = thirst,
    })
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
            stress = 100 - GetPlayerSprintStaminaRemaining(PlayerId()),
        })
        Citizen.Wait(200)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)   
        TriggerServerEvent('bassic_needs:getinfo')
    end
end) 