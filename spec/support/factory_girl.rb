require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'

    trait :admin do
      role "admin"
    end
  end

  factory :venue do
    building_name "The Whistle Stop"
    address "24 Roland Street"
  end

  factory :course do
    sequence(:title) {|n| "Lindy #{n}A" }
    description "Eight count!"
    time "7:30-8:30pm"

    venue
    trait :with_instructors do
      after(:create) do |course|
        course.instructors << FactoryGirl.create(:instructor)
        course.instructors << FactoryGirl.create(:instructor, full_name: "Andrew Selzer")
      end
    end

    trait :with_students do
      after(:create) do |course|
        dang = FactoryGirl.create(:student)
        kspaz = FactoryGirl.create(:student,
                                   first_name: "Emiline",
                                   last_name: "Kasmspasm")
        FactoryGirl.create(:course_registration, student: dang, course: course)
        FactoryGirl.create(:course_registration, student: kspaz, course: course)
      end
    end

    trait :with_meetings do
      after(:create) do |course|
        date = FactoryGirl.create(:meeting_date)
        FactoryGirl.create(:course_meeting, meeting_date: date, course: course)
      end
    end
  end

  factory :instructor do
    full_name "Cari Meisel"
    body "Cari got her start dancing in 2009 when she accidentally tried out for Penn’s West Philly Swingers dance troupe. She was hooked from the first triple step, and hasn't stopped swinging out since! After graduating, she became involved in teaching and organizing for Lindy and Blues in Philadelphia, and picked up a serious dance-travel bug. In 2013, Cari moved to Boston to start graduate school, and, of course, to do more dancing. She loves creativity, comfortable connection, and communication in all her dances, and would be happy to talk your ear off any time about dancing, teaching ideas, and/or ways to practice dance at home alone and not wake your neighbors."
    email "Cmeis@nss.com"
    photo_url "cari.jpg"
    video_url "https://www.youtube.com/embed/Q2a5WcSuh4g"

    trait :with_course do
      after(:create) do |instructor|
        instructor.courses << FactoryGirl.create(:course)
      end
    end
  end

  factory :student do
    first_name "Dang"
    last_name "Mai"
    email "Dangit@gmail.com"

    trait :with_course do
      after(:create) do |student|
        student.courses << FactoryGirl.create(:course)
      end
    end
  end

  factory :course_registration do
    role "Follow"

    course
    student
  end

  factory :meeting_date do
    first Date.new(2015, 7, 6)
    second Date.new(2015, 7, 13)
    third Date.new(2015, 7, 20)
    fourth Date.new(2015, 7, 27)
  end

  factory :course_meeting do
    meeting_date
    course
  end

  factory :course_instructor do
    course
    instructor
  end

  factory :course_review do
    body "I am a course review!"
  end

  factory :post do
    title "New classes!"
    body "Lorum ipsum suuuuuuum Lorum ipsum suuuuuuum Lorum ipsum suuuuuuum Lorum ipsum suuuuuuum Lorum ipsum suuuuuuum Lorum ipsum suuuuuuum Lorum ipsum suuuuuuum !!!!!!"

    user
  end
end
