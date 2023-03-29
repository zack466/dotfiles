local wezterm = require 'wezterm'

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'One Half Black (Gogh)'
config.enable_tab_bar = false

config.font = wezterm.font {
    family = 'ComicMono Nerd Font',
}
config.font_size = 14.0

config.window_decorations = "RESIZE"

config.default_prog = { '/opt/local/bin/tmux', 'new-session', '-A', '-s', 'wezterm' }

return config
