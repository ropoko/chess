local Config = require('config')

local Pawn = {}

function Pawn:draw()
	for i=1, 8 do
		local x = Config.size * i
		local y = Config.size * Config.rows[7]

		love.graphics.printf('Pawn', DEFAULT_FONT_SMALL, x - 25, y + 15, 100, 'center')
	end
end

return Pawn
