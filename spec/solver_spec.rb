require './solver'

RSpec.describe 'Solver' do
  it 'generates the factorial of a number' do
    solver = Solver.new
    factor = solver.factoria(5)
    expect(factor).to eq 120
    expect(solver.factoria(0)).to eq 1
    expect(solver.factoria(-1)).to eq 'exception'
  end
  it 'generates the reversed string' do
    solver = Solver.new
    factor = solver.reverser_string('mane')
    expect(factor).to eql 'enam'
  end
  it 'generates fizz or buzz' do
    solver = Solver.new
    expect(solver.fizzbuzz(3)).to eql 'Fizz'
    expect(solver.fizzbuzz(15)).to eql 'FizzBuzz'
    expect(solver.fizzbuzz(7)).to eql 7
  end
end
