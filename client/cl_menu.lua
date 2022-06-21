ESX = nil

CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        print("^0======================================================================^7")
        print("^0[^4Author^0] ^7:^0 ^1BarWoz^7")
        print("^0[^2Github^0] ^7:^0 ^5https://github.com/Barwoz?tab=repositories^7")
        print("^0[^3YouTube^0] ^7:^0 ^5https://www.youtube.com/channel/UCfNvauIFWsKmyKvrb9eK5sw^7")
        print("^0======================================================================^7")
        Wait(100)
    end
end)

local SettingsMenu = {
    percentage = 0.0,
    ColorHear = {primary = {1, 1}, secondary = {1, 1}},
    ColorBrow = {primary = {1, 1}, secondary = {1, 1}},
    ColorBeard = {primary = {1, 1}, secondary = {1, 1}}

}

local MenuList = {List = 1, List1 = 1, List2 = 1}
local BarberMenu = false

------------------------------MENU SHOPS

local barber = RageUI.CreateMenu("Coiffeur", "Choisis ta Coupe", 10, 80)
barber.Closed = function() BarberMenu = false end
barber.EnableMouse = true;

function OpenMenuBarber()
    if BarberMenu then
        BarberMenu = false
    else
        BarberMenu = true
        RageUI.Visible(barber, true)
        CreateThread(function()
            while BarberMenu do
                Wait(1)
                RageUI.IsVisible(barber, function()

                    RageUI.Separator('~r~↓~s~ Payer le Coiffeur ~r~↓~s~')

                    RageUI.Button("Payer", nil, {RightLabel = "~r~50$"}, true, {
                        onSelected = function()
                            TriggerServerEvent('barwoz:coiffeur')
                        end
                    }) 
                    
                    RageUI.Separator('~r~↓~s~ Coiffeur ~r~↓~s~')

                    RageUI.List('Cheveux', {"~r~1~s~", "~r~2~s~", "~r~3~s~", "~r~4~s~", "~r~5~s~", "~r~6~s~", "~r~7~s~", "~r~8~s~", "~r~9~s~", "~r~10~s~","~r~11~s~", "~r~12~s~", "~r~13~s~", "~r~14~s~","~r~15~s~", "~r~16~s~", "~r~17~s~", "~r~18~s~","~r~19~s~", "~r~20~s~", "~r~21~s~", "~r~22~s~", "~r~23~s~", "~r~24~s~", "~r~25~s~", "~r~26~s~","~r~27~s~", "~r~28~s~", "~r~29~s~", "~r~30~s~","~r~31~s~", "~r~32~s~", "~r~33~s~", "~r~34~s~","~r~35~s~", "~r~36~s~", "~r~37~s~", "~r~38~s~","~r~39~s~", "~r~40~s~", "~r~41~s~", "~r~42~s~","~r~43~s~", "~r~44~s~", "~r~45~s~" }, MenuList.List, nil, {}, true, {
                        onListChange = function(i, Item)
                            MenuList.List = i;
                            TriggerEvent("skinchanger:change", "hair_1",MenuList.List)
                        end
                    })

                    RageUI.ColourPanel("Couleur cheveux", RageUI.PanelColour.HairCut, SettingsMenu.ColorHear.primary[1], SettingsMenu.ColorHear.primary[2], {
                        onColorChange = function(MinimumIndex, CurrentIndex)
                            SettingsMenu.ColorHear.primary[1] = MinimumIndex
                            SettingsMenu.ColorHear.primary[2] = CurrentIndex
                            TriggerEvent("skinchanger:change", "hair_color_1", SettingsMenu.ColorHear.primary[2])
                        end
                    }, 4);

                    RageUI.ColourPanel("Couleur cheveux", RageUI.PanelColour.HairCut, SettingsMenu.ColorHear.secondary[1], SettingsMenu.ColorHear.secondary[2], {
                        onColorChange = function(MinimumIndex, CurrentIndex)
                            SettingsMenu.ColorHear.secondary[1] = MinimumIndex
                            SettingsMenu.ColorHear.secondary[2] = CurrentIndex
                            TriggerEvent("skinchanger:change", "hair_color_2", SettingsMenu.ColorHear.secondary[2])
                        end
                    }, 4);

                    RageUI.List('Barbe', {"~r~1~s~", "~r~2~s~", "~r~3~s~", "~r~4~s~", "~r~5~s~", "~r~6~s~", "~r~7~s~", "~r~8~s~", "~r~9~s~", "~r~10~s~", "~r~11~s~", "~r~12~s~", "~r~13~s~", "~r~14~s~", "~r~15~s~", "~r~16~s~", "~r~17~s~", "~r~18~s~", "~r~19~s~", "~r~20~s~", "~r~21~s~", "~r~22~s~", "~r~23~s~", "~r~24~s~", "~r~25~s~", "~r~26~s~", "~r~27~s~", "~r~28~s~"
                    }, MenuList.List1, nil, {}, true, {
                        onListChange = function(i, Item)
                            MenuList.List1 = i;
                            TriggerEvent("skinchanger:change", "beard_1", MenuList.List1)
                        end
                    })

                    RageUI.ColourPanel("Couleur Barbes", RageUI.PanelColour.HairCut, SettingsMenu.ColorBeard.primary[1], SettingsMenu.ColorBeard.primary[2], {
                        onColorChange = function(MinimumIndex, CurrentIndex)
                            SettingsMenu.ColorBeard.primary[1] = MinimumIndex
                            SettingsMenu.ColorBeard.primary[2] = CurrentIndex
                            TriggerEvent("skinchanger:change", "beard_3",SettingsMenu.ColorBeard.primary[2])
                        end
                    }, 5);

                    RageUI.PercentagePanel(SettingsMenu.percentage, 'Opacité', '0%', '100%', {
                        onProgressChange = function(Percentage)
                            SettingsMenu.percentage = Percentage
                            TriggerEvent("skinchanger:change", "beard_2", Percentage * 10)
                        end
                    }, 5);

                    RageUI.List('Sourcils', {"~r~1~s~", "~r~2~s~", "~r~3~s~", "~r~4~s~", "~r~5~s~", "~r~6~s~", "~r~7~s~", "~r~8~s~", "~r~9~s~", "~r~10~s~", "~r~11~s~", "~r~12~s~", "~r~13~s~", "~r~14~s~", "~r~15~s~", "~r~16~s~", "~r~17~s~", "~r~18~s~", "~r~19~s~", "~r~20~s~", "~r~21~s~", "~r~22~s~", "~r~23~s~", "~r~24~s~", "~r~25~s~", "~r~26~s~", "~r~27~s~", "~r~28~s~", "~r~29~s~", "~r~30~s~", "~r~31~s~", "~r~32~s~", "~r~33~s~", "~r~34~s~", "~r~35~s~"
                    }, MenuList.List2, nil, {}, true, {
                        onListChange = function(i, Item)
                            MenuList.List2 = i;
                            TriggerEvent("skinchanger:change", "eyebrows_1", MenuList.List2)
                        end
                    })

                    RageUI.ColourPanel("Couleur Sourcils", RageUI.PanelColour.HairCut, SettingsMenu.ColorBrow.primary[1], SettingsMenu.ColorBrow.primary[2], {
                        onColorChange = function(MinimumIndex, CurrentIndex)
                            SettingsMenu.ColorBrow.primary[1] = MinimumIndex
                            SettingsMenu.ColorBrow.primary[2] = CurrentIndex
                            TriggerEvent("skinchanger:change", "eyebrows_3", SettingsMenu.ColorBrow.primary[2])
                        end
                    }, 6);

                    RageUI.PercentagePanel(SettingsMenu.percentage, 'Opacité', '0%', '100%', {
                        onProgressChange = function(Percentage)
                            SettingsMenu.percentage = Percentage
                            TriggerEvent("skinchanger:change", "eyebrows_2", Percentage * 10)
                        end
                    }, 6);

                end)
            end
        end)
    end
