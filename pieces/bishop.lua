local Board = require('board')

local Bishop = {
	position = {}
}

function Bishop:update(dt)
	self:set_piece(8,3,8,6)
end

function Bishop:draw()
	for _,coord in pairs(self.position) do
		love.graphics.printf('Bishop', DEFAULT_FONT_SMALL, coord.x - 25, coord.y + 15, 100,'center')
	end
end

function Bishop:set_piece(row, column, row_2, column_2)
	Bishop.position = {
		[1] = {
			x = Board.data[column][row].x,
			y = Board.data[column][row].y,
		},
		[2] = {
			x = Board.data[column_2][row_2].x,
			y = Board.data[column_2][row_2].y
		}
	}

	Board.data[column][row].piece = 'bishop'
	Board.data[column_2][row_2].piece = 'bishop'
end

return Bishop
