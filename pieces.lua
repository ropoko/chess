local Bishop = require('pieces.bishop')

local Pieces = {}

--[[
	2 rooks
	2 knights (horses)
	2 bishops
	1 queen
	1 king
	8 pawns
]]

function Pieces:draw()
	Bishop:draw(10,10)
end

return Pieces
