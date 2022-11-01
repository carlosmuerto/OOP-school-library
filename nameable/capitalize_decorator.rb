require_relative 'nameable'

class CapitalizeDecorator < NameableDecorator

  def correct_name
    @nameable.correct_name.capitalize()
  end
end
