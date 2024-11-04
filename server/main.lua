local QBCore = exports['qb-core']:GetCoreObject()

local lastAlertTime = 0

-- Function to check if the player is allowed to trigger the alert
-- @param source: number - The source of the player to check
-- @return boolean - True if the player is allowed to trigger the alert, false otherwise
local function isAllowedToTrigger(source)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return false end

    local job = Player.PlayerData.job.name
    local grade = Player.PlayerData.job.grade.level
    for _, allowedJob in ipairs(Config.AllowedJobs) do
        if allowedJob.name == job and grade >= allowedJob.minGrade then
            return true
        end
    end

    return false
end

-- Function to trigger the Cellbroadcast Alert
-- @param source: number - The source of the player triggering the alert
-- @param title: string - The title of the alert
-- @param message: string - The message of the alert
local function triggerCellbroadcastAlert(source, title, message)
    local currentTime = os.time()
    if currentTime - lastAlertTime < Config.CellbroadcastAlertCooldown / 1000 then
        local timeLeft = math.ceil((Config.CellbroadcastAlertCooldown / 1000) - (currentTime - lastAlertTime))
        TriggerClientEvent('QBCore:Notify', source, string.format("Cell Broadcast Alert can only be triggered every %d seconds.", timeLeft), 'error', 10000)
        return
    end

    lastAlertTime = currentTime

    Config.SendNotification(title, message)

    TriggerClientEvent('InteractSound_CL:PlayOnAll', -1, 'cellbroadcast_alert', 0.3)
end

-- Register the command to trigger the Cellbroadcast Alert
RegisterCommand(Config.Command, function(source, args, rawCommand)
    local title = args[1] or "Cell Broadcast Alert"
    local message = table.concat(args, " ", 2) or "Please seek shelter immediately and report any suspicious activities to the authorities."

    if isAllowedToTrigger(source) then
        triggerCellbroadcastAlert(source, title, message)
    else
        TriggerClientEvent('QBCore:Notify', source, 'You are not allowed to trigger Cell Broadcast Alerts.', 'error', 10000)
    end
end, false)

exports('TriggerCellbroadcastAlert', triggerCellbroadcastAlert)
