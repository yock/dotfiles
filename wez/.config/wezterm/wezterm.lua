local wezterm = require('wezterm')
local config = wezterm.config_builder()
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font('FiraCode Nerd Font Mono')
config.font_size = 16

return config
