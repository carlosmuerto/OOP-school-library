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

  def choose_person_input
    persons = {}

    @teachers.each do |teacher|
      persons[teacher.id] = teacher
    end

    @students.each do |student|
      persons[student.id] = student
    end

    persons_sorted = persons.sort.to_h

    puts 'Select a person from the following list by id'
    persons_sorted.each do |id, person|
      puts "[#{id}] #{person.name}"
    end
    persons[gets.chomp.downcase.to_i]
  end

  def choose_book_input
    puts 'Select a Book from the following list by number'
    @books.each_with_index do |book, index|
      puts "[#{index}] #{book.title}"
    end

    @books[gets.chomp.downcase.to_i]
  end

  def print_all_rentals_by_id
    person = choose_person_input
    puts "\n"
    @rentals.each do |rent|
      puts "#{rent.book.title} rented by #{rent.person.name} at #{rent.date}" if rent.person == person
    end
    puts "\n"
  end

  def add_rental
    book = choose_book_input

    person = choose_person_input

    print 'Date: '
    date = gets.chomp.downcase

    @rentals.push(Rental.new(date, person, book))
  end

  def add_student
    person_info = person_info_input

    print 'Has parrent permission? [Y/N]: '
    permission = gets.chomp.downcase == 'y'

    @students.push(Student.new(
                     generate_next_id,
                     person_info[:age],
                     person_info[:name],
                     parent_permission: permission
                   ))
  end

  def add_teacher
    person_info = person_info_input

    print 'Specialization: '
    specialization = gets.chomp

    @teachers.push(Teacher.new(
                     generate_next_id,
                     person_info[:age],
                     specialization,
                     person_info[:name]
                   ))
  end

  def add_person
    print 'Do you want to create a student [1] or teacher [2] Input the Number: '
    number = gets.chomp.downcase

    case number
    when '1' # STUDENT
      add_student
    when '2' # TEACHER
      add_teacher
    else
      "You gave me #{option} -- I have no idea what to do with that.\n"
    end
  end
end
