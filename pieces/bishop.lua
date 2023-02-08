local Config = require('config')

local Bishop = {
	position = {
		[1] = {
			x = Config.size * 3,
			y = Config.size * Config.rows[8]
		},
		[2] = {
			x = Config.size * 6,
			y = Config.size * Config.rows[8]
		}
	}
}

function Bishop:draw()
	for _,coord in pairs(self.position) do
		love.graphics.printf('Bishop', DEFAULT_FONT_SMALL, coord.x - 25, coord.y + 15, 100,'center')
	end
end

return Bishop
