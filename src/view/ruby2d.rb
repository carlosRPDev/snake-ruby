# frozen_string_literal: true

require 'ruby2d'
module View
  # Clase que contiene los metodos para poder rendelizar el juego en pantalla
  class Ruby2dView
    def initialize(app)
      @pixel_size = 50
      @app = app
    end

    def start(state)
      extend Ruby2D::DSL
      set(
        title: 'Snake',
        width: @pixel_size * state.grid.cols,
        heigth: @pixel_size * state.grid.rows
      )
      on :key_down do |event|
        # A key was pressed
        handle_key_event(event)
      end
      show
    end

    def render_game(state)
      extend Ruby2D::DSL
      close if state.game_finished
      render_food(state)
      render_snake(state)
    end

    private

    def render_food(state)
      @food.remove if @food
      extend Ruby2D::DSL
      food = state.food
      @food = Square.new(
        x: food.col * @pixel_size,
        y: food.row * @pixel_size,
        size: @pixel_size,
        color: 'yellow'
      )
    end

    def render_snake(state)
      # if @snake_positions
      # @snake_positions.each do |pos|
      # pos.remove
      # end
      # end

      # El codigo que sigue realiza la misma funcion que el codigo de arriba,
      # la diferencia es que cuando al metodo se le pasa un bloque podemos utilizar
      # la anotacion especial &: dentro de parentesis ya que hace referencia a la variable
      # que se le pasa al bloque y despues de los dos puntos utilizamos el metodo a tulizar
      # para leer esta linea de codigo seria
      # iteramos una vaiable de instancia que contiene un array con ampensar (&) a cada iteracion
      # le estamos ejecutando el metodo remove si existe la variable de instancia
      @snake_positions.each(&:remove) if @snake_positions

      extend Ruby2D::DSL
      snake = state.snake
      @snake_positions = snake.positions.map do |pos|
        Square.new(
          x: pos.col * @pixel_size,
          y: pos.row * @pixel_size,
          size: @pixel_size,
          color: 'green'
        )
      end
    end

    def handle_key_event(event)
      case event.key
      when 'up'
        # cambiar direccion hacia arriba
        @app.send_action(:change_direction, Model::Direction::UP)
      when 'down'
        # cambiar direccion hacia abajo
        @app.send_action(:change_direction, Model::Direction::DOWN)
      when 'left'
        # cambiar direccion hacia izquierda
        @app.send_action(:change_direction, Model::Direction::LEFT)
      when 'right'
        # cambia direccion hacia derecha
        @app.send_action(:change_direction, Model::Direction::RIGHT)
      end
    end
  end
end
