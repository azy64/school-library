#! /usr/bin/env ruby

require './book'
require_relative 'manage_people'
require './classroom'
require './rental'
require './options_message'
require './manager_book'
require './manager_rental'

def options(response, book_manager, people, rental_manager)
  case response
  when 1
    book_manager.all_books
  when 2
    ManagePeople.all_person(people)
  when 3
    ManagePeople.create_person(people)
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
