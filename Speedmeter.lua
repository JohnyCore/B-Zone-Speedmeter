local script_name = "Speedmeter for B-Zone"
local script_version = "1.0.1"
local script_author = "DjC"

local samp = require "samp.events"
local sampev = require "lib.samp.events"
require "lib.moonloader"

local speedTextdrawId1 = nil
local speedTextdrawId2 = nil
local unitTextdrawId2 = nil

function main()
    if not isSampfuncsLoaded() or not isSampLoaded() then return end
    while not isSampAvailable() do wait(0) end

    local scalingFactor = 1

    while true do
        wait(0)
        handleSpeedTextdraw1(scalingFactor)
        handleSpeedTextdraw2(scalingFactor)
        handleSpeedTextdraw01(scalingFactor)
    end
end

function handleSpeedTextdraw1(scalingFactor)
    if isCharInAnyCar(playerPed) then
        if not speedTextdrawId1 then
            speedTextdrawId1 = getTextdrawIdByText("Speed: 0 Km/h") 
            if speedTextdrawId1 then
                -- sampAddChatMessage("Speed textdraw 1 ID found: " .. speedTextdrawId1, -1)
            else
                -- sampAddChatMessage("Speed textdraw 1 not found. Please check your textdraws.", -1)
            end
        end
        if speedTextdrawId1 then
            local car = storeCarCharIsInNoSave(playerPed)
            local speed = getCarSpeed(car) * 3.6 * scalingFactor 
            sampTextdrawSetString(speedTextdrawId1, string.format("Speed: %.0f Km/h", speed))
        end
    else
        speedTextdrawId1 = nil
    end
end

function handleSpeedTextdraw01(scalingFactor)
    if isCharInAnyCar(playerPed) then
        if not speedTextdrawId01 then
            speedTextdrawId01 = getTextdrawIdByText("Viteza: 0 Km/h") 
            if speedTextdrawId01 then
                -- sampAddChatMessage("Speed textdraw 1 ID found: " .. speedTextdrawId01, -1)
            else
                -- sampAddChatMessage("Speed textdraw 1 not found. Please check your textdraws.", -1)
            end
        end
        if speedTextdrawId01 then
            local car = storeCarCharIsInNoSave(playerPed)
            local speed = getCarSpeed(car) * 3.6 * scalingFactor 
            sampTextdrawSetString(speedTextdrawId01, string.format("Viteza: %.0f Km/h", speed))
        end
    else
        speedTextdrawId01 = nil
    end
end

function handleSpeedTextdraw2(scalingFactor)
    if isCharInAnyCar(playerPed) then    
        if not speedTextdrawId2 or not unitTextdrawId2 then
            speedTextdrawId2 = getTextdrawIdByText("0")
            unitTextdrawId2 = getTextdrawIdByText("KM/H")
            if speedTextdrawId2 and unitTextdrawId2 then
                -- sampAddChatMessage("Speed textdraw 2 ID: " .. speedTextdrawId2 .. " | Unit textdraw ID: " .. unitTextdrawId2, -1)
            else
                if not speedTextdrawId2 then
                    -- sampAddChatMessage("Speed textdraw 2 '0' not found.", -1)
                end
                if not unitTextdrawId2 then
                    -- sampAddChatMessage("Unit textdraw 'KM/H' not found.", -1)
                end
            end
        end
        if speedTextdrawId2 then
            local car = storeCarCharIsInNoSave(playerPed)
            local speed = getCarSpeed(car) * 3.6 * scalingFactor
            if speed < 100 then
                sampTextdrawSetString(speedTextdrawId2, string.format("%.0f", speed))
            elseif speed >= 100 and speed < 150 then
                sampTextdrawSetString(speedTextdrawId2, string.format("~y~%.0f", speed))
            elseif speed >= 150 then
                sampTextdrawSetString(speedTextdrawId2, string.format("~r~%.0f", speed))
            end
        end
    else
        speedTextdrawId2 = nil
        unitTextdrawId2 = nil
    end
end

function getTextdrawIdByText(targetText)
    for i = 2000, 2150 do
        local text = sampTextdrawGetString(i)
        if text and text == targetText then
            return i
        end
    end
    return nil
end
