require './book'

describe 'Book' do
  it 'should say victor when we call the class Book.name' do
    hw = Book.new('victor', 'jk rowlings')
    bookname = hw.title
    expect(bookname).to eq 'victor'
  end
end
