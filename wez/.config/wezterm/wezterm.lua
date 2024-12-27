local wezterm = require('wezterm')
local config = wezterm.config_builder()
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font('TX-02')
config.font_size = 17

return config
