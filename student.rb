require './person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name, parent_permission)
    super(age)
    @name = name
    @parent_permission = parent_permission
    @classroom = classroom
    # @classroom.students.push(self) unless @classroom.students.include?(self)
  end

  def classroom=(classroom)
    @classroom = classroom
    @classroom.students.push(self) unless @classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
