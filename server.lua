local basic_needs = class("basic_needs", vRP.Extension)

function basic_needs:__construct()
    vRP.Extension.__construct(self)
end

-- EVENT

basic_needs.event = {}

function basic_needs.event:getInfo(user, vital)
  local user = vRP.users_by_source[source]
  if user ~= nil then
    local thirst = user:getVital("water") * 100
    local hunger = user:getVital("food") * 100
    TriggerClientEvent("bassic_needs:thirst", source, thirst)
    TriggerClientEvent("bassic_needs:hunger", source, hunger)
  end
end


RegisterServerEvent('bassic_needs:getinfo')  
AddEventHandler('bassic_needs:getinfo', function()
  local user = vRP.users_by_source[source]
  if user ~= nil then
    local thirst = user:getVital("water") * 100
    local hunger = user:getVital("food") * 100
    TriggerClientEvent("bassic_needs:thirst", source, thirst)
    TriggerClientEvent("bassic_needs:hunger", source, hunger)
  end 
end)

vRP:registerExtension(basic_needs)
