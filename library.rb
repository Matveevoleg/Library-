require_relative 'Modules/IOmodule'

class Library

  include(IOModule)

  attr_accessor :books, :orders, :readers, :authors

  def initialize(books, orders, readers, authors)
    @books = books
    @orders = orders
    @readers = readers
    @authors = authors
  end

  def who_often_takes_the_book
    @orders.group_by(&:reader).sort_by { |reader,order| order.count}.reverse.map(&:first).first.to_s
  end

  def top_books (count_of_books = 1)
    @orders.group_by(&:book).sort_by { |_,order| order.count }.reverse.first(count_of_books)
  end

  def what_is_the_most_popular_book
    top_books.map(&:first).first.to_s
  end

  def count_of_orders_top_3_books
    top_books(3).map(&:last).flatten.map(&:reader).uniq.size.to_s
  end

  def self.load_library (path_to_file)
    extend IOModule
    data = load_from_yaml(path_to_file)
    Library.new(data.books, data.orders, data.readers,data.authors)
  end

end