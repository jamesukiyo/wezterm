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

    config.leader = { key = 'w', mods = 'ALT', timeout_milliseconds = 5000 }

    config.keys = {
        { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection('Prev') },
        { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection('Next') },

        { key = 'o', mods = 'LEADER', action = act.ShowTabNavigator },

        { key = 't', mods = 'LEADER', action = act.SpawnTab('CurrentPaneDomain') },
        { key = 'q', mods = 'LEADER', action = act.CloseCurrentTab({ confirm = true }) },

        { key = 'Q', mods = 'LEADER', action = act.CloseCurrentPane({ confirm = true }) },
        { key = 'L', mods = 'LEADER', action = act.SplitPane({ direction = 'Right' }) },
        { key = 'J', mods = 'LEADER', action = act.SplitPane({ direction = 'Down' }) },
        { key = 's', mods = 'LEADER', action = act.EmitEvent('toggle-tabbar') },
        { key = 'h', mods = 'LEADER|CTRL', action = act.AdjustPaneSize({ 'Left', 40 }) },
        { key = 'l', mods = 'LEADER|CTRL', action = act.AdjustPaneSize({ 'Right', 40 }) },
        { key = 'j', mods = 'LEADER|CTRL', action = act.AdjustPaneSize({ 'Down', 40 }) },
        { key = 'k', mods = 'LEADER|CTRL', action = act.AdjustPaneSize({ 'Up', 40 }) },
    }

    for i = 1, 8 do
        -- LEADER + number to activate that tab
        table.insert(config.keys, {
            key = tostring(i),
            mods = 'LEADER',
            action = act.ActivateTab(i - 1),
        })
    end

end

return module
