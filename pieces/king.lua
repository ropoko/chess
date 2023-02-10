local BoardData = require('board-data')

local King = {
	position = {}
}

function King:update(dt)
	King:set_piece(8,5)
end

function King:draw()
	love.graphics.printf('King', DEFAULT_FONT_SMALL, self.position.x - 25, self.position.y + 15, 100,'center')
end

function King:set_piece(row, column)
	King.position = {
		x = BoardData[column][row].x,
		y = BoardData[column][row].y
	}

	BoardData[column][row].piece = 'king'
end

return King
