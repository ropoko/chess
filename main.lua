local Board = require('board')
local Pieces = require('pieces')

DEFAULT_FONT = love.graphics.newFont('assets/fonts/RobotoSlab-Medium.ttf', 24, 'none')
DEFAULT_FONT_SMALL = love.graphics.newFont('assets/fonts/RobotoSlab-Medium.ttf', 15, 'none')

function love.load()
	Board:init()
end

function love.update(dt)
	Board:update(dt)
	Pieces:update(dt)
end

function love.draw()
  Board:draw()
	Pieces:draw()
end
