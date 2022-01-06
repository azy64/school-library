class Solver
  def factoria(num)
    if num.zero?
      1
    elsif num.negative?
      'exception'
    else
      num * factoria(num - 1)
    end
  end

  def reverser_string(alpa)
    alpa.reverse
  end

  def fizzbuzz(number)
    if (number % 5).zero? and (number % 3).zero?
      'FizzBuzz'
    elsif (number % 5).zero?
      'Buzz'
    elsif (number % 3).zero?
      'Fizz'
    else
      number
    end
  end
end
