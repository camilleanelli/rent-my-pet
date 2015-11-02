class Cat < ActiveRecord::Base
  belongs_to :owner, :class_name => :User,:foreign_key => "user_id"
  validates :name, presence: true
  validates :description, presence: true
  validates :gender, presence: true
  validates_inclusion_of :gender, :in => ["male","female"]
  validates :zip_code, presence: true
  validates :city, presence: true
  validates :address, presence: true
end
