local Config = require('config')
local BoardData = require('board-data')

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
			x = BoardData[column][row].x,
			y = BoardData[column][row].y,
		},
		[2] = {
			x = BoardData[column_2][row_2].x,
			y = BoardData[column_2][row_2].y
		}
	}

	BoardData[column][row].piece = 'bishop'
	BoardData[column_2][row_2].piece = 'bishop'
end

function Bishop:show_possibility(row, column)
	love.graphics.rectangle('fill', column * Config.size, row * Config.size, Config.size, Config.size)
	-- BoardData[column][row]
	-- for i,_ in pairs(Config.rows) do
  --   for j,_ in pairs(Config.columns) do
	-- 		love.graphics.rectangle('fill',  j, i * Config.size, Config.size, Config.size)
  --   end
  -- end
end

return Bishop
