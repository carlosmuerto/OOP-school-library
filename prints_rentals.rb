require_relative 'person'
require_relative 'rental'
require_relative 'book'

person_unknown = Person.new(11)
person_carlos = Person.new(12, 'carlos')
person_jose = Person.new(19, 'jose')
person_maria = Person.new(27, 'Maria')

ruby_book = Book.new('Ruby Book', 'horacio')
java_book = Book.new('java Book', 'horacio')
cpp_book = Book.new('c++ Book', 'horacio')

carlos_rent_ruby = Rental.new('2021-01-01', person_carlos, ruby_book)
maria_rent_ruby = Rental.new('2021-01-01', person_maria, ruby_book)
maria_rent_java = Rental.new('2021-01-01', person_maria, java_book)
maria_rent_cpp = Rental.new('2021-01-01', person_maria, cpp_book)

def prints_person_n_books(person)
  puts person.name.to_s
  person.rentals.each do |rent|
    puts "  #{rent.book.title} at #{rent.date}"
  end
end

def prints_book_n_persons(book)
  puts book.title.to_s
  book.rentals.each do |rent|
    puts "  #{rent.person.name} at #{rent.date}"
  end
end

def prints_rental(rental)
  puts "#{rental.person.name} rent #{rental.book.title} at #{rental.date}"
end

puts '----- Person with rents'
prints_person_n_books(person_unknown)
prints_person_n_books(person_carlos)
prints_person_n_books(person_jose)
prints_person_n_books(person_maria)

puts "\n----- books with rents"
prints_book_n_persons(ruby_book)
prints_book_n_persons(java_book)
prints_book_n_persons(cpp_book)

puts "\n----- rentals"

prints_rental(carlos_rent_ruby)
prints_rental(maria_rent_ruby)
prints_rental(maria_rent_java)
prints_rental(maria_rent_cpp)
