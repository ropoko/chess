local Config = require('config')
local BoardData = require('board-data')

local Bishop = {
	position = {}
}

function Bishop:load()
	BoardData[3][8].piece = 'bishop_1'
	BoardData[6][8].piece = 'bishop_2'
end

function Bishop:update(dt)
	for i=1,8 do
		for j=1,8 do
			if BoardData[j][i].piece == 'bishop_1' then
				self.position[1] = {
					x = BoardData[j][i].x,
					y = BoardData[j][i].y
				}

				BoardData[j][i].piece = 'bishop_1'
			end

			if BoardData[j][i].piece == 'bishop_2' then
				self.position[2] = {
					x = BoardData[j][i].x,
					y = BoardData[j][i].y
				}

				BoardData[j][i].piece = 'bishop_2'
			end
		end
	end
end

function Bishop:draw()
	for _,coord in pairs(self.position) do
		love.graphics.printf('Bishop', DEFAULT_FONT_SMALL, coord.x - 25, coord.y + 15, 100,'center')
	end
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

		BoardData[column - cont][row - cont].preview = true

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

		BoardData[column - cont][row + cont].preview = true

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

		BoardData[column + cont][row - cont].preview = true

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

		BoardData[column + cont][row + cont].preview = true

		cont = cont + 1

		love.graphics.rectangle('fill', x, y, Config.size, Config.size)
	end
end

function Bishop:has_piece(row, column)
	return BoardData[column/Config.size][row/Config.size].piece ~= nil
end

return Bishop
