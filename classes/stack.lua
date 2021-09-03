local class = require('lib.middleclass')

local Stack = class('Stack')

function Stack:initialize()
  self._top = { value = nil, prev = nil }
  self.len = 0
end

function Stack:top()
  return self._top.value
end

function Stack:push(value)
  self._top = { value = value, prev = self._top }
  self.len = self.len + 1
end

function Stack:pop()
  if self.len > 0 then
    local top = self._top.value
    self._top = self._top.prev
    self.len = self.len - 1
    return top
  end
  return nil
end

return Stack