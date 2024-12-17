local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
    local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

    tabline.setup({
        options = {
            theme = "catppuccin-mocha",
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
            tabline_a = { 'workspace' },
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
    

    -- ZEN MODE CONFIG FOR NEOVIM/WEZTERM
    wezterm.on('user-var-changed', function(window, pane, name, value)
        local overrides = window:get_config_overrides() or {}
        if name == "ZEN_MODE" then
            local incremental = value:find("+")
            local number_value = tonumber(value)
            if incremental ~= nil then
                while (number_value > 0) do
                    window:perform_action(wezterm.action.IncreaseFontSize, pane)
                    number_value = number_value - 1
                end
                overrides.enable_tab_bar = false
            elseif number_value < 0 then
                window:perform_action(wezterm.action.ResetFontSize, pane)
                overrides.font_size = nil
                overrides.enable_tab_bar = true
            else
                overrides.font_size = number_value
                overrides.enable_tab_bar = false
            end
        end
        window:set_config_overrides(overrides)
    end)

end

return module
