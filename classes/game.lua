local class = require('lib.middleclass')
local config = require('config')
local utils = require('utils')

local padHelpers = require('helpers.pad_helpers')
local ballHelpers = require('helpers.ball_helpers')
local fonts = require('fonts')

local ScoreManager = require('classes.score_manager')
local MainMenu = require('classes.main_menu')

local GameStates = {
  Menu = 1,
  InGame = 2,
  End = 3
}

local Game = class('Game')

function Game:initialize()
  self.scoreManager = ScoreManager:new(3)
  self.mainMenu = MainMenu:new()
  self:reset()
end

function Game:setState(state)
  self.state = state
end

function Game:createBall()
  self.ball = ballHelpers.createBall()
end

function Game:createPads()
  self.leftPad, self.rightPad = padHelpers.createPads()
end

function Game:keypressed(key)
  if self.state == GameStates.Menu then
    self.mainMenu:keypressed(key)
  end
end

function Game:update()
  if self.state == GameStates.Menu then
    -- self:updateMenu()
  elseif self.state == GameStates.InGame then
    self:updateGame()
  else
    self:updateGameOver()
  end
end

function Game:draw()
  if self.state == GameStates.Menu then
    self:drawMenu()
  elseif self.state == GameStates.InGame then
    self:drawGame()
  else
    self:drawGameOver()
  end
end

-- function Game:updateMenu()
--   if love.keyboard.isDown('return') then
--     self:setState(GameStates.InGame)
--   end
-- end

function Game:updateGame()
  padHelpers.checkPadMovement(self.rightPad, 'up', 'down')
  padHelpers.checkPadMovement(self.leftPad, 'w', 's')

  self.ball:update()
  self.leftPad:update()
  self.rightPad:update()

  if utils.isBallCollideLeftPad(self.ball, self.leftPad) then
    self.ball:setDirection({ dx = 1 })
  end

  if utils.isBallCollideRightPad(self.ball, self.rightPad) then
    self.ball:setDirection({ dx = -1 })
  end

  if utils.isBallCollideLeftWall(self.ball) then
    self.scoreManager:incrementRightScore()
    self:createBall()
  end

  if utils.isBallCollideRightWall(self.ball) then
    self.scoreManager:incrementLeftScore()
    self:createBall()
  end

  if utils.isBallCollideCeilOrFloor(self.ball) then
    self.ball:setDirection({ dy = -self.ball.dy })
  end

  if self.scoreManager:isGameOver() then
    self:setState(GameStates.End)
  end
end

function Game:updateGameOver()
  if love.keyboard.isDown('space') then
    self:reset()
  end
end

function Game:drawMenu()
  self.mainMenu:draw()
  -- love.graphics.setFont(fonts.menuTitleFont)
  -- love.graphics.printf('Pong, the Game', 0, config.WINDOW_HEIGHT / 4, config.WINDOW_WIDTH, 'center')
  -- love.graphics.setFont(fonts.menuHintFont)
  -- love.graphics.printf('Press "Enter" to start', 0, config.WINDOW_WIDTH / 2, config.WINDOW_WIDTH, 'center')
end

function Game:drawGame()
  self.scoreManager:draw()
  self.ball:draw()
  self.rightPad:draw()
  self.leftPad:draw()
end

function Game:drawGameOver()
  love.graphics.setFont(fonts.menuTitleFont)
  love.graphics.printf('Game Over', 0, config.WINDOW_HEIGHT / 4, config.WINDOW_WIDTH, 'center')
end

function Game:reset()
  self.state = GameStates.Menu
  self.scoreManager:reset()
  self:createBall()
  self:createPads()
end

return Game