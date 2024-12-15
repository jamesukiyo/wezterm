local wezterm = require("wezterm")
local mux = wezterm.mux

local act = wezterm.action

local module = {}

function module.apply_to_config(config)
    wezterm.on("gui-startup", function()
        local first_tab, first_pane, window = mux.spawn_window {
            workspace = "james",
            cwd = wezterm.home_dir .. "/Documents/projects",
        }
        local second_tab, second_pane = window:spawn_tab {}
        local split_second = second_pane:split { 
            direction = "Right",
            size = 0.5,
        }
        local third_tab, third_pane = window:spawn_tab {
            cwd = wezterm.home_dir,
        }
        first_tab:activate()
    end
    )
end

return module
