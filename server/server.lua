ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


function swap(item, newitem, message, source)
    local xPlayer = ESX.GetPlayerFromId(source)

    if item == 'money' then
        itemcount = xPlayer.getMoney()
    elseif item == 'blackmoney' then 
        itemcount = xPlayer.getAccount('black_money').money
    else
        itemcount = xPlayer.getInventoryItem(item)["count"]
    end

    local removequantity = math.random(0, itemcount)

    if itemcount > 0 and removequantity > 0 then 
        if item == 'money' then
            xPlayer.removeMoney(removequantity)
        elseif item == 'blackmoney' then 
            xPlayer.removeAccountMoney('black_money', removequantity)
        else
            xPlayer.removeInventoryItem(item, removequantity)
        end

        if newitem ~= false then
            xPlayer.addInventoryItem(newitem, removequantity)
        end

        TriggerClientEvent('esx:showNotification', source, message)
    end    
end

RegisterServerEvent("hg_wetmoney:wet")
AddEventHandler("hg_wetmoney:wet", function()
    for i = 1, #Items, 1 do
        swap(Items[i][1], Items[i][2], Items[i][3], source)
    end   
end)