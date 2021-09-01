local class = require('lib.middleclass')

local Object = class('Object')

function Object:initialize(x, y, width, height)
  self.x = x
  self.y = y
  self.width = width
  self.height = height
end

function Object:getBoundingBox()
  return {
    startX = self.x,
    startY = self.y,
    endX = self.x + self.width,
    endY = self.y + self.height
  }
end

return Object