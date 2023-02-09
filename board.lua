local Config = require('config')

local Board = {
	rows = Config.rows,
  columns = Config.columns,
	size = Config.size,
	data = {} -- so we can take control over what piece is on each rectangle
}

function Board:init()
	local data = {}

	for i,_ in pairs(self.rows) do
		data[i] = {}
    for j,_ in pairs(self.columns) do
			data[i][j] = {
				x = i * self.size,
				y = j * self.size,
				piece = nil
			}
    end
  end

	self.data = data
end

function Board:update(dt) end

function Board:draw()
	love.graphics.setColor(1,1,1)

  for i,number in pairs(self.rows) do
    love.graphics.printf(tostring(number), DEFAULT_FONT,  i, i*self.size, 100, 'left')

    for j,letter in pairs(self.columns) do
      love.graphics.printf(letter, DEFAULT_FONT, j*self.size, j, 100, 'left')

      love.graphics.rectangle('line', i*self.size, j*self.size, self.size, self.size)
    end
  end

	love.graphics.setColor(0,0,0)

	self:mouse_hover()
end

function Board:mouse_hover()
	local x,y = love.mouse.getPosition()

	love.graphics.setColor(170/255,171/255,173/255)

	for i,_ in pairs(self.rows) do
		for j,_ in pairs(self.columns) do
			if (x >= i + self.size) and (x <= i * self.size + self.size)
				and (y >= j + self.size) and (y <= j * self.size + self.size) then

				love.graphics.rectangle('fill', (i * self.size), (j * self.size), self.size, self.size)
				return
			end
		end
	end

	love.graphics.setColor(1,1,1)
end

function love.mousepressed(x,y,btn)
	if btn == 1 then
		for i,_ in pairs(Board.rows) do
			for j,_ in pairs(Board.columns) do
				if (x >= i + Board.size) and (x <= i * Board.size + Board.size)
					and (y >= j + Board.size) and (y <= j * Board.size + Board.size) then
					Board:check_piece()
					return
				end
			end
		end
	end
end

function Board:check_piece()

end

return Board
