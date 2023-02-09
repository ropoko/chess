local Board = require('board')

local Knight = {
	position = {}
}

function Knight:update(dt)
	Knight:set_piece(8,2,8,7)
end

function Knight:draw()
	for _,coord in pairs(self.position) do
		love.graphics.printf('Knight', DEFAULT_FONT_SMALL, coord.x - 25, coord.y + 15, 100, 'center')
	end
end

function Knight:set_piece(row, column, row_2, column_2)
	Knight.position = {
		[1] = {
			x = Board.data[column][row].x,
			y = Board.data[column][row].y,
		},
		[2] = {
			x = Board.data[column_2][row_2].x,
			y = Board.data[column_2][row_2].y
		}
	}

	Board.data[column][row].piece = 'knight'
	Board.data[column_2][row_2].piece = 'knight'
end

return Knight
