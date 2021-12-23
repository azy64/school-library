require './corrector'

class Person
  attr_accessor :name, :age, :corrector
  attr_reader :id, :rentals

  def initialize(age, name = 'unknown', parent_permission: true)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @id = Random.rand(1..1000)
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
  private :is_of_age?
end

p = Person.new(21, 'ALLY', true)
puts(p.name + " -- #{p.age}")
p.name = ('SAIDI ALLY')
puts(p.can_use_services?)
