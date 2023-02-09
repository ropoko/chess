local Board = require('board')

local Rook = {
	position = {}
}

function Rook:update(dt)
	self:set_piece(8,1,8,8)
end

function Rook:draw()
	for _,coord in pairs(self.position) do
		love.graphics.printf('Rook', DEFAULT_FONT_SMALL, coord.x - 25, coord.y + 15, 100,'center')
	end
end

function Rook:set_piece(row, column, row_2, column_2)
	self.position = {
		[1] = {
			x = Board.data[column][row].x,
			y = Board.data[column][row].y
		},
		[2] = {
			x = Board.data[column_2][row_2].x,
			y = Board.data[column_2][row_2].y
		}
	}
end

return Rook
