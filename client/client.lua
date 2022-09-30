local player = PlayerPedId()

Citizen.CreateThread(function()
  wait = math.random(3000, 15000)
  while true do
    Citizen.Wait(wait)
    if IsEntityInWater(player) and IsPedSwimming(player) then
      TriggerServerEvent('hg_wetmoney:wet')
      Citizen.Wait(math.random(30000, 120000))
    end
  end		  
end)
