class Solver
  def factoria(num)
    f = 1
    (1..num).each do |i|
      f *= i
    end
    f
  end

  def reverser_string(alpa)
    alpa.reverse
  end

  def fizzbuzz(number)
    if (number % 3).zero?
      'Fizz'
    elsif (number % 5).zero?
      'Buzz'
    elsif (number % 5).zero? and (number % 3).zero?
      'FizzBuzz'
    else
      number
    end
  end
end
