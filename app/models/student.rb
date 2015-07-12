class Student < ActiveRecord::Base
  has_many :course_registrations
  has_many :courses, through: :course_registrations
  has_many :registration_holders
  belongs_to :user
  accepts_nested_attributes_for :user

  def full_name
    "#{first_name} #{last_name}"
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
end
