require './solver'

RSpec.describe "Solver" do
    it "generates the factorial of a number" do
      solver = Solver.new
      factor = solver.factoria(5)
      expect(factor).to eq 120
    end
    it "generates the reversed string" do
        solver = Solver.new
        factor = solver.reverser_string('mane')
        expect(factor).to eql 'enam'
    end
    it "generates fizz or buzz" do
        solver = Solver.new
        factor = solver.fizzbuzz(5)
        expect(factor).to eql 'Buzz'
    end
  end