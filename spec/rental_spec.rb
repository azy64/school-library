require './rental'
require './teacher'
require './book'

describe Rental do
  it 'should initialize it\'s  parameters correctly' do
    teacher = Teacher.new('technician', 32, 'Mike')
    book = Book.new('The Hunger Games', 'Suzanne Collins')
    rental = Rental.new(teacher, book, '2002/05/04')

    expect(rental).to be_instance_of Rental
    expect(rental.book.title).to eql 'The Hunger Games'
    expect(rental.book.author).to eql 'Suzanne Collins'
    expect(rental.person.age).to eql 32
    expect(rental.person.name).to eql 'Mike'
  end
end