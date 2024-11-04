# SeeGurkenLP Cell Broadcast Alerts

## Overview

This Script allows authorized personnel to send cell broadcast alerts to all players on the server. Cell broadcast alerts are messages that are broadcasted to all mobile devices in a specific area. This feature can be used to send emergency notifications to all players on the server.

## Configuration

### Installation

1. Download the `sglp-cellbroadcastalert` folder.
2. Place the folder in the `resources` directory or a category of your choice.
3. Add `ensure sglp-cellbroadcastalert` to your `server.cfg` file.
4. Make sure you have the following dependencies installed:
   - [QBCore](https://docs.qbcore.org/qbcore-documentation)
   - [Interact Sounds](https://github.com/plunkettscott/interact-sound)

### Configuration Table

The following configuration options can be adjusted in the `Config` table:

- **EnableCellbroadcastAlerts**: Set to `true` to enable the feature, or `false` to disable it.
- **Command**: The command used by authorized personnel to trigger alerts.
- **CellbroadcastAlertCooldown**: Time in milliseconds that players must wait before triggering another alert.
- **AllowedJobs**: A table defining which jobs can send alerts and the minimum grade required.
- **SendNotification**: A function that sends notifications to players. Here you can the SendNotification function to your liking.

#### Commands
- **Usage**: `/cellbroadcastalert [title] [message]`
- If no title is provided, it defaults to "Cell Broadcast Alert."
- If no message is provided, it defaults to "Please seek shelter immediately and report any suspicious activities to the authorities."

## Export
The following export is available for use in other resources:

### TriggerCellbroadcastAlert

**Client-Side**
```lua
exports['sglp-cellbroadcastalert']:TriggerCellbroadcastAlert(title, message)
```

**Server-Side**
```lua
exports['sglp-cellbroadcastalert']:TriggerCellbroadcastAlert(source, title, message)
```

## Example Usage
To trigger an alert as an authorized user, use the command in-game:

```
/cellbroadcastalert Emergency Alert This is an emergency notification.
```
