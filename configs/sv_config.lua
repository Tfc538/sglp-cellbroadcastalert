Config = {}

-- Enable/Disable Cellbroadcast Alerts
Config.EnableCellbroadcastAlerts = true

-- Command to trigger Cellbroadcast Alerts
Config.Command = "cellbroadcastalert" -- /{Command} {Title} {Message}

-- Cooldown period in minutes to prevent spam (e.g., 1 minutes = 1 * 60 * 1000)
Config.CellbroadcastAlertCooldown = 1 * 60 * 1000

-- Define allowed jobs and grades for sending Cellbroadcast Alerts
Config.AllowedJobs = {
    {
        name = "police",
        minGrade = 6
    },
    {
        name = "homeland_security",
        minGrade = 6
    },
    {
        name = "doj",
        minGrade = 6
    }
}

-- Send notification (Is called server-side)
-- @param title: string - The title of the notification
-- @param message: string - The message of the notification
Config.SendNotification = function(title, message)
    if not Config.AlertNotifications.notification then return end

    -- QBCore Notify Example
    -- TriggerClientEvent('QBCore:Notify', -1, message, 'success', 10000)

    -- CodeM mPhone Example
    TriggerClientEvent('codem-phone:client:notification', -1, {
        appname   = "Los Santos Government",
        appicon   = "cellbroadcast.png",
        message   = message,
        permanent = true,
        time      = os.date("%H:%M:%S"),
        header    = title
    })
end
