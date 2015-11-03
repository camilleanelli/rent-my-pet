class Cat < ActiveRecord::Base
  belongs_to :owner, :class_name => :User,:foreign_key => "user_id"
   validates :name, presence: true
   validates :description, presence: true
   validates :gender, presence: true
  # validates_inclusion_of :gender, :in => [1,2]
   validates :zip_code, presence: true
   validates :city, presence: true
   validates :address, presence: true


 has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/


end
