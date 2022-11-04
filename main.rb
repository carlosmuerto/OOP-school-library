# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength
require_relative 'app'

def puts_options
  puts '[1] - List all books.'
  puts '[2] - List all people.'
  puts '[3] - Create a person (teacher or student).'
  puts '[4] - Create a book.'
  puts '[5] - Create a rental.'
  puts '[6] - List all rentals for a given person id.'
  puts '[7] - Exit'
end

def option_in
  puts 'Please choose a option by enterin a number:'
  puts "\n"
  puts_options
  option = gets.chomp.downcase
  puts "\n"
  option
end

def main
  app = App.new

  puts 'Welcome to School Library App!'
  loop do
    case option_in
    when '1'
      # CASE [1] List all books.
      puts "List all books.\n"
      app.list_all_books
    when '2'
      # CASE [2] List all people.
      puts "List all people.\n"
      app.list_all_persons
    when '3'
      # CASE [3] Create a person (teacher or student).
      puts "Create a person (teacher or student).\n"
      app.add_person
    when '4'
      # CASE [4] Create a book.
      puts "Create a book.\n"
      app.add_book
    when '5'
      # CASE [5] Create a rental.
      puts "Create a rental.\n"
      app.add_rental
    when '6'
      # CASE [6] List all rentals for a given person id.
      puts "List all rentals for a given person id.\n"
      app.print_all_rentals_by_id
    when '7'
      # CASE [7] Exit
      puts "Exit\n"
      break
    else
      "You gave me #{option} -- I have no idea what to do with that.\n"
    end
  end
end

main

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/MethodLength
