class Booking < ActiveRecord::Base
  belongs_to :renter, :class_name => :User, foreign_key => "user_id"
  belongs_to :cat
end
