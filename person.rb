class Person
    attr_accessor :id, :name, :age
    def initialize(age, name = 'unknown', parent_permission = true)
        @age = age
        @name = name
        @parent_permission = parent_permission
    end
    def can_use_services?
        is_of_age? && @parent_permission
    end
    def is_of_age?
        @age >= 18
    end
    private :is_of_age?
end

p = Person.new(21,"ALLY",true)
puts(p.name+" -- #{p.age}")
p.name=("SAIDI ALLY")
puts(p.can_use_services?)