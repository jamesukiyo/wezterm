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

    config.keys = {
        { key = 'h', mods = 'ALT', action = act.ActivateTabRelative(-1) },
        { key = 'l', mods = 'ALT', action = act.ActivateTabRelative(1) },
        { key = 'j', mods = 'ALT', action = act.ActivatePaneDirection('Prev') },
        { key = 'k', mods = 'ALT', action = act.ActivatePaneDirection('Next') },

        { key = 'f', mods = 'ALT', action = act.ShowTabNavigator },

        { key = 't', mods = 'ALT', action = act.SpawnTab('CurrentPaneDomain') },
        { key = 'w', mods = 'ALT', action = act.CloseCurrentTab({ confirm = true }) },

        { key = 'W', mods = 'ALT', action = act.CloseCurrentPane({ confirm = true }) },
        { key = 'L', mods = 'ALT', action = act.SplitPane({ direction = 'Right' }) },
        { key = 'K', mods = 'ALT', action = act.SplitPane({ direction = 'Down' }) },
        { key = 's', mods = 'ALT', action = act.EmitEvent('toggle-tabbar') },
    }
end

return module