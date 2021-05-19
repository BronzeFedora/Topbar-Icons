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
    print("The icon was clicked.")
end)
```

# Installation

Get the latest release of Topbar Icons [here](https://github.com/BronzeFedora/Topbar-Icons/releases/).

Drag the TopbarIcons.lua file into Roblox Studio and then require the TopbarIcons module from a local script.

# API

### Constructors

**new**
```lua
local Icon = TopbarIcons.new()
```
Constructs an icon

### Methods

**setIcon**
```lua
Icon.setIcon(imageId)
```
Sets the icon's image to a string (e.g. `"rbxassetid//0"`).

**forceSelection**
```lua
Icon.forceSelection(boolean)
```
Sets the icon's selected state.

### Events

**clicked**
```lua
Icon.clicked:Connect(function()
    print("The icon was clicked.")
end)
```

**selected**
```lua
Icon.selected:Connect(function()
    print("The icon was selected.")
end)
```

**unselected**
```lua
Icon.unselected:Connect(function()
    print("The icon was deselected.")
end)
```
