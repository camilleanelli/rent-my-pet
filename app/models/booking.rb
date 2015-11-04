class Booking < ActiveRecord::Base
  belongs_to :renter, :class_name => :User, :foreign_key => "user_id"
  belongs_to :cat
  validates :cat_id, presence: true
  # validates :user_id, presence: true
  # validates :renting_price, presence: true
  # validates :start_time, presence: true
  # validates :end_time, presence: true

end
