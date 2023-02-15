local Config = require('config')
local BoardData = require('board-data')

local Pawn = {
	position = {},
	qty_pawn = 8
}

function Pawn:load()
	for i=1, 8 do
		BoardData[i][7].piece = 'pawn_'..i
	end
end

function Pawn:update(dt)
	for i=1, 8 do
		for j=1, 8 do
			if BoardData[j][i].piece == tostring('pawn_'..j) then
				-- print(tostring('pawn_'..i))

				self.position[j] = {
					x = BoardData[j][i].x,
					y = BoardData[j][i].y
				}

				BoardData[j][i].piece = 'pawn_'..j
			end
		end
	end

	-- print(#self.position)
end

function Pawn:draw()
	for _,coord in pairs(self.position) do
		love.graphics.printf('Pawn', DEFAULT_FONT_SMALL, coord.x - 25, coord.y + 15, 100, 'center')
	end
end

function Pawn:show_possibility(row, column)
	self:up(row, column)
end

function Pawn:up(row, column)
	local x = BoardData[column][row - 1].x
	local y = BoardData[column][row - 1].y

	if self:has_piece(y,x) then return end

	BoardData[column][row - 1].preview = true

	love.graphics.rectangle('fill', x, y, Config.size, Config.size)
end

function Pawn:has_piece(row, column)
	return BoardData[column/Config.size][row/Config.size].piece ~= nil
end

return Pawn
