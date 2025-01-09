local wezterm = require("wezterm")

local act = wezterm.action

local module = {}

function module.apply_to_config(config)

    config.integrated_title_button_style = "Windows"
    config.integrated_title_buttons = { 'Hide', 'Close' }
    config.use_fancy_tab_bar = false
    config.window_padding = {
        top = 0,
        right = 0,
        bottom = 0,
        left = 0,
    }
    config.show_new_tab_button_in_tab_bar = false
    -- config.window_background_opacity = 0.95
    config.window_background_image = "C:\\Users\\james\\.config\\wezterm\\james\\backgrounds\\frieren.jpg"
    config.window_background_image = "C:\\Users\\james\\.config\\wezterm\\james\\backgrounds\\skrawz2.jpg"
    config.window_background_image_hsb = { brightness = 0.025 }
    config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

    -- config.color_scheme = "rose-pine"
    -- config.color_scheme = "Catppuccin Mocha"
    config.color_scheme = "Moonfly (Gogh)"

    -- config.font_shaper = "Harfbuzz"
    -- config.font = wezterm.font {
    --    family = 'Fira Code',
    --    weight = "Medium",
    --    italic = false,
    --    harfbuzz_features = {"ss01", "ss04", "ss07", "cv01", "cv02", "cv04", 
    --        "cv16", "cv18", "cv31","cv30", "zero"}
    -- }

    config.font = wezterm.font {
        family = 'Iosevka Comfy Medium',
    }
    config.font_size = 14
end

return module
