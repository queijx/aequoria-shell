-- Hyprland Configuration --

-- The configuration file was spread from hyprland.lua to /configuring files --
-- So the configuration of hyprland is made from there, as the main file serves just to pull the configuration --

-- Hardware --
require("land.setup")
require("land.keybinds")

-- Environment --
require("land.environment")
require("land.permissions")

-- Desktop --
require("land.windowrules")
require("land.autostart")

-- Customization -- The best part btw
require("land.theme")
require("land.animations")