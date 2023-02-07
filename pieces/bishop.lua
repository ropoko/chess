local Bishop = {}

function Bishop:draw(x,y)
	love.graphics.printf('Bishop', DEFAULT_FONT, x,y, 100,'center')
end

return Bishop
