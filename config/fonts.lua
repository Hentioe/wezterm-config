local wezterm = require('wezterm')
local platform = require('utils.platform')

local font = wezterm.font_with_fallback { 'Noto Sans Mono', 'Noto Sans Mono CJK SC' }
local font_size = 12

return {
   font = font,
   font_size = font_size,

   --ref: https://wezfurlong.org/wezterm/config/lua/config/freetype_pcf_long_family_names.html#why-doesnt-wezterm-use-the-distro-freetype-or-match-its-configuration
   freetype_load_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
   freetype_render_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
}
