# frozen_string_literal: true

require_relative 'view/ruby2d'
require_relative 'model/state'
require_relative 'controllers/controllers'

# Clase para ejecutar los diferentes acciones del juego
class App
  def initialize
    @estado = Model.init_state
  end

  def start
    @view = View::Ruby2dView.new(self)
    timer_thread = Thread.new { init_timer(@view) }
    @view.start(@estado)
    timer_thread.join
  end

  def init_timer(_view)
    loop do
      if @estado.game_finished
        puts 'Game Over!'
        puts "Score: #{@estado.snake.positions.length}"
        break
      end
      @estado = Controllers.move_snake(@estado)
      @view.render_game(@estado)
      sleep 0.5
    end
  end

  def send_action(action, params)
    new_estado = Controllers.send(action, @estado, params)
    if new_estado.hash != @estado
      @estado = new_estado
      @view.render_game(@estado)
    end
  end
end

app = App.new
app.start
