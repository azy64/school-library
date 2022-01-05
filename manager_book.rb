require 'json'
require './book'

class ManagerBook
  attr_accessor :books, :books_json

  def initialize(books = [])
    book_file = 'books.json'
    @books_json = []
    @books = books
    if File.exist? book_file
      f = File.read(book_file)
      unless f.empty?
        json = JSON.parse(f)
        # json.each { |entrie| @books.push(entrie) } unless json.empty?
        from_json(json)
      end
    else
      @books = []
    end
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

  def save_data
    obj = to_json_obj
    # File.write('books.json', JSON.generate(obj)) unless @books.empty?
    File.open('books.json', 'w') { |f| f.write obj }
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

  def to_json_obj
    i = 0
    while i < @books.length
      book = @books[i]
      # puts 'voici book:'
      # puts book.inspect
      b = {
        'title' => book.title,
        'author' => book.author
      }
      @books_json.push(b)
      i += 1
    end
    @books_json.to_json
  end

  def from_json(data)
    # data = JSON.load string
    # self.new data['a'], data['b']
    i = 0
    while i < data.length
      b = Book.new(data[i]['title'], data[i]['author'])
      @books.push(b)
      i += 1
    end
  end

  def take_book_title(title)
    i = 0
    tmp = -1
    while i < @books.length
      if @books[i].title == title
        tmp = @books[i]
        break
      end
      i += 1
    end
    tmp
  end
end
