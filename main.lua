local Board = require('board')
local Pieces = require('pieces')

DEFAULT_FONT = love.graphics.newFont('assets/fonts/RobotoSlab-Medium.ttf', 24, 'none')

function love.update(dt)
	Board:update(dt)
end

function love.draw()
  Board:draw()
	Pieces:draw()
end
