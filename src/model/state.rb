# frozen_string_literal: true

module Model
  Coord = Struct.new(row, col)

  class Food < Coord
  end

  Snake = Struct.new(positions)

  Grid = Struct.new(rows, cols)

  State = Struct.new(Snake, Food, Grid)
end
