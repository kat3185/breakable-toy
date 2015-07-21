Venue.find_or_create_by(building_name: "The Whistle Stop", address: "24 Roland St, Charleston MA")
puts "Created venue."

Course.find_or_create_by(title: "Lindy 1A", description: "Eight Count!", time: "7:30-8:30pm", venue_id: 1)
Course.find_or_create_by(title: "Lindy 2A", description: "Charleston Variations!", time: "8:30-9:30pm", venue_id: 1)
Course.find_or_create_by(title: "Lindy 1B", description: "Basic Charleston!", time: "7:30-8:30pm", venue_id: 1)
Course.find_or_create_by(title: "Lindy 2B", description: "Mixing 6 and 8 Count", time: "8:30-9:30pm", venue_id: 1)
Course.find_or_create_by(title: "Lindy 1A second", description: "Eight Count!", time: "7:30-8:30pm", venue_id: 1)
Course.find_or_create_by(title: "Lindy 2C", description: "Swingout Variations!", time: "8:30-9:30pm", venue_id: 1)

Course.find_or_create_by(title: "Lindy 2C", description: "Swingout Variations!", time: "7:00-8:00pm", venue_id: 1)
Course.find_or_create_by(title: "Lindy 1B", description: "Basic Charleston!", time: "8:00-9:00pm", venue_id: 1)
Course.find_or_create_by(title: "Lindy 2A", description: "Charleston Variations!", time: "7:00-8:00pm", venue_id: 1)
Course.find_or_create_by(title: "Lindy 1A", description: "Eight Count!", time: "8:00-9:00pm", venue_id: 1)
Course.find_or_create_by(title: "Lindy 2B", description: "Mixing 6 and 8 Count", time: "7:00-8:00pm", venue_id: 1)
Course.find_or_create_by(title: "Lindy 1B", description: "Basic Charleston!", time: "8:00-9:00pm", venue_id: 1)

puts "Created classes."

