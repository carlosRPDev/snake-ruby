# frozen_string_literal: true

require 'minitest/autorun'

# Clase para realizar diferentes operaciones matematicas
class Calculator
  def suma(num_one, num_two)
    num_one + num_two
  end

  def resta(num_one, num_two)
    num_one + num_two
  end
end

# Clase que se va usar para realizar los test
class TestCalculator < Minitest::Test
  def setup
    @cal = Calculator.new
  end

  def test_suma_positives
    result = @cal.suma(1, 2)
    assert_equal result, 3
  end

  def test_suma_negatives
    result = @cal.suma(-1, -2)
    assert_equal result, -3
  end

  def test_suma_mesclados
    result = @cal.suma(1, -2)
    assert_equal result, -1
  end
end
