# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Venue.create(building_name: "The Whistle Stop", address: "24 Roland St, Charleston MA")
puts "Created venue."

Course.create(title: "Lindy 1A", description: "Eight count!", time: "7:30-8:30pm", venue_id: 1)
Course.create(title: "Lindy 2A", description: "Charleston variations!", time: "8:30-9:30pm", venue_id: 1)
Course.create(title: "Lindy 1B", description: "Basic charleston!", time: "7:30-8:30pm", venue_id: 1)
Course.create(title: "Lindy 2B", description: "Mixing 6 and 8 count", time: "8:30-9:30pm", venue_id: 1)
Course.create(title: "Lindy 1A second", description: "Eight count!", time: "7:30-8:30pm", venue_id: 1)
Course.create(title: "Lindy 2C", description: "Swingout Variations!", time: "8:30-9:30pm", venue_id: 1)
puts "Created classes."

Instructor.create(full_name: "Cari Meisel", bio: "Very very very short.", email: "Cmeis@nss.com")
Instructor.create(full_name: "Andrew Selzer", bio: "Very very very opinionated.", email: "Asel@nss.com")
Instructor.create(full_name: "Katie Piscelli", bio: "Very very very friendly.", email: "Krp@nss.com")
puts "Created instructors."

Student.create(first_name: "Dang", last_name: 'Mai', email: "Dangit@gmail.com")
Student.create(first_name: "Emily", last_name: 'Kasman', email: "KSpaz@gmail.com")
Student.create(first_name: "Vera", last_name: 'Fomenkov', email: "SlythrinAlong@gmail.com")
Student.create(first_name: "Zach", last_name: 'Brass', email: "Ambidancer@gmail.com")
puts "Created students."

Registration.create(course_id: 1, student_id: 1, role: "Lead", paid: true)
Registration.create(course_id: 1, student_id: 2, role: "Follow")
Registration.create(course_id: 1, student_id: 3, role: "Follow", paid: true)
Registration.create(course_id: 2, student_id: 4, role: "Follow", paid: true)
Registration.create(course_id: 2, student_id: 1, role: "Lead", paid: true)
Registration.create(course_id: 3, student_id: 1, role: "Lead", paid: true)
Registration.create(course_id: 3, student_id: 2, role: "Follow")
Registration.create(course_id: 3, student_id: 3, role: "Follow", paid: true)
Registration.create(course_id: 4, student_id: 4, role: "Follow", paid: true)
Registration.create(course_id: 4, student_id: 1, role: "Lead", paid: true)
puts "Created registrations."

CourseInstructor.create(course_id:1, instructor_id: 1)
CourseInstructor.create(course_id:1, instructor_id: 2)
CourseInstructor.create(course_id:2, instructor_id: 3)
CourseInstructor.create(course_id:2, instructor_id: 2)
puts "Created course instructors."

d1 = Date.new(2015, 7, 7)
d2 = Date.new(2015, 7, 14)
d3 = Date.new(2015, 7, 21)
d4 = Date.new(2015, 7, 28)

d5 = Date.new(2015, 8, 4)
d6 = Date.new(2015, 8, 11)
d7 = Date.new(2015, 8, 18)
d8 = Date.new(2015, 8, 25)

d9 = Date.new(2015, 9, 1)
d10 = Date.new(2015, 9, 8)
d11 = Date.new(2015, 9, 15)
d12 = Date.new(2015, 9, 22)

MeetingDate.create(first: d1, second: d2, third: d3, fourth: d4)
MeetingDate.create(first: d5, second: d6, third: d7, fourth: d8)
MeetingDate.create(first: d9, second: d10, third: d11, fourth: d12)

puts "Created meeting dates."

CourseMeeting.create(course_id: 1, meeting_date_id: 1)
CourseMeeting.create(course_id: 2, meeting_date_id: 1)
CourseMeeting.create(course_id: 3, meeting_date_id: 2)
CourseMeeting.create(course_id: 4, meeting_date_id: 2)
CourseMeeting.create(course_id: 5, meeting_date_id: 3)
CourseMeeting.create(course_id: 6, meeting_date_id: 3)
puts "Created course meetings."
