local Config = require('config')

local Knight = {
	position = {
		[1] = {
			x = Config.size * 2,
			y = Config.size * Config.rows[8]
		},
		[2] = {
			x = Config.size * 7,
			y = Config.size * Config.rows[8]
		}
	}
}

function Knight:draw()
	for _,coord in pairs(self.position) do
		love.graphics.printf('Knight', DEFAULT_FONT_SMALL, coord.x - 25, coord.y + 15, 100, 'center')
	end
end

return Knight
