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
    reader = @orders.group_by(&:reader).sort_by { |reader,order| order.count}.reverse.map(&:first).first
    puts " - #{reader} often takes the book"
  end

  def top_books
    @orders.group_by(&:book).sort_by { |book,order| order.count }.reverse
  end

  def what_is_the_most_popular_book
    book = top_books.map(&:first).first
    puts " - The most popular book is \"#{book}\""
  end

  def count_of_orders_top_3_books
    count = top_books.first(3).map(&:last).flatten.map(&:reader).uniq.size
    puts " - #{count} people ordered one of the three most popular books"
  end

end