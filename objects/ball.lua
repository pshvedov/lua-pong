local class = require('lib.middleclass')
local Object = require('classes.object')
local config = require('config')

local Ball = class('Ball', Object)

function Ball:initialize(options)
  local opts = options or {
    x = 0,
    y = 0,
    dx = 1,
    dy = 1,
  }
  Object.initialize(self, opts.x or 0, opts.y or 0, config.BALL_WIDTH, config.BALL_HEIGHT)
  self.dx = opts.dx or 1
  self.dy = opts.dy or 1
end

function Ball:update(windowWidth, windowHeight)
  self.x = self.x + self.dx
  self.y = self.y + self.dy
end

function Ball:setDirection(direction)
  self.dx = direction.dx or self.dx
  self.dy = direction.dy or self.dy
end

function Ball:draw()
  love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

return Ball