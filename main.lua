
local isOnUppers              = false
local timeLeftOnUppers        = 0

--[[
  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
            TAKING DRUGS/ALCOHOL
  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
]]


-- Weed Effect
RegisterNetEvent('netr_drugs:useWeed')
AddEventHandler('netr_drugs:useWeed', function()
    RequestAnimSet("MOVE_M@DRUNK@SLIGHTLYDRUNK")
    while not HasAnimSetLoaded("MOVE_M@DRUNK@SLIGHTLYDRUNK") do
        Citizen.Wait(0)
    end
    TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_SMOKING_POT", 0, true)
    Citizen.Wait(5000)
    DoScreenFadeOut(1000)
    Citizen.Wait(1000)
    ClearPedTasksImmediately(GetPlayerPed(-1))
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(GetPlayerPed(-1), true)
    SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)
    SetPedIsDrunk(GetPlayerPed(-1), true)
    DoScreenFadeIn(1000)
    Citizen.Wait(5 * 60000)
    DoScreenFadeOut(1000)
    Citizen.Wait(1000)
    DoScreenFadeIn(1000)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(GetPlayerPed(-1), 0)
    SetPedIsDrunk(GetPlayerPed(-1), false)
    SetPedMotionBlur(GetPlayerPed(-1), false)
end)

-- Alcohol Effect
RegisterNetEvent('netr_drugs:useAlcohol')
AddEventHandler('netr_drugs:useAlcohol', function(minutes)
    RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK")
    while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do
        Citizen.Wait(0)
    end
    TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_PARTYING", 0, true)
    Citizen.Wait(5000)
    DoScreenFadeOut(1000)
    Citizen.Wait(1000)
    ClearPedTasksImmediately(GetPlayerPed(-1))
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(GetPlayerPed(-1), true)
    SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@VERYDRUNK", true)
    SetPedIsDrunk(GetPlayerPed(-1), true)
    DoScreenFadeIn(1000)
    Citizen.Wait(5 * 60000)
    DoScreenFadeOut(1000)
    Citizen.Wait(1000)
    DoScreenFadeIn(1000)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(GetPlayerPed(-1), 0)
    SetPedIsDrunk(GetPlayerPed(-1), false)
    SetPedMotionBlur(GetPlayerPed(-1), false)
end)

-- Heroin Effect
RegisterNetEvent('netr_drugs:useHeroin')
AddEventHandler('netr_drugs:useHeroin', function()
    RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK")
    while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do
        Citizen.Wait(0)
    end
    TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_BUM_WASH", 0, true)
    Citizen.Wait(5000)
    DoScreenFadeOut(1000)
    Citizen.Wait(1000)
    ClearPedTasksImmediately(GetPlayerPed(-1))
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(GetPlayerPed(-1), true)
    SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@VERYDRUNK", true)
    SetPedIsDrunk(GetPlayerPed(-1), true)
    DoScreenFadeIn(1000)
    Citizen.Wait(5 * 60000)
    DoScreenFadeOut(1000)
    Citizen.Wait(1000)
    DoScreenFadeIn(1000)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(GetPlayerPed(-1), 0)
    SetPedIsDrunk(GetPlayerPed(-1), false)
    SetPedMotionBlur(GetPlayerPed(-1), false)
end)

-- Upper Effect
RegisterNetEvent('netr_drugs:useUpper')
AddEventHandler('netr_drugs:useUpper', function(minutes)
  if (not isOnUppers) then
    RequestAnimSet("move_f@flee@a")
    while not HasAnimSetLoaded("move_f@flee@a") do
        Citizen.Wait(0)
    end

    TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_JOG_STANDING", 0, true)
    Citizen.Wait(5000)
    DoScreenFadeOut(1000)
    Citizen.Wait(1000)
    ClearPedTasksImmediately(GetPlayerPed(-1))
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(GetPlayerPed(-1), true)
    SetPedMovementClipset(GetPlayerPed(-1), "move_f@flee@a", true)
    DoScreenFadeIn(1000)
    isOnUppers = true
    timeLeftOnUppers = minutes * 60000
  end
end)


Citizen.CreateThread(function() 
  while true do
    Citizen.Wait(0)

    if (isOnUppers) then

      if (timeLeftOnUppers > 1) then
        RestorePlayerStamina(PlayerId(), 1.0)
        timeLeftOnUppers = timeLeftOnUppers - 1
      else

        DoScreenFadeOut(1000)
        Citizen.Wait(1000)
        DoScreenFadeIn(1000)
        ClearTimecycleModifier()
        ResetScenarioTypesEnabled()
        ResetPedMovementClipset(GetPlayerPed(-1), 0)
        SetPedIsDrunk(GetPlayerPed(-1), false)
        SetPedMotionBlur(GetPlayerPed(-1), false)
        
        isOnUppers = false

      end

      Citizen.Wait(1000)

    end

  end
end)