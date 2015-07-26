Venue.find_or_create_by(building_name: "The Whistle Stop", address: "24 Roland St, Charleston MA")
puts "Created venue."

Course.find_or_create_by(title: "Lindy 1A", description: "Eight Count!", time: "7:30-8:30pm", venue_id: 1)
Course.find_or_create_by(title: "Lindy 2A", description: "Charleston Variations!", time: "8:30-9:30pm", venue_id: 1)
Course.find_or_create_by(title: "Lindy 1B", description: "Basic Charleston!", time: "7:30-8:30pm", venue_id: 1)
Course.find_or_create_by(title: "Lindy 2B", description: "Mixing 6 and 8 Count", time: "8:30-9:30pm", venue_id: 1)
Course.find_or_create_by(title: "Lindy 1A second", description: "Eight Count Lindy!", time: "7:30-8:30pm", venue_id: 1)
Course.find_or_create_by(title: "Lindy 2C", description: "Swingout Variations!", time: "8:30-9:30pm", venue_id: 1)

Course.find_or_create_by(title: "Lindy 2C", description: "Swingout Variations!", time: "7:00-8:00pm", venue_id: 1)
Course.find_or_create_by(title: "Lindy 1B", description: "Basic Charleston!", time: "8:00-9:00pm", venue_id: 1)
Course.find_or_create_by(title: "Lindy 2A", description: "Charleston Variations!", time: "7:00-8:00pm", venue_id: 1)
Course.find_or_create_by(title: "Lindy 1A", description: "Eight Count!", time: "8:00-9:00pm", venue_id: 1)
Course.find_or_create_by(title: "Lindy 2B", description: "Mixing 6 and 8 Count", time: "7:00-8:00pm", venue_id: 1)
Course.find_or_create_by(title: "Lindy 1B", description: "Basic Charleston!", time: "8:00-9:00pm", venue_id: 1)

puts "Created classes."

Instructor.find_or_create_by(full_name: "Mari Ceisel", photo_url: "cari.jpg", video_url: "https://www.youtube.com/embed/Q2a5WcSuh4g", body: "Mari got her start dancing in 2009 when she accidentally tried out for Penn’s West Philly Swingers dance troupe. She was hooked from the first triple step, and hasn't stopped swinging out since! After graduating, she became involved in teaching and organizing for Lindy and Blues in Philadelphia, and picked up a serious dance-travel bug. In 2013, Cari moved to Boston to start graduate school, and, of course, to do more dancing. She loves creativity, comfortable connection, and communication in all her dances, and would be happy to talk your ear off any time about dancing, teaching ideas, and/or ways to practice dance at home alone and not wake your neighbors.", email: "Cmeis@nss.com")
Instructor.find_or_create_by(full_name: "Dandrew Belzer", photo_url: "andrew_flier.jpg", video_url: "https://www.youtube.com/embed/hlfUrVFsGI4", body: "A self proclaimed “vintage music snob with wanderlust problems,” Dandrew Belzer began swing dancing at The Pennsylvania State University (Penn State) Swing Dance Club. A native of Southern California, Dandrew had a unique swing dance upbringing from learning and dancing on both coasts of the United States. At Penn State and the central Pennsylvania area he had the opportunity to teach, DJ, and organize workshops for several years until his college graduation. His travel bug has taken him to places such as Paris, France and Herräng, Sweden, and led to experiences that have provided him with a smorgasbord of influences to bring to a classroom setting. When it comes to teaching, Dandrew's three priorities are paying attention to your partner, being inspired by the music, and putting emphasis on 'T’aint what you do it’s the way that you do it'. Some past accomplishments include: Lindustrial Revolution Jack & Jill 2010 (1st), Hot Mess Team Comp 2011 (1st), Jammin on the James Jick & Jall 2012(1st), SparX Solo Jazz 2012 (2nd)", email: "Asel@nss.com")
Instructor.find_or_create_by(full_name: "Catie Simelli", photo_url: "katie.jpg", video_url: "https://www.youtube.com/embed/pbUtG2y7PBY", body: "Catie began her dance career as a toddler in her mother’s dance studio and has since spent her years training professionally in dance and Musical Theater Performance. As dancing was always her favorite form of expression, she was thrilled to be introduced (by her hubby) to a social dance that went with every jazz song she ever loved: the Lindy Hop! She is now a regular in the Boston scene, dancing Lindy Hop as well as Balboa, West Coast, Charleston, and Authentic Solo Jazz. Katie travels out of state regularly to social dance, compete, study, and perform. She is also a passionate, high energy, and approachable teacher who focuses on how to make social dancing fun and feel great with every partner at every level. It is her greatest joy to share these dances with anyone who wants to learn.", email: "Krp@nss.com")
Instructor.find_or_create_by(full_name: "Ken Thomas", photo_url: "ken.jpg", video_url: "https://www.youtube.com/embed/puexHLZ8KQg", body: "Ken started Lindy Hopping with New School Swing when he moved to Boston in 2010, and was immediately hooked!  He took classes regularly for about two years, and still regularly takes classes at workshops and constantly social dances.  He started teaching with New School in 2014.  Ken thinks that social dancing is an excellent way to have a fun conversation with a friend or a stranger, and values equally both creativity and clear relaxed partnership.  If you social dance in Boston, you'll probably see him out.  Ask him to dance!", email: "KThom@nss.com")
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
  CourseInstructor.find_or_create_by(course: course, instructor_id: Instructor.first.id)
  CourseInstructor.find_or_create_by(course: course, instructor_id: Instructor.second.id)
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

user4 = User.find_or_create_by(email: "hawhy@user.com")
user4.password = "password"
user4.password_confirmation = "password"
user4.role = "admin"
user4.save!
Student.find_or_create_by(first_name: "Laule't'a", last_name: "Kaaaahn", email: user4.email, user: user4)
puts "Created users."

Post.find_or_create_by(title: "July Classes Up!", body: "Check out our exciting July course offerings and register today!", user: user1)
Post.find_or_create_by(title: "August Classes Up!", body: "August course offerings are up!  Check them out and register today!", user: user1)
puts "Created posts."
