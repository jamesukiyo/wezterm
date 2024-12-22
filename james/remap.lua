local wezterm = require("wezterm")

local act = wezterm.action

wezterm.on("toggle-tabbar", function(window, _)
    local overrides = window:get_config_overrides() or {}
    if overrides.enable_tab_bar == false then
        wezterm.log_info("tab bar shown")
        overrides.enable_tab_bar = true
    else
        wezterm.log_info("tab bar hidden")
        overrides.enable_tab_bar = false
    end
    window:set_config_overrides(overrides)
end)

local module = {}

function module.apply_to_config(config)

    config.leader = { key = 'w', mods = 'ALT' }

    config.keys = {
        { key = 'h', mods = 'ALT', action = act.ActivatePaneDirection('Prev') },
        { key = 'l', mods = 'ALT', action = act.ActivatePaneDirection('Next') },

        { key = 'o', mods = 'ALT', action = act.ShowTabNavigator },

        { key = 't', mods = 'ALT', action = act.SpawnTab('CurrentPaneDomain') },
        { key = 'q', mods = 'ALT', action = act.CloseCurrentTab({ confirm = true }) },

        { key = 'Q', mods = 'ALT', action = act.CloseCurrentPane({ confirm = true }) },
        { key = 'L', mods = 'ALT', action = act.SplitPane({ direction = 'Right' }) },
        { key = 'J', mods = 'ALT', action = act.SplitPane({ direction = 'Down' }) },
        { key = 's', mods = 'ALT', action = act.EmitEvent('toggle-tabbar') },
        { key = 'h', mods = 'LEADER', action = act.AdjustPaneSize({ 'Left', 20 }) },
        { key = 'l', mods = 'LEADER', action = act.AdjustPaneSize({ 'Right', 20 }) },
        { key = 'j', mods = 'LEADER', action = act.AdjustPaneSize({ 'Down', 20 }) },
        { key = 'k', mods = 'LEADER', action = act.AdjustPaneSize({ 'Up', 20 }) },
    }

    for i = 1, 8 do
        -- ALT + number to activate that tab
        table.insert(config.keys, {
            key = tostring(i),
            mods = 'ALT',
            action = act.ActivateTab(i - 1),
        })
    end

end

return module
