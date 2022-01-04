#! /usr/bin/env ruby

require './book'
require_relative 'manage_people'
require './classroom'
require './rental'
require './options_message'

def all_books(books)
  i = 0
  puts 'Here is the list of books:'
  while i < books.length
    book = books[i]
    puts "Title: \"#{book.title}\", Author: #{book.author}"
    i += 1
  end
  puts ''
end

def create_book(books)
  print 'Title:'
  title = gets.chomp
  print 'Author:'
  author = gets.chomp
  book = Book.new(title, author)
  books.push(book)
  puts 'Book created successfully'
end

def loop_book(books)
  i = 0
  while i < books.length
    book = books[i]
    puts "#{i}) Title: \"#{book.title}\", Author: #{book.author}"
    i += 1
  end
end

def create_rental(rentals, books, people)
  puts 'select a book from the following list by number'
  loop_book(books)
  book_id = gets.chomp.to_i
  i = 0
  puts 'select a person from the following list by number (not id)'
  while i < people.length
    person = people[i]
    puts "#{i}) [#{person.class}]Name:  #{person&.name&.capitalize}, ID: #{person&.id}, Age: #{person&.age} "
    i += 1
  end
  person_id = gets.chomp.to_i
  print 'Date: '
  date = gets.chomp
  rental = Rental.new(people[person_id], books[book_id], date)
  rentals.push(rental)
  puts 'Rental created successfully'
  puts ''
end

def all_rental(rentals)
  print 'ID of person'
  id = gets.chomp.to_i
  puts 'Rentals:'
  i = 0
  while i < rentals.length
    rent = rentals[i]
    puts " Date: #{rent&.date}, Book \" #{rent&.book&.title}\" by #{rent&.person&.name}" if rent.person&.id == id
    i += 1
  end
end

def options(response, books, people, rentals)
  case response
  when 1
    all_books(books)
  when 2
    ManagePeople.all_person(people)
  when 3
    ManagePeople.create_person(people)
  when 4
    create_book(books)
  when 5
    create_rental(rentals, books, people)
  when 6
    all_rental(rentals)
  end
end

def main
  response = ''
  books = []
  people = []
  rentals = []
  while response != 7
    option_message
    print 'Please enter your choice:'
    response = gets.chomp.to_i
    options(response, books, people, rentals)
  end
  puts 'Thank you of used the App, we hope to see you soon!'
end

main
