# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength

require_relative 'src/book'
require_relative 'src/student'
require_relative 'src/teacher'
require_relative 'src/rental'

class App
  def initialize
    @books = []
    @teachers = []
    @students = []
    @rentals = []
    @next_id = 0
  end

  def generate_next_id
    rtn_id = @next_id
    @next_id += 1
    rtn_id
  end

  def run
    puts 'Welcome to School Library App!'
    options_case
  end

  def list_all_books
    @books.each do |book|
      puts "  #{book.title} by #{book.author}"
      puts '  rented by:'
      book.rentals.each do |rent|
        puts "    #{rent.person.name} at #{rent.date}"
      end
    end
  end

  def add_book
    print 'title: '
    title = gets.chomp
    print 'author: '
    author = gets.chomp
    @books.push(Book.new(title, author))
  end

  def list_all_persons
    puts ' ---- Students'
    @students.each do |student|
      put_str = "  [#{student.id}] #{student.name} has #{student.age}"
      put_str += " years old #{student.can_use_services? ? 'and can use services' : ''}"
      puts put_str
    end
    puts ' ---- Teachers'
    @teachers.each do |teacher|
      put_str = "  [#{teacher.id}] #{teacher.name} has #{teacher.age}"
      put_str += " years old specialized in: #{teacher.specialization}"
      puts put_str
    end
  end

  def person_info_input
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    { age: age.to_i, name: name }
  end

  def print_all_rentals
    @rentals.each do |rent|
      puts "#{rent.book.title} rented by #{rent.person.name} at #{rent.date}"
    end
  end

  def add_rental
    puts 'Select a Book from the following list by number'
    @books.each_with_index do |book, index|
      puts "[#{index}] #{book.title}"
    end
    book = @books[gets.chomp.downcase.to_i]

    persons = @teachers + @students

    puts 'Select a person from the following list by number'
    persons.each_with_index do |person, index|
      puts "[#{index}] #{person.name}"
    end
    person = persons[gets.chomp.downcase.to_i]

    print 'Date: '
    date = gets.chomp.downcase

    @rentals.push(Rental.new(date, person, book))
  end

  def add_person
    print 'Do you want to create a student [1] or teacher [2] Input the Number: '
    number = gets.chomp.downcase

    case number
    when '1' # STUDENT
      person_info = person_info_input

      print 'Has parrent permission? [Y/N]: '
      permission = gets.chomp.downcase == 'y'

      @students.push(Student.new(
                       generate_next_id,
                       person_info[:age],
                       person_info[:name],
                       parent_permission: permission
                     ))
    when '2' # TEACHER
      person_info = person_info_input

      print 'Specialization: '
      specialization = gets.chomp

      @teachers.push(Teacher.new(
                       generate_next_id,
                       person_info[:age],
                       specialization,
                       person_info[:name]
                     ))

    else
      "You gave me #{option} -- I have no idea what to do with that.\n"
    end

    # @books.push(Book.new(title, author))
  end

  private

  def option_in
    puts 'Please choose a option by enterin a number:'
    puts "\n"
    puts_options
    option = gets.chomp.downcase
    puts "\n"
    option
  end

  def options_case
    loop do
      case option_in
      when '1'
        # CASE [1] List all books.
        puts "List all books.\n"
        list_all_books
      when '2'
        # CASE [2] List all people.
        puts "List all people.\n"
        list_all_persons
      when '3'
        # CASE [3] Create a person (teacher or student).
        puts "Create a person (teacher or student).\n"
        add_person
      when '4'
        # CASE [4] Create a book.
        puts "Create a book.\n"
        add_book
      when '5'
        # CASE [5] Create a rental.
        puts "Create a rental.\n"
        add_rental
      when '6'
        # CASE [6] List all rentals for a given person id.
        puts "List all rentals for a given person id.\n"
        print_all_rentals
      when '7'
        # CASE [7] Exit
        puts "Exit\n"
        break
      else
        "You gave me #{option} -- I have no idea what to do with that.\n"
      end
    end
  end

  def puts_options
    puts '[1] - List all books.'
    puts '[2] - List all people.'
    puts '[3] - Create a person (teacher or student).'
    puts '[4] - Create a book.'
    puts '[5] - Create a rental.'
    puts '[6] - List all rentals for a given person id.'
    puts '[7] - Exit'
  end
end
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/MethodLength
