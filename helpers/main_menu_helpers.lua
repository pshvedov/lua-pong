local styles = require('styles.main_menu_styles')
local config = require('config')

local M = {}

function M.drawItem(item, background, textcolor, index)
  love.graphics.setColor(background)
  love.graphics.rectangle('fill', config.WINDOW_WIDTH / 2 - 150, config.WINDOW_HEIGHT / 4 + index * 80, 300, 80)
  love.graphics.setColor(textcolor)
  love.graphics.printf(item.title, config.WINDOW_WIDTH / 2 - 150, config.WINDOW_HEIGHT / 4 + index * 80 + 28, 300, 'center')
end

function M.drawNormalItem(item, index)
  M.drawItem(item, styles.normalMenuItem.background, styles.normalMenuItem.textcolor, index)
end

function M.drawSelectedItem(item, index)
  M.drawItem(item, styles.activeMenuItem.background, styles.activeMenuItem.textcolor, index)
end

return M