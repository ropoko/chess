local BoardData = require('board-data')

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
			x = BoardData[column][row].x,
			y = BoardData[column][row].y
		},
		[2] = {
			x = BoardData[column_2][row_2].x,
			y = BoardData[column_2][row_2].y
		}
	}

	BoardData[column][row].piece = 'rook'
	BoardData[column_2][row_2].piece = 'rook'
end

function Rook:show_possibility()
	love.graphics.rectangle('fill', 100,100,100,100)
end

return Rook
