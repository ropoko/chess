local BoardData = require('board-data')

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
			x = BoardData[column][row].x,
			y = BoardData[column][row].y,
		},
		[2] = {
			x = BoardData[column_2][row_2].x,
			y = BoardData[column_2][row_2].y
		}
	}

	BoardData[column][row].piece = 'knight'
	BoardData[column_2][row_2].piece = 'knight'
end

return Knight
