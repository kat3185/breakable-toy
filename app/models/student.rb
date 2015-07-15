class Student < ActiveRecord::Base
  has_many :course_registrations
  has_many :courses, through: :course_registrations
  has_many :registration_holders
  belongs_to :user
  accepts_nested_attributes_for :user

  def full_name
    "#{first_name} #{last_name}"
  end

  def assign_user(current_user)
    if current_user.student.nil?
      self.user = current_user
      current_user.student = self
    end
  end

  def owes_money?(month)
    dates = MeetingDate.where('extract(month from third) = ?', month)
    registrations = Array.new
    dates.each do |date|
      self.courses.each do |course|
        if course.meeting_dates.first == date
          registrations << course
        end
      end
    end
    payment_status = registrations.map { |course| course.course_registrations.where(student_id: self.id).first.paid }
    unpaid_classes = payment_status.count(false)
    if unpaid_classes < 1
      return false
    else
      paid_classes = payment_status.count(true)
      if paid_classes > 1
        registrations.each do |registration|
          registration.paid = true
        end
        return false
      elsif paid_classes == 1
        return 4000
      else
        if unpaid_classes == 1
          return 5000
        else
          return 9000
        end
      end
    end
  end
  #please refactor this monstrosity.  Right now it returns false if the student owes no
  #money for the entered month, and returns the value owed in cents if the student does
  #owe money

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
end
