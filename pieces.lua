local Bishop = require('pieces.bishop')
local King = require('pieces.king')
local Knight = require('pieces.knight')
local Pawn = require('pieces.pawn')
local Queen = require('pieces.queen')
local Rook = require('pieces.rook')

local Pieces = {
	possibilities = nil,
	piece_selected = {
		row = nil,
		col = nil
	}
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

function Pieces:check_piece(piece, row, column)
	if piece == nil then
		self.possibilities = nil

		self. piece_selected = {
			row = nil,
			col = nil
		}

		return
	end

	self.piece_selected = {
		row = row,
		col = column
	}

	self:show_possibilities(piece)
end

function Pieces:show_possibilities(piece_name)
	self.possibilities = piece_name

	love.graphics.setColor(155/255, 168/255, 34/255)

	-- sorry
	require('pieces/'..piece_name):show_possibility(self.piece_selected.row, self.piece_selected.col)

	love.graphics.setColor(1,1,1)
end

return Pieces
