local wezterm = require("wezterm")

local config = wezterm.config_builder()

local remap = require("james.remap")
local plugins = require("james.plugins")
local ui = require("james.ui")
local startup = require("james.startup")

config.default_prog = {"C:/Program Files/Git/bin/bash.exe", "-i", "-l" }

config.max_fps = 120
config.front_end = "WebGpu"

remap.apply_to_config(config)
plugins.apply_to_config(config)
ui.apply_to_config(config)
startup.apply_to_config(config)

return config
