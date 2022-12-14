class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book

    @book.add_rental(self)
    @person.add_rental(self)
  end
end
