local Config = require('config')
local BoardData = require('board-data')

local Bishop = {
	position = {}
}

function Bishop:update(dt)
	self:set_piece(4,4,8,6)
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
	self:up_left(row, column)
	self:down_left(row, column)

	self:up_right(row, column)
	self:down_right(row, column)
end

function Bishop:up_left(row, column)
	local cont = 1

	while ((BoardData[column - cont] ~= nil) and (BoardData[row - cont] ~= nil)) do
		local x = BoardData[column - cont][row - cont].x
		local y = BoardData[column - cont][row - cont].y

		if self:has_piece(y,x) then return end

		cont = cont + 1

		love.graphics.rectangle('fill', x, y, Config.size, Config.size)
	end
end

function Bishop:down_left(row, column)
	local cont = 1

	while ((BoardData[column - cont] ~= nil) and (BoardData[row + cont] ~= nil)) do
		local x = BoardData[column - cont][row + cont].x
		local y = BoardData[column - cont][row + cont].y

		if self:has_piece(y,x) then return end

		cont = cont + 1

		love.graphics.rectangle('fill', x, y, Config.size, Config.size)
	end
end

function Bishop:up_right(row, column)
	local cont = 1

	while ((BoardData[column + cont] ~= nil) and (BoardData[row - cont] ~= nil)) do
		local x = BoardData[column + cont][row - cont].x
		local y = BoardData[column + cont][row - cont].y

		if self:has_piece(y,x) then return end

		cont = cont + 1

		love.graphics.rectangle('fill', x, y, Config.size, Config.size)
	end
end

function Bishop:down_right(row, column)
	local cont = 1

	while ((BoardData[column + cont] ~= nil) and (BoardData[row + cont] ~= nil)) do
		local x = BoardData[column + cont][row + cont].x
		local y = BoardData[column + cont][row + cont].y

		if self:has_piece(y,x) then return end

		cont = cont + 1

		love.graphics.rectangle('fill', x, y, Config.size, Config.size)
	end
end

function Bishop:has_piece(row, column)
	return BoardData[column/Config.size][row/Config.size].piece ~= nil
end

return Bishop
