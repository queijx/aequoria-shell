-- Hyprland Configuration --

-- The configuration file was spread from hyprland.lua to /configuring files --
-- So the configuration of hyprland is made from there, as the main file serves just to pull the configuration --

-- Hardware --
require("configuring.setup")
require("configuring.keybinds")

-- Environment --
require("configuring.environment")
require("configuring.permissions")

-- Desktop --
require("configuring.windowrules")
require("configuring.autostart")

-- Customization -- The best part btw
require("configuring.theme")
require("configuring.animations")
