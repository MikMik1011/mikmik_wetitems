ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent("hghp_mokarnovac:pokvasinovac")
AddEventHandler("hghp_mokarnovac:pokvasinovac", function(source)
    print('esx = ', ESX)
    print('xplayer pre = ', ESX.GetPlayerFromId(source))
    local xPlayer = ESX.GetPlayerFromId(source)
    local novac = xPlayer.getMoney()
    if novac > 0 then
        local mokarnovac = math.random(0, novac)
        xPlayer.removeMoney(mokarnovac)
        xPlayer.addInventoryItem('mokarnovac', mokarnovac)
        TriggerClientEvent('esx:showNotification', source, ('~r~Pokvasili ste novac, izgubili ste ~g~%i ~r~dinara!'):format(mokarnovac))
    end

    local markirannovac = xPlayer.getAccount('black_money').money
    if markirannovac > 0 then
        local mokarmarkirannovac = math.random(0, markirannovac)
        xPlayer.removeAccountMoney('black_money', mokarmarkirannovac)
        xPlayer.addInventoryItem('mokarmarkirannovac', mokarmarkirannovac)
        TriggerClientEvent('esx:showNotification', source, ('~r~Pokvasili ste novac, izgubili ste ~g~%i ~r~ markiranih dinara!'):format(mokarmarkirannovac))
    end
end)


RegisterServerEvent("hghp_mokarnovac:zameni")
AddEventHandler("hghp_mokarnovac:zameni", function(item, noviitem, poruka, source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local itemcount = xPlayer.getInventoryItem(item)["count"]
    if itemcount > 0 then 
        local removeitem = math.random(0, itemcount)
        xPlayer.removeInventoryItem(item, removeitem)
        if noviitem ~= false then
            xPlayer.addInventoryItem(noviitem, removeitem)
        end
        TriggerClientEvent('esx:showNotification', source, poruka)
    end    
end)

RegisterServerEvent("hghp_mokarnovac:pokvasi")
AddEventHandler("hghp_mokarnovac:pokvasi", function()
    TriggerEvent('hghp_mokarnovac:pokvasinovac', source)
    for i = 1, #Items, 1 do
        TriggerEvent('hghp_mokarnovac:zameni', Items[i][1], Items[i][2], Items[i][3], source)
        print(Items[i][1], Items[i][2], Items[i][3])
    end   
end)