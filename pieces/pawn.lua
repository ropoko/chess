local BoardData = require('board-data')

local Pawn = {
	position = {},
	qty_pawn = 8
}

function Pawn:update(dt)
	self:set_piece(
		7,1,
		7,2,
		7,3,
		7,4,
		7,5,
		7,6,
		7,7,
		7,8
	)
end

function Pawn:draw()
	for _,coord in pairs(self.position) do
		love.graphics.printf('Pawn', DEFAULT_FONT_SMALL, coord.x - 25, coord.y + 15, 100, 'center')
	end
end

function Pawn:set_piece(...)
	local args = { ... }

	for i=1, (self.qty_pawn * 2), 2 do
		self.position[i] = {
			x = BoardData[args[i + 1]][args[i]].x,
			y = BoardData[args[i + 1]][args[i]].y
		}

		BoardData[args[i + 1]][args[i]].piece = 'pawn'
	end
end

return Pawn
