# frozen_string_literal: true

# Clase para realizar diferentes operaciones matematicas
class Calculator
  def suma(num_one, num_two)
    num_one + num_two
  end

  def resta(num_one, num_two)
    num_one - num_two
  end
end

cal = Calculator.new

test_sum = {
  [1, 2] => 3,
  [11, 5] => 16,
  [100, 200] => 300
}

test_sum.each do |input, expect_result|
  unless cal.suma(input[0], input[1]) == expect_result
    raise "Test Failed for input #{input}. Expect result #{expect_result}."
  end
end
