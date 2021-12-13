# frozen_string_literal: true

require 'ruby2d'
module View
  # Clase que contiene los metodos para poder rendelizar el juego en pantalla
  class Ruby2dView
    def initialize
      @pixel_size = 50
    end

    def start(state)
      extend Ruby2D::DSL
      set(
        title: 'Snake',
        width: @pixel_size * state.grid.cols,
        heigth: @pixel_size * state.grid.rows
      )
      show
    end

    def render_game(state)
      render_food(state)
      render_snake(state)
    end

    private

    def render_food(state)
      extend Ruby2D::DSL
      food = state.food
      Square.new(
        x: food.col * @pixel_size,
        y: food.row * @pixel_size,
        size: @pixel_size,
        color: 'yellow'
      )
    end

    def render_snake(state)
      extend Ruby2D::DSL
      snake = state.snake
      snake.positions.each do |pos|
        Square.new(
          x: pos.col * @pixel_size,
          y: pos.row * @pixel_size,
          size: @pixel_size,
          color: 'green'
        )
      end
    end
  end
end
