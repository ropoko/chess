local Board = require('board')

function love.update(dt)
	Board:update(dt)
end

function love.draw()
  Board:draw()
end
