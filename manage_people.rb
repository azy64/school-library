require './student'
require 'json'
require './teacher'
require './classroom'
require './rental'

class ManagePeople
  attr_accessor :people, :people_json

  def initialize(people = [])
    people_file = 'people.json'
    @people_json = []
    @people = people

    if File.exist? people_file
      f = File.read(people_file)
      json = JSON.parse(f)
      from_json(json)
    else
      @people = []
    end
  end

  def all_person
    i = 0

    puts 'Here is the list of person:'

    while i < @people.length

      person = @people[i]

      puts "[#{person.class}]Name:  #{person&.name&.capitalize}, ID: #{person&.id}, Age: #{person&.age} "

      i += 1

    end

    puts ''
  end

  def create_student
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

  def create_teacher
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

  def save_data
    people = to_json_obj
    # File.write('people.json', people) unless @people.empty?
    File.open('people.json', 'w') { |f| f.write people }
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2) [Input the number]:'

    choice = gets.chomp.to_i

    case choice

    when 1

      student = create_student

      @people.push(student)

    when 2

      teacher = create_teacher

      @people.push(teacher)

    end

    puts 'Person created successfully'
  end

  def to_json_obj
    i = 0
    while i < @people.length
      person = @people[i]
      # puts 'voici book:'
      # puts person.inspect
      b = if person.class.method_defined? :specialization
            { 'id' => person.id, 'age' => person.age, 'name' => person.name,
              'specialization' => person.specialization }
          else
            {
              'id' => person.id, 'age' => person.age, 'name' => person.name,
              'classroom' => person.classroom.label,
              'parent_permission' => person.parent_permission
            }

          end
      @people_json.push(b)
      i += 1
    end
    @people_json.to_json
  end

  def from_json(data)
    i = 0
    while i < data.length
      tmp = data[i]
      b = if tmp.key?('classroom')
            Student.new(Classroom.new(tmp['classroom']), tmp['age'], tmp['name'], tmp['parent_permission'])
          else
            Teacher.new(tmp['specialization'], tmp['age'], tmp['name'])
          end
      b.id = (tmp['id'])
      @people.push(b)
      i += 1
    end
  end

  def take_person_id(id)
    i = 0
    tmp = -1
    while i < @people.length
      if @people[i].id == id
        tmp = @people[i]
        break
      end
      i += 1
    end
    tmp
  end
end
