# frozen_string_literal: true

require_relative 'view/ruby2d'
require_relative 'model/state'
require_relative 'controllers/controllers'

# Clase para ejecutar los diferentes acciones del juego
class App
  def initialize
    @estado = Model.init_state
    @speed = 0.5
  end

  def start
    @view = View::Ruby2dView.new(self)
    timer_thread = Thread.new { init_timer(@view) }
    @view.start(@estado)
    timer_thread.join
  end

  def init_timer(_view)
    snake_length = @estado.snake.positions.length
    loop do
      if @estado.game_finished
        puts 'Game Over!'
        puts "Score: #{@estado.snake.positions.length}"
        break
      end
      @estado = Controllers.move_snake(@estado)
      @view.render_game(@estado)
      if snake_length < @estado.snake.positions.length
        snake_length = @estado.snake.positions.length
        calculate_speed_increment
        puts "Velocidad actual: #{@speed}"
      end
      sleep @speed
    end
  end

  def send_action(action, params)
    new_estado = Controllers.send(action, @estado, params)
    if new_estado.hash != @estado
      @estado = new_estado
      @view.render_game(@estado)
    end
  end

  def calculate_speed_increment
    if @speed > 0.001
      @speed -= (@speed * 0.05)
      @speed = 0.001 if @speed < 0.001
    end
  end
end

app = App.new
app.start
