# frozen_string_literal: true

# Modulo que implementa la logica del movimiento de la snake
module Controllers
  def self.move_snake(_state)
    next_direction = state.next_direction
    # Metodo que calcula la siguiente posicion
    next_position = calc_next_position(state)
    # verificar que la siguiente casilla sea valida
    if position_is_valid?(state, next_position)
      # si es valida -> movemos la serpiente
      move_snake_to_next_position(state, next_position)
    else
      # si no es  valida -> termina juego
      end_game(state)
    end
  end

  private

  def calc_next_position(state)
    curr_position = state.snake.positions.first
    case state.next_direction
    when UP
      # Decrementar Fila
      Model::Coord.new(curr_position.row - 1, curr_position.col)
    when RIGHT
      # Incrementar col
      Model::Coord.new(curr_position.row, curr_position.col + 1)
    when DOWN
      # Incrementar fila
      Model::Coord.new(curr_position.row + 1, curr_position.col)
    when LEFT
      # Decremental col
      Model::Coord.new(curr_position.row, curr_position.col - 1)
    end
  end

  def position_is_valid?(state, next_position); end
end
