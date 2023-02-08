local Config = require('config')

local Queen = {
	position = {
		x = Config.size * 4,
		y = Config.size * Config.rows[8]
	}
}

function Queen:draw()
	love.graphics.printf('Queen', DEFAULT_FONT_SMALL, self.position.x - 25, self.position.y + 15, 100,'center')
end

return Queen
