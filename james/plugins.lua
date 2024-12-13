local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
    local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

    tabline.setup({
        options = {
            section_separators = {
                left = wezterm.nerdfonts.pl_left_hard_divider,
                right = wezterm.nerdfonts.pl_right_hard_divider,
              },
            component_separators = {
                left = wezterm.nerdfonts.pl_left_soft_divider,
                right = wezterm.nerdfonts.pl_right_soft_divider,
              },
            tab_separators = {
                left = wezterm.nerdfonts.pl_left_hard_divider,
                right = wezterm.nerdfonts.pl_right_hard_divider,
              },
        },
        sections = {
            tabline_a = { 'window' },
            tabline_b = { '' },
            tabline_c = { '' },
            tab_active = {
                'index',
                -- { 'parent', padding = 0 },
                --'/',
                { 'cwd', padding = { left = 0, right = 1 } },
                { 'zoomed', padding = 0 },
            },
            tab_inactive = { 
                'index', 
                { 'cwd', padding = { left = 0, right = 1 } } 
            },
            tabline_x = { 'ram', 'cpu' },
            tabline_y = { 'datetime', 'battery' },
            tabline_z = { 'hostname' },
        },
    })
end

return module