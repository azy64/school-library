#! /usr/bin/env ruby

require './book'
require './student'
require './teacher'
require './classroom'
require './rental'
require './options_message'
require './manager_book'
require './manager_rental'

def all_person(people)
  i = 0
  puts 'Here is the list of person:'
  while i < people.length
    person = people[i]
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

def create_person(people)
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

def options(response, book_manager, people, rental_manager)
  case response
  when 1
    book_manager.all_books
  when 2
    all_person(people)
  when 3
    create_person(people)
  when 4
    book_manager.create_book
  when 5
    rental_manager.create_rental(book_manager.books, people)
  when 6
    rental_manager.all_rental
  end
end

def main
  response = ''
  book_manager = ManagerBook.new([])
  rental_manager = ManagerRental.new([])
  people = []
  while response != 7
    options_message
    print 'Please enter your choice:'
    response = gets.chomp.to_i
    options(response, book_manager, people, rental_manager)
  end
  puts 'Thank you of used the App, we hope to see you soon!'
end

main
