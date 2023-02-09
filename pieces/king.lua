local Board = require('board')

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
		x = Board.data[column][row].x,
		y = Board.data[column][row].y
	}

	Board.data[column][row].piece = 'king'
end

return King
