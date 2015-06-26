class Venue < ActiveRecord::Base
   has_many :courses

   validates :building_name, presence: true
   validates :address, presence: true
end
