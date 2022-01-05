require 'json'

class ManagerRental
  attr_accessor :rentals

  def initialize(rentals)
    rentals_file = 'rentals.json'

    if File.exist? rentals_file
      @rentals = rentals
      JSON.parse(File.read(rentals_file)).each { |entrie| @rentals.push(entrie) }
    else
      @rentals = []
    end
  end

  def all_rental
    print 'ID of person'
    id = gets.chomp.to_i
    puts 'Rentals:'
    i = 0
    while i < @rentals.length
      rent = @rentals[i]
      puts " Date: #{rent&.date}, Book \" #{rent&.book&.title}\" by #{rent&.person&.name}" if rent.person&.id == id
      i += 1
    end
  end

  # displaying books and their author---------
  def loop_on(books)
    i = 0
    while i < books.length
      book = books[i]
      puts "#{i}) Title: \"#{book.title}\", Author: #{book.author}"
      i += 1
    end
  end

  def save_data
    File.write('rentals.json', JSON.generate(@rentals)) unless @rentals.empty?
  end

  def create_rental(books, people)
    puts 'select a book from the following list by number'
    loop_on(books)
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
    @rentals.push(rental)
    puts 'Rental created successfully'
    puts ''
  end
end
