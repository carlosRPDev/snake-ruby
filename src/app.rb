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
    view = View::Ruby2dView.new
    Thread.new { init_timer(view) }
    view.start(@estado)
  end

  def init_timer(view)
    loop do
      @estado = Controllers.move_snake(@estado)
      view.render_game(@estado)
      sleep 0.5
    end
  end
end

app = App.new
app.start
