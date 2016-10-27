class Order

  attr_accessor :book, :reader

  def initialize(book, reader)
    @book = book
    @reader = reader
    @date = Time.now
  end

  def to_s
    "#{@book}"
  end

end