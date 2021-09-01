local config = require('config')
local Game = require('classes.game')

local game = nil

function love.load()
  love.window.setMode(config.WINDOW_WIDTH, config.WINDOW_HEIGHT, { vsync = false })
  game = Game:new()
end

function love.update(dt)
  game:update()
end

function love.draw()
  game:draw()
end
