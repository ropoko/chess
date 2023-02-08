local Bishop = require('pieces.bishop')
local King = require('pieces.king')
local Knight = require('pieces.knight')
local Pawn = require('pieces.pawn')
local Queen = require('pieces.queen')
local Rook = require('pieces.rook')

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
	love.graphics.setColor(1,1,1)
	Bishop:draw()
	King:draw()
	Knight:draw()
	Pawn:draw()
	Queen:draw()
	Rook:draw()
end

return Pieces
