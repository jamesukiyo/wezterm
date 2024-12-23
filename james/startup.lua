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
            direction = "Left",
            size = 0.5,
        }

        local third_tab, third_pane = window:spawn_tab {
            cwd = wezterm.home_dir,
        }

        local fourth_tab, fourth_pane = window:spawn_tab {}
        fourth_pane:send_text("ssh james@192.168.1.222\n")

        first_tab:activate()
    end
    )
end

return module
