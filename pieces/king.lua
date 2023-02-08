local Config = require('config')

local King = {
	position = {
		x = Config.size * 5,
		y = Config.size * Config.rows[8]
	}
}

function King:draw()
	love.graphics.printf('King', DEFAULT_FONT_SMALL, self.position.x - 25, self.position.y + 15, 100,'center')
end

return King
