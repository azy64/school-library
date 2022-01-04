require './student'

require './teacher'

require './classroom'

require './rental'

class ManagePeople
  def self.all_person(people)
    i = 0

    puts 'Here is the list of person:'

    while i < people.length

      person = people[i]

      puts "[#{person.class}]Name:  #{person&.name&.capitalize}, ID: #{person&.id}, Age: #{person&.age} "

      i += 1

    end

    puts ''
  end

  def self.create_student
    print 'Age:'

    age = gets.chomp.to_i

    print 'Name:'

    name = gets.chomp

    print 'Has parents permission? [Y/N]:'

    permit = gets.chomp.upcase == 'Y'

    classroom = Classroom.new('L1')

    student = Student.new(classroom, age, name, permit)

    student.validate_name

    student
  end

  def self.create_teacher
    print 'Age:'

    age = gets.chomp.to_i

    print 'Name:'

    name = gets.chomp

    print 'Specialization:'

    specialization = gets.chomp

    teacher = Teacher.new(specialization, age, name)

    teacher.validate_name

    teacher
  end

  def self.create_person(people)
    print 'Do you want to create a student (1) or a teacher (2) [Input the number]:'

    choice = gets.chomp.to_i

    case choice

    when 1

      student = create_student

      people.push(student)

    when 2

      teacher = create_teacher

      people.push(teacher)

    end

    puts 'Person created successfully'
  end
end
