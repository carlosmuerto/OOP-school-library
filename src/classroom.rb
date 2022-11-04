class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  def push(student)
    student.classroom - student if student.classroom
    @students.push(student)
    student.classroom = self
  end

  def <<(student)
    push(student)
  end

  def delete(student)
    @students.delete(student)
    student.classroom = nil
  end

  def -(other)
    delete(other)
  end
end
