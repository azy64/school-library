class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rent(rent)
    @rentals.push(rent)
    rent.book = self
  end
end