end

------------------------------DRAWMARKERS

Citizen.CreateThread(function()
    while true do
        local pCoords2 = GetEntityCoords(PlayerPedId())
        local activerfps = false
        local dst = GetDistanceBetweenCoords(pCoords2, true)
        for _, v in pairs(Config.positionbarber) do
            if #(pCoords2 - v.position) < 1.5 then
                activerfps = true
                Visual.Subtitle("Appuyer sur ~r~[E]~s~ pour accéder au ~r~Coiffeur~s~ !")
                if BarberMenu == false then
                    if IsControlJustReleased(0, 38) then
                        OpenMenuBarber()
                        FreezeEntityPosition(PlayerPedId(), true)
                    end
                end
            elseif #(pCoords2 - v.position) < 7.0 then
                activerfps = true
                DrawMarker(29, v.position, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0, 255, 0, 170, 1, 1, 2, 0, nil, nil, 0)
            elseif #(pCoords2 - v.position) > 3 then
                RageUI.CloseAll()
                BarberMenu = false
            end
        end
        if activerfps then
            Wait(1)
        else
            Wait(1500)
        end
    end
end)

------------------------------BLIPS

Citizen.CreateThread(function()

    for _, info in pairs(Config.blipsBarber) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 0.7)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)

RegisterNetEvent("barwoz:saveSkin")
AddEventHandler("barwoz:saveSkin", function()
    FreezeEntityPosition(PlayerPedId(), false)
    RageUI.CloseAll()
    BarberMenu = false
    TriggerEvent("skinchanger:getSkin", function(skin)
        TriggerServerEvent('esx_skin:save', skin)
    end)
end)

------------------------------CREATED BY BARWOZ------------------------------
