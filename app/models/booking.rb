class Booking < ActiveRecord::Base
  belongs_to :renter, :class_name => :User, :foreign_key => "user_id"
  belongs_to :cat
  validates :cat_id, presence: true
  # validates :user_id, presence: true
  # validates :renting_price, presence: true
  # validates :start_time, presence: true
    # validates :end_time, presence: true

    def duration
     end_date = Date.new(end_time.year, end_time.month, end_time.day)
     start_date = Date.new(start_time.year, start_time.month, start_time.day)
     (end_date - start_date).to_i
    end
end