Instructor.find_or_create_by(full_name: "Mari Ceisel", photo_url: "cari.jpg", video_url: "https://www.youtube.com/embed/Q2a5WcSuh4g", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", email: "Cmeis@nss.com")
Instructor.find_or_create_by(full_name: "Dandrew Belzer", photo_url: "andrew_flier.jpg", video_url: "https://www.youtube.com/embed/hlfUrVFsGI4", body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", email: "Asel@nss.com")
Instructor.find_or_create_by(full_name: "Catie Simelli", photo_url: "katie.jpg", video_url: "https://www.youtube.com/embed/pbUtG2y7PBY", body: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.", email: "Krp@nss.com")
Instructor.find_or_create_by(full_name: "Ken Thomas", photo_url: "ken.jpg", video_url: "https://www.youtube.com/embed/puexHLZ8KQg", body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?", email: "KThom@nss.com")
puts "Created instructors."

Student.find_or_create_by(first_name: "Alex", last_name: 'Smith', email: "Dangit@gmail.com")
Student.find_or_create_by(first_name: "Emiline", last_name: 'Kastman', email: "KSpaz@gmail.com")
Student.find_or_create_by(first_name: "Erica", last_name: 'Milson', email: "SlythrinAlong@gmail.com")
Student.find_or_create_by(first_name: "Joshua", last_name: 'Milson', email: "Ambidancer@gmail.com")
puts "Created students."

CourseRegistration.find_or_create_by(course_id: 1, student_id: 1, role: "Lead", paid: true)
CourseRegistration.find_or_create_by(course_id: 1, student_id: 2, role: "Follow")
CourseRegistration.find_or_create_by(course_id: 1, student_id: 3, role: "Follow", paid: true)
CourseRegistration.find_or_create_by(course_id: 2, student_id: 4, role: "Follow", paid: true)
CourseRegistration.find_or_create_by(course_id: 2, student_id: 1, role: "Lead", paid: true)
CourseRegistration.find_or_create_by(course_id: 3, student_id: 1, role: "Lead", paid: true)
CourseRegistration.find_or_create_by(course_id: 3, student_id: 2, role: "Follow")
CourseRegistration.find_or_create_by(course_id: 3, student_id: 3, role: "Follow", paid: true)
CourseRegistration.find_or_create_by(course_id: 4, student_id: 4, role: "Follow", paid: true)
CourseRegistration.find_or_create_by(course_id: 4, student_id: 1, role: "Lead", paid: true)
puts "Created registrations."

Course.all.each do |course|
  CourseInstructor.find_or_create_by(course: course, instructor_id: 1)
  CourseInstructor.find_or_create_by(course: course, instructor_id: 2)
end
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

d13 = Date.new(2015, 7, 6)
d14 = Date.new(2015, 7, 13)
d15 = Date.new(2015, 7, 20)
d16 = Date.new(2015, 7, 27)

d17 = Date.new(2015, 8, 3)
d18 = Date.new(2015, 8, 10)
d19 = Date.new(2015, 8, 17)
d20 = Date.new(2015, 8, 24)

d21 = Date.new(2015, 8, 31)
d22 = Date.new(2015, 9, 7)
d23 = Date.new(2015, 9, 14)
d24 = Date.new(2015, 9, 21)

MeetingDate.find_or_create_by(first: d13, second: d14, third: d15, fourth: d16)
MeetingDate.find_or_create_by(first: d1, second: d2, third: d3, fourth: d4)
MeetingDate.find_or_create_by(first: d17, second: d18, third: d19, fourth: d20)
MeetingDate.find_or_create_by(first: d5, second: d6, third: d7, fourth: d8)
MeetingDate.find_or_create_by(first: d21, second: d22, third: d23, fourth: d24)
MeetingDate.find_or_create_by(first: d9, second: d10, third: d11, fourth: d12)

puts "Created meeting dates."

CourseMeeting.find_or_create_by(course_id: 7, meeting_date_id: 1)
CourseMeeting.find_or_create_by(course_id: 8, meeting_date_id: 1)
CourseMeeting.find_or_create_by(course_id: 1, meeting_date_id: 2)
CourseMeeting.find_or_create_by(course_id: 2, meeting_date_id: 2)
CourseMeeting.find_or_create_by(course_id: 9, meeting_date_id: 3)
CourseMeeting.find_or_create_by(course_id: 10, meeting_date_id: 3)
CourseMeeting.find_or_create_by(course_id: 3, meeting_date_id: 4)
CourseMeeting.find_or_create_by(course_id: 4, meeting_date_id: 4)
CourseMeeting.find_or_create_by(course_id: 11, meeting_date_id: 5)
CourseMeeting.find_or_create_by(course_id: 12, meeting_date_id: 5)
CourseMeeting.find_or_create_by(course_id: 5, meeting_date_id: 6)
CourseMeeting.find_or_create_by(course_id: 6, meeting_date_id: 6)
puts "Created course meetings."

user1 = User.find_or_create_by(email: "admin@admin.com")
user1.password = "password"
user1.password_confirmation = "password"
user1.role = "admin"
user1.save!
Student.find_or_create_by(first_name: "Admin", last_name: "McAdmin", email: user1.email, user: user1)

user2 = User.find_or_create_by(email: "user@user.com")
user2.password = "password"
user2.password_confirmation = "password"
user2.save!
Student.find_or_create_by(first_name: "User1", last_name: "McUser", email: user2.email, user: user2)

user3 = User.find_or_create_by(email: "user2@user.com")
user3.password = "password"
user3.password_confirmation = "password"
user3.save!
Student.find_or_create_by(first_name: "User2", last_name: "McUser", email: user3.email, user: user3)
puts "Created users."

Post.find_or_create_by(title: "July Classes Up!", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: user1)
Post.find_or_create_by(title: "August Classes Up!", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: user1)
puts "Created posts."
