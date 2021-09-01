local config = require('config')
local Ball = require('objects.ball')
local M = {}

function M.createBall()
  local values = { -1, 1 }
  return Ball:new({
    x = config.WINDOW_WIDTH / 2 - config.BALL_WIDTH / 2,
    y = config.WINDOW_HEIGHT / 2 - config.BALL_HEIGHT / 2,
    dx = values[math.random(2)],
    dy = values[math.random(2)],
  })
end

return M