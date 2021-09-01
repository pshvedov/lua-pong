local config = require('config')
local Pad = require('objects.pad')
local M = {}


function M.checkPadMovement(pad, upKey, downKey)
  local downPressed = love.keyboard.isDown(downKey)
  local upPressed = love.keyboard.isDown(upKey)
  if upPressed and not downPressed then
    pad:setDirection(-1)
  elseif downPressed and not upPressed then
    pad:setDirection(1)
  else
    pad:setDirection(0)
  end
end

function M.createLeftPad()
  return Pad:new({
    x = 0,
    y = config.WINDOW_HEIGHT / 2 - config.PAD_HEIGHT / 2
  })
end

function M.createRightPad()
  return Pad:new({
    x = config.WINDOW_WIDTH - config.PAD_WIDTH,
    y = config.WINDOW_HEIGHT / 2 - config.PAD_HEIGHT / 2
  })
end

function M.createPads()
  return M.createLeftPad(), M.createRightPad()
end

return M