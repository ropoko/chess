local Board = {
	rows = { 1,2,3,4,5,6,7,8 },
  columns = { 'A','B','C','D','E','F','G','H' },
	size = 50
}

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

	love.graphics.setColor(1,0,0)

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

return Board
