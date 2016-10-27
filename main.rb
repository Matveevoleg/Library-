require_relative 'author'
require_relative 'book'
require_relative 'reader'
require_relative 'order'
require_relative 'library'

author1 = Author.new('Author-1', 'Author_1_biography')
author2 = Author.new('Author-2', 'Author_2_biography')
author3 = Author.new('Author-3', 'Author_3_biography')
author4 = Author.new('Author-4', 'Author_4_biography')
author5 = Author.new('Author-5', 'Author_5_biography')

book_1 = Book.new('Book_1', author1)
book_2 = Book.new('Book_2', author2)
book_3 = Book.new('Book_3', author3)
book_4 = Book.new('Book_4', author4)
book_5 = Book.new('Book_5', author5)

reader_1 = Reader.new('Reader_1', 'reader_1@gmail.com', 'city_1', 'street_1', 1)
reader_2 = Reader.new('Reader_2', 'reader_2@gmail.com', 'city_2', 'street_2', 2)
reader_3 = Reader.new('Reader_3', 'reader_3@gmail.com', 'city_3', 'street_3', 3)
reader_4 = Reader.new('Reader_4', 'reader_4@gmail.com', 'city_4', 'street_4', 4)
reader_5 = Reader.new('Reader_5', 'reader_5@gmail.com', 'city_5', 'street_5', 5)

order_1 = Order.new(book_1, reader_1)
order_2 = Order.new(book_2, reader_2)
order_3 = Order.new(book_3, reader_3)
order_4 = Order.new(book_1, reader_4)
order_5 = Order.new(book_2, reader_5)
order_6 = Order.new(book_2, reader_1)
order_7 = Order.new(book_2, reader_1)
order_8 = Order.new(book_4, reader_3)
order_9 = Order.new(book_5, reader_2)
order_10 = Order.new(book_3, reader_4)
order_11 = Order.new(book_2, reader_5)


lib = Library.new([book_1, book_2, book_3, book_4, book_5],
                  [order_1, order_2, order_3, order_4, order_5, order_6, order_7, order_8, order_9, order_10, order_11],
                  [reader_1, reader_2, reader_3, reader_4, reader_5],
                  [author1, author2, author3, author4, author5])


lib.who_often_takes_the_book
lib.what_is_the_most_popular_book
lib.count_of_orders_top_3_books
lib.save_to_yaml

puts "\n Load library \n\n"

data = Library.load_from_yaml('library.yaml')
lib2 = Library.new(data.books, data.orders, data.readers,data.authors)

lib2.who_often_takes_the_book
lib2.what_is_the_most_popular_book
lib2.count_of_orders_top_3_books
