class Cat < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_by_city, :against => :city
  belongs_to :owner, :class_name => :User,:foreign_key => "user_id"
   validates :name, presence: true
   validates :description, presence: true
  # validates_inclusion_of :gender, :in => [1,2]
   validates :price, presence: true
   validates :zip_code, presence: true
   validates :city, presence: true
   validates :address, presence: true


  has_many :bookings
  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>", small: "200x200>"}

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  geocoded_by :full_address
  after_validation :geocode, if: :address_changed?

  def full_address
   [address, zip_code, city].compact.join(', ')
  end


end

