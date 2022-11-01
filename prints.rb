require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative './nameable/capitalize_decorator'
require_relative './nameable/trimmer_decorator'

p 'person'
per = Person.new(19, 'carlos vivas')
p per
p per.can_use_services?

puts "\n\n"
p 'student'
stu = Student.new(60, 'Ruby', 'Stud', parent_permission: false)
p stu
p "stu.play_hooky: #{stu.play_hooky}"
p "stu.can_use_services?: #{stu.can_use_services?}"

puts "\n\n"
p 'teacher.rb'
ter = Teacher.new(12, 'TypeScript', 'Tea', parent_permission: false)
p ter
p ter.can_use_services?

puts "\n\n"
p 'decorate a class person.rb'

person = Person.new(22, 'maximilianus')
puts "person.correct_name:\n    #{person.correct_name}"
capitalizedPerson = CapitalizeDecorator.new(person)
puts "capitalizedPerson.correct_name:\n    #{capitalizedPerson.correct_name}"
capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
puts "capitalizedTrimmedPerson.correct_name:\n    #{capitalizedTrimmedPerson.correct_name}"
