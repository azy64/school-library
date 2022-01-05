require './corrector'

class Person
  attr_accessor :name, :age, :corrector, :id, :parent_permission
  attr_reader :rentals

  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  def can_use_services?
    of_age? && @parent_permission
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def add_rent(rent)
    @rentals.push(rent)
    rent.person = self
  end

  def of_age?
    @age >= 18
  end
  private :of_age?
end
