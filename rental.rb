class Rental
  attr_accessor :date, :book, :person

  def initialize(person, book, date)
    @date = date
    @person = person
    @book = book
    @book.rentals.push(self)
    @person.rentals.push(self)
  end

  def add_book(book)
    @book = book
    @book.rentals.push(self) unless @book.rentals.include?(self)
  end

  def add_person(person)
    @person = person
    @person.rentals.push(self) unless @person.rentals.include?(self)
  end
end
