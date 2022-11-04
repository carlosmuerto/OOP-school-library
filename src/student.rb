require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_reader :classroom

  def initialize(id, age, name = 'Unknown', classroom = nil, parent_permission: true)
    super(age, id, name, parent_permission: parent_permission)
    self.classroom = classroom
  end

  def classroom=(classroom)
    classroom << self if classroom && !classroom.students.include?(self)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def str_student_classroom
    "Student #{@name} #{@classroom.nil? ? 'no classroom' : @classroom.label}"
  end
end
