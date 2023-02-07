local Board = {}

local roboto_font = love.graphics.newFont('assets/fonts/RobotoSlab-Medium.ttf', 24, 'none')

function Board:draw()
  local rows = { 1,2,3,4,5,6,7,8 }
  local columns = { 'A','B','C','D','E','F','G','H' }

  local size = 50

  for i,number in pairs(rows) do
    love.graphics.printf(tostring(number), roboto_font,  i, i*size, 100, 'left')

    for j,letter in pairs(columns) do
      love.graphics.printf(letter, roboto_font, j*size, j, 100, 'left')

      love.graphics.rectangle('line', i*size, j*size, size, size)
    end
  end
end

return Board
