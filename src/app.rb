# frozen_string_literal: true

require_relative 'view/ruby2d'
require_relative 'model/state'

# Clase para ejecutar los diferentes acciones del juego
class App
  def start
    view = View::Ruby2dView.new
    initial_state = Model.init_state
    view.render(initial_state)
  end

  def init_timer
    loop do
      sleep 0.5
      # Tigger movement
    end
  end
end
