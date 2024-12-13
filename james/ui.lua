local wezterm = require("wezterm")

local act = wezterm.action

local module = {}

function module.apply_to_config(config)

    config.integrated_title_button_style = "Windows"
    config.integrated_title_buttons = { 'Hide', 'Close' }
    config.use_fancy_tab_bar = false
    config.window_background_opacity = 0.95
    config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
    
    config.color_scheme = "Rosé Pine (Gogh)"

    config.font_shaper = "Harfbuzz"
    config.font = wezterm.font {
        family = 'MesloLGM Nerd Font',
        harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' },
    }
    
end

return module