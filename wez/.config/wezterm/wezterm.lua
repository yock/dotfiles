local LIGHT_THEME = 'Tempus Past'
local DARK_THEME = 'Tempus Classic'

local wezterm = require('wezterm')
local config = wezterm.config_builder()
config.font = wezterm.font('TX-02')
config.font_size = 17

local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return DARK_THEME
  else
    return LIGHT_THEME
  end
end

config.color_scheme = scheme_for_appearance(get_appearance())

return config
