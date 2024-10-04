local script_name = "Speedmeter for B-Zone"
local script_version = "1.0.2"
local script_author = "DjC"

local samp = require "samp.events"
local sampev = require "lib.samp.events"
require "lib.moonloader"

local speedTextdraws = {
    speedTextdrawId1 = {text = "Speed: 0 Km/h", formatString = "Speed: %.0f Km/h"},
    speedTextdrawId01 = {text = "Viteza: 0 Km/h", formatString = "Viteza: %.0f Km/h"},
    speedTextdrawId2 = {text = "0", formatString = "%.0f", colorThreshold = {100, 150}},
    unitTextdrawId2 = {text = "KM/H"}
}

function main()
    if not isSampfuncsLoaded() or not isSampLoaded() then return end
    while not isSampAvailable() do wait(0) end

    local scalingFactor = 1

    while true do
        wait(0)
        handleSpeedTextdraw('speedTextdrawId1', scalingFactor)
        handleSpeedTextdraw('speedTextdrawId01', scalingFactor)
        handleSpeedTextdraw2(scalingFactor)
    end
end

function handleSpeedTextdraw(idVar, scalingFactor)
    if isCharInAnyCar(playerPed) then
        if not speedTextdraws[idVar].id then
            speedTextdraws[idVar].id = getTextdrawIdByText(speedTextdraws[idVar].text)
        end
        if speedTextdraws[idVar].id then
            local car = storeCarCharIsInNoSave(playerPed)
            local speed = getCarSpeed(car) * 3.6 * scalingFactor
            sampTextdrawSetString(speedTextdraws[idVar].id, string.format(speedTextdraws[idVar].formatString, speed))
        end
    else
        speedTextdraws[idVar].id = nil
    end
end

function handleSpeedTextdraw2(scalingFactor)
    if isCharInAnyCar(playerPed) then    
        if not speedTextdraws.speedTextdrawId2.id or not speedTextdraws.unitTextdrawId2.id then
            speedTextdraws.speedTextdrawId2.id = getTextdrawIdByText(speedTextdraws.speedTextdrawId2.text)
            speedTextdraws.unitTextdrawId2.id = getTextdrawIdByText(speedTextdraws.unitTextdrawId2.text)
        end

        -- Check if both textdraws are found (IDs are valid)
        if speedTextdraws.speedTextdrawId2.id and speedTextdraws.unitTextdrawId2.id then
            local car = storeCarCharIsInNoSave(playerPed)
            local speed = getCarSpeed(car) * 3.6 * scalingFactor
            local formattedSpeed = string.format(speedTextdraws.speedTextdrawId2.formatString, speed)

            if speed >= speedTextdraws.speedTextdrawId2.colorThreshold[1] and speed < speedTextdraws.speedTextdrawId2.colorThreshold[2] then
                formattedSpeed = "~y~" .. formattedSpeed
            elseif speed >= speedTextdraws.speedTextdrawId2.colorThreshold[2] then
                formattedSpeed = "~r~" .. formattedSpeed
            end

            sampTextdrawSetString(speedTextdraws.speedTextdrawId2.id, formattedSpeed)
        end
    else
        speedTextdraws.speedTextdrawId2.id = nil
        speedTextdraws.unitTextdrawId2.id = nil
    end
end

function getTextdrawIdByText(targetText)
    for i = 0, 2150 do
        local text = sampTextdrawGetString(i)
        if text and text == targetText then
            return i
        end
    end
    return nil
end
