require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :venue do
    building_name "The Whistle Stop"
    address "24 Roland Street"
  end

  factory :course do
    title "Lindy 1A"
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
        course.students << FactoryGirl.create(:student)
        course.students << FactoryGirl.create(:student, full_name: "Emily Kasman")
      end
    end
  end

  factory :instructor do
    full_name "Cari Meisel"
    bio "Very very very short."
    email "Cmeis@nss.com"

    trait :with_course do
      after(:create) do |instructor|
        instructor.courses << FactoryGirl.create(:course)
      end
    end
  end

  factory :student do
    full_name "Dang Mai"
    email "Dangit@gmail.com"

    trait :with_course do
      after(:create) do |student|
        student.courses << FactoryGirl.create(:course)
      end
    end
  end
  #
  # factory :meeting_date do
  #   first Date.new(2015, 7, 7)
  #   second Date.new(2015, 7, 14)
  #   third Date.new(2015, 7, 21)
  #   fourth Date.new(2015, 7, 28)
  #
  #   course
  # end

end
