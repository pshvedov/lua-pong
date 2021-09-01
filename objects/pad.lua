local class = require('lib.middleclass')
local Object = require('classes.object')
local config = require('config')

local Pad = class('Pad', Object)

function Pad:initialize(options)
  local opts = options or {
    x = 0,
    y = 0,
    dy = 0,
  }
  Object.initialize(self, opts.x or 0, opts.y or 0, config.PAD_WIDTH, config.PAD_HEIGHT)
  self.dy = opts.dy or 0
end

function Pad:setDirection(dy)
  self.dy = dy or self.dy
end

function Pad:update()
  local y = self.y + self.dy
  if y >= 0 and (y + self.height <= config.WINDOW_HEIGHT) then
    self.y = y
  end
end

function Pad:draw()
  love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

return Pad