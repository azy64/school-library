#! /usr/bin/env ruby

require './book'
require 'json'
require_relative 'manage_people'
require './classroom'
require './rental'
require './options_message'
require './manager_book'
require './manager_rental'

def options(response, book_manager, people_manager, rental_manager)
  case response
  when 1
    book_manager.all_books
  when 2
    people_manager.all_person
  when 3
    people_manager.create_person
  when 4
    book_manager.create_book
  when 5
    rental_manager.create_rental(book_manager.books, people_manager.people)
  when 6
    rental_manager.all_rental
  end
end

def main
  response = ''
  book_manager = ManagerBook.new([])
  rental_manager = ManagerRental.new([])
  people_manager = ManagePeople.new([])

  while response != 7
    options_message
    print 'Please enter your choice:'
    response = gets.chomp.to_i
    options(response, book_manager, people_manager, rental_manager)
  end
  book_manager.save_data
  rental_manager.save_data
  people_manager.save_data
  puts 'Thank you of used the App, we hope to see you soon!'
end

main
