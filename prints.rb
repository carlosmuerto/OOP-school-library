require_relative 'person'
require_relative 'student'
require_relative 'teacher'

p 'person'
per = Person.new(19)
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
