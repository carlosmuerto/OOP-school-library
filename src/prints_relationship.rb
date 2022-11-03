require_relative 'classroom'
require_relative 'student'

ruby_class = Classroom.new('Ruby')
javascript_class = Classroom.new('javascript')
std_carlos = Student.new(12, 'carlos', ruby_class)
std_jose = Student.new(19, 'jose', javascript_class)
std_maria = Student.new(27, 'Maria', ruby_class)
std_horacio = Student.new(30, 'Horacio')

puts '----------------STUDENTs'
puts std_carlos.str_student_classroom
puts std_jose.str_student_classroom
puts std_maria.str_student_classroom
puts std_horacio.str_student_classroom

puts "\n"

puts "ruby_class------- #{ruby_class.students.length}}"
ruby_class.students.each do |std|
  puts "  #{std.name}"
end

puts "javascript_class------- #{javascript_class.students.length}}"
javascript_class.students.each do |std|
  puts "  #{std.name}"
end

puts "\n"
puts "\n"
std_maria.classroom = javascript_class
puts "change Student #{std_maria.name} from ruby_class to javascript_class"

javascript_class.delete(std_jose)
puts "delete Student #{std_jose.name} from javascript_class"

ruby_class << std_horacio
puts "add Student #{std_horacio.name} to ruby_class"

puts "\n"
puts "\n"

puts '----------------STUDENTs'
puts std_carlos.str_student_classroom
puts std_jose.str_student_classroom
puts std_maria.str_student_classroom
puts std_horacio.str_student_classroom

puts "\n"

puts "ruby_class------- #{ruby_class.students.length}}"
ruby_class.students.each do |std|
  puts "  #{std.name}"
end

puts "javascript_class------- #{javascript_class.students.length}}"
javascript_class.students.each do |std|
  puts "  #{std.name}"
end
