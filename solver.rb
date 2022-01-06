class Solver
  def factoria(n)
    f = 1
    (1..n).each do |i|
      f *= i
    end
    f
  end

  def reverser_string(n)
    n.reverse
  end

  def fizzbuzz(n)
    if n % 3 == 0
      'Fizz'
    elsif n % 5 == 0
      'Buzz'
    elsif n % 5 == 0 and n % 3 == 0
      'FizzBuzz'
    else
      n
    end
  end
end
