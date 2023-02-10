local Bishop = require('pieces.bishop')
local King = require('pieces.king')
local Knight = require('pieces.knight')
local Pawn = require('pieces.pawn')
local Queen = require('pieces.queen')
local Rook = require('pieces.rook')

local BoardData = require('board-data')

local Pieces = {
	possibilities = nil
}

--[[
	2 rooks
	2 knights (horses)
	2 bishops
	1 queen
	1 king
	8 pawns
]]

function Pieces:update(dt)
	Bishop:update(dt)
	King:update(dt)
	Knight:update(dt)
	Pawn:update(dt)
	Queen:update(dt)
	Rook:update(dt)
end

function Pieces:draw()
	love.graphics.setColor(1,1,1)
	Bishop:draw()
	King:draw()
	Knight:draw()
	Pawn:draw()
	Queen:draw()
	Rook:draw()

	if self.possibilities ~= nil then
		self:show_possibilities(self.possibilities)
	end
end

function Pieces:check_piece(piece)
	if piece == nil then return end

	local piece_name = piece:gsub("^%l", string.upper)

	print(piece_name)

	self:show_possibilities(piece_name)
end

function Pieces:show_possibilities(piece_name)
	self.possibilities = piece_name

	love.graphics.setColor(1,0,0)
	love.graphics.rectangle('fill', 100, 100, 100, 100)
	love.graphics.setColor(1,1,1)
end

return Pieces
