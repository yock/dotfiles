local wezterm = require('wezterm')
local config = wezterm.config_builder()
config.color_scheme = "Tempus Past"
config.font = wezterm.font('TX-02')
config.font_size = 17

return config
