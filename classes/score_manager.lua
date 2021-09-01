local class = require('lib.middleclass')
local config = require('config')
local fonts = require('fonts')

local ScoreManager = class('ScoreManager')

function ScoreManager:initialize(max)
  self.max = max or 10
  self:reset()
end

function ScoreManager:incrementLeftScore(score)
  self.leftScore = self.leftScore + 1
end

function ScoreManager:incrementRightScore(score)
  self.rightScore = self.rightScore + 1
end

function ScoreManager:isGameOver()
  return self.leftScore == self.max or self.rightScore == self.max
end

function ScoreManager:draw()
  love.graphics.setFont(fonts.scoreFont)
  love.graphics.printf(tostring(self.rightScore), 0, config.WINDOW_HEIGHT / 4, config.WINDOW_WIDTH / 2, 'center')
  love.graphics.printf(tostring(self.leftScore), config.WINDOW_WIDTH / 2, config.WINDOW_HEIGHT / 4, config.WINDOW_WIDTH / 2, 'center')
end

function ScoreManager:reset()
  self.leftScore = 0
  self.rightScore = 0
end

return ScoreManager