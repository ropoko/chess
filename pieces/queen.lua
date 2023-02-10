local BoardData = require('board-data')

local Queen = {
	position = {}
}

function Queen:update(dt)
	self:set_piece(8,4)
end

function Queen:draw()
	love.graphics.printf('Queen', DEFAULT_FONT_SMALL, self.position.x - 25, self.position.y + 15, 100,'center')
end

function Queen:set_piece(row, column)
	self.position = {
		x = BoardData[column][row].x,
		y = BoardData[column][row].y
	}

	BoardData[column][row].piece = 'queen'
end

return Queen
