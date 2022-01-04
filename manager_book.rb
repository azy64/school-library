class ManagerBook
  attr_accessor :books

  def initialize(books = [])
    @books = books
  end

  def all_books
    i = 0
    puts 'Here is the list of books:'
    while i < @books.length
      book = @books[i]
      puts "Title: \"#{book.title}\", Author: #{book.author}"
      i += 1
    end
    puts ''
  end

  # this method create a new book

  def create_book
    print 'Title:'
    title = gets.chomp
    print 'Author:'
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
  end
end
