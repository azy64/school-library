require 'json'
require './manager_book'
require './manage_people'

class ManagerRental
  attr_accessor :rentals, :rentals_json

  def initialize(rentals)
    rentals_file = 'rentals.json'
    @rentals_json = []
    @rentals = rentals
    if File.exist? rentals_file
      f = File.read(rentals_file)
      json = JSON.parse(f) unless f.empty?
      from_json(json)
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
    # File.write('rentals.json', JSON.generate(@rentals)) unless @rentals.empty?
    rentals = to_json_obj
    File.open('rentals.json', 'w') { |f| f.write rentals }
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

  def to_json_obj
    i = 0
    while i < @rentals.length
      rent = @rentals[i]
      b = {
        'date' => rent.date,
        'id_person' => rent.person.id,
        'title_book' => rent.book.title
      }
      @rentals_json.push(b)
      i += 1
    end
    @rentals_json.to_json
  end

  def from_json(data)
    i = 0
    people_manager = ManagePeople.new([])
    book_manager = ManagerBook.new([])
    while i < data.length
      rent = data[i]
      b = Rental.new(people_manager.take_person_id(rent['id_person']),
                     book_manager.take_book_title(rent['title_book']),
                     rent['date'])
      @rentals.push(b)
      i += 1
    end
  end
end
