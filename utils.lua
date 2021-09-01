local config = require('config')

local M = {}

function M.calculateBallCollidesPad(ball, pad)
  local ballBounds = ball:getBoundingBox()
  local padBounds = pad:getBoundingBox()
  local collision = 0
  if ballBounds.startY >= padBounds.startY and ballBounds.endY <= padBounds.endY then
    if ballBounds.endX == padBounds.startX then
      collision = -1
    end

    if ballBounds.startX == padBounds.endX then
      collision = 1
    end
  end

  return collision
end

function M.detectBallOut(ball, windowWidth)
  local bounds = ball:getBoundingBox()
  if bounds.startX <= 0 or bounds.endX >= windowWidth then
    return true
  end
  return false
end

function M.isBallCollideLeftWall(ball)
  return ball:getBoundingBox().startX == 0
end

function M.isBallCollideRightWall(ball)
  return ball:getBoundingBox().endX == config.WINDOW_WIDTH
end

function M.isBallCollideCeilOrFloor(ball)
  local bounds = ball:getBoundingBox()
  return bounds.startY == 0 or bounds.endY == config.WINDOW_HEIGHT
end

function M.isBallCollideLeftPad(ball, pad)
  local ballBounds = ball:getBoundingBox()
  local padBounds = pad:getBoundingBox()
  return ballBounds.startY >= padBounds.startY and ballBounds.endY <= padBounds.endY and ballBounds.startX == padBounds.endX
end

function M.isBallCollideRightPad(ball, pad)
  local ballBounds = ball:getBoundingBox()
  local padBounds = pad:getBoundingBox()
  return ballBounds.startY >= padBounds.startY and ballBounds.endY <= padBounds.endY and ballBounds.endX == padBounds.startX
end

return M