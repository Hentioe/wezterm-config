local wezterm = require('wezterm')
local platform = require('utils.platform')()

-- Inspired by https://github.com/wez/wezterm/discussions/628#discussioncomment-1874614

local nf = wezterm.nerdfonts

local GLYPH_SEMI_CIRCLE_LEFT = nf.ple_left_half_circle_thick --[[ '' ]]
local GLYPH_SEMI_CIRCLE_RIGHT = nf.ple_right_half_circle_thick --[[ '' ]]
local GLYPH_CIRCLE = nf.fa_circle --[[ '' ]]
local GLYPH_ADMIN = nf.md_shield_half_full --[[ '󰞀' ]]

local M = {}

local __cells__ = {} -- wezterm FormatItems (ref: https://wezfurlong.org/wezterm/config/lua/wezterm/format.html)

-- stylua: ignore
local colors = {
   default   = { bg = '#45475a', fg = '#7c7e8b' },
   is_active = { bg = '#7fb4ca', fg = '#11111b' },
   hover     = { bg = '#587d8c', fg = '#1c1b19' },
}

local _check_if_admin = function(p)
   if p:match('^Administrator: ') then
      return true
   end
   return false
end

---@param fg string
---@param bg string
---@param attribute table
---@param text string
local _push = function(bg, fg, attribute, text)
   table.insert(__cells__, { Background = { Color = bg } })
   table.insert(__cells__, { Foreground = { Color = fg } })
   table.insert(__cells__, { Attribute = attribute })
   table.insert(__cells__, { Text = text })
end

M.setup = function()
   wezterm.on('format-tab-title', function(tab, tabs, panes, _config, hover, max_width)
      -- 判断是否是第一个标签
      local is_first_tab = tab.tab_index == 0
      -- 判单是否是最后一个标签
      local is_last_tab = tab.tab_index == #tabs - 1
      __cells__ = {}

      local bg
      local fg
      local is_admin = _check_if_admin(tab.active_pane.title)
      local title = tab.active_pane.title

      if tab.is_active then
         bg = colors.is_active.bg
         fg = colors.is_active.fg
      elseif hover then
         bg = colors.hover.bg
         fg = colors.hover.fg
      else
         bg = colors.default.bg
         fg = colors.default.fg
      end

      local has_unseen_output = false
      for _, pane in ipairs(tab.panes) do
         if pane.has_unseen_output then
            has_unseen_output = true
            break
         end
      end

      -- Left semi-circle
      -- 如果是第一个标签，才显示左半圆
      if is_first_tab then
         _push('rgba(0, 0, 0, 0.4)', bg, { Intensity = 'Bold' }, GLYPH_SEMI_CIRCLE_LEFT)
      end

      -- Admin Icon
      if is_admin then
         _push(bg, fg, { Intensity = 'Bold' }, ' ' .. GLYPH_ADMIN)
      end

      -- Title
      _push(bg, fg, { Intensity = 'Bold' }, ' ' .. title)

      -- Unseen output alert
      if has_unseen_output then
         _push(bg, '#FFA066', { Intensity = 'Bold' }, ' ' .. GLYPH_CIRCLE)
      end

      -- Right padding
      _push(bg, fg, { Intensity = 'Bold' }, ' ')

      -- Right semi-circle
      -- 如果是最后一个标签，才显示右半圆
      if is_last_tab then
         _push('rgba(0, 0, 0, 0.4)', bg, { Intensity = 'Bold' }, GLYPH_SEMI_CIRCLE_RIGHT)
      end

      return __cells__
   end)
end

return M
