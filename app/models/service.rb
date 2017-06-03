class Service < ApplicationRecord

  has_many :reviews, :dependent => :destroy
  # alias_attribute :owner, :user
  alias_attribute :owner, :student
  validates :title, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :rating, inclusion: { in: [1,2,3,4,5], allow_nil: true }

  belongs_to :student, optional: true
  validates_associated :student

  monetize :price_pennies

  mount_uploader :picture, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  CATEGORIES = ["Content", "Social Media", "Design", "Research"]

end
