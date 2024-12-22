local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
    config.domains = {
        {
            name = "home-server",
            remote_address = "192.168.1.222",
            multiplexing = "None",
        },
    }
end

return module
