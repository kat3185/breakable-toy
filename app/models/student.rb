class Student < ActiveRecord::Base
  has_many :registrations
  has_many :courses, through: :registrations
  has_many :registration_holders

  def full_name
    "#{first_name} #{last_name}"
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
end
