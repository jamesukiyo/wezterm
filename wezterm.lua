local wezterm = require("wezterm")

local config = wezterm.config_builder()

local remap = require("james.remap")
local plugins = require("james.plugins")
local ui = require("james.ui")

config.default_prog = {"C:/Program Files/Git/bin/bash.exe", "-i", "-l" }



remap.apply_to_config(config)
plugins.apply_to_config(config)
ui.apply_to_config(config)

return config
