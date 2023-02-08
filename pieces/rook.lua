local Config = require('config')

local Rook = {
	position = {
		[1] = {
			x = Config.size,
			y = Config.size * Config.rows[8]
		},
		[2] = {
			x = Config.size * Config.rows[8],
			y = Config.size * Config.rows[8]
		}
	}
}

function Rook:draw()
	for _,coord in pairs(self.position) do
		love.graphics.printf('Rook', DEFAULT_FONT_SMALL, coord.x - 25, coord.y + 15, 100,'center')
	end
end

return Rook
