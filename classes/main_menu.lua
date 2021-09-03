local class = require('lib.middleclass')
local Stack = require('classes.stack')
local helpers = require('helpers.main_menu_helpers')
local fonts = require('fonts')

local menu = {
  {
    title = 'Start'
  },
  {
    title = 'Options',
    sub = {
      {
        title = 'Left Player'
      },
      {
        title = 'Right Player'
      },
      {
        title = 'Score limit'
      },
      {
        title = 'Back'
      }
    }
  },
  {
    title = 'Exit'
  }
}


local MainMenu = class('MainMenu')

function MainMenu:initialize()
  self.nav = Stack:new()
  self.selected = 1
  self.nav:push(menu)
end

function MainMenu:keypressed(key)
  if key == 'up' and self.selected > 1 then
    self.selected = self.selected - 1
  elseif key == 'down' and self.selected < #self.nav:top() then
    self.selected = self.selected + 1
  elseif key == 'return' and self.nav:top()[self.selected].sub ~= nil then
    self.nav:push(self.nav:top()[self.selected].sub)
    self.selected = 1
  elseif key == 'escape' and self.nav.len > 1 then
    self.nav:pop()
    self.selected = 1
  end
end

function MainMenu:draw()
  love.graphics.setFont(fonts.menuTitleFont)
  for index, item in pairs(self.nav:top()) do
    if index == self.selected then
      helpers.drawSelectedItem(item, index)
    else
      helpers.drawNormalItem(item, index)
    end
  end
end


return MainMenu
