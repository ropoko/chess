local Bishop = require('pieces.bishop')
local King = require('pieces.king')
local Knight = require('pieces.knight')
local Pawn = require('pieces.pawn')
local Queen = require('pieces.queen')
local Rook = require('pieces.rook')

local BoardData = require('board-data')

local Pieces = {
	possibilities = nil,
	piece_selected = {
		row = nil,
		col = nil,
		name = nil
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

function Pieces:load()
	Bishop:load()
	Pawn:load()
end

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
		self:show_possibilities()
	end
end

function Pieces:check_piece(piece)
	if piece == nil or BoardData[piece.y][piece.x].piece == nil then
		self.possibilities = nil

		self. piece_selected = {
			row = nil,
			col = nil,
			name = nil
		}

		self:remove_preview()

		return
	end

	self.piece_selected = {
		row = piece.x,
		col = piece.y,
		name = BoardData[piece.y][piece.x].piece
	}

	self:show_possibilities()
end

function Pieces:show_possibilities()
	self.possibilities = self.piece_selected

	love.graphics.setColor(155/255, 168/255, 34/255)

	local piece_name = self:get_name(self.piece_selected.name)

	-- sorry
	require('pieces/'..piece_name):show_possibility(self.piece_selected.row, self.piece_selected.col)

	love.graphics.setColor(1,1,1)
end

function Pieces:get_name(piece_name)
	local indexof = piece_name:find('_')

	local name = piece_name:sub(1, indexof - 1)

	return name
end

function Pieces:move_piece(piece, row, column)
	local current_col = piece.y
	local current_row = piece.x

	-- print(current_col, current_row, column, row)

	BoardData[current_col][current_row].piece = nil

	BoardData[column][row].piece = self.piece_selected.name
end

function Pieces:unselect_piece()
	self.piece_selected = {
		row = nil,
		col = nil,
		name = nil
	}
end

function Pieces:remove_preview()
	for i=1, 8 do
		for j=1, 8 do
			BoardData[j][i].preview = false
		end
	end
end

return Pieces
