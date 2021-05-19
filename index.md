# Introduction

You should require the TopbarIcons module from the client.

Create an icon:
```lua
local TopbarIcons = require(game.ReplicatedStorage.TopbarIcons)
local Icon = TopbarIcons.new()
```
The `.setIcon` method takes one parameter of type string.
To set the icon, do:
```lua
Icon.setIcon(imageId)
```
Listen for clicks on the icon:
```lua
Icon.clicked:Connect(function()
    print("The user clicked on the icon!")
end)
```

# Installation

Get the latest release of Topbar Icons [here](https://github.com/BronzeFedora/Topbar-Icons/releases/).

Drag the TopbarIcons.lua file into Roblox Studio and then require the TopbarIcons module from a local script.
